open GapiUtils.Infix
open GapiLens.Infix
open GapiDiscovery

let base_path = "tools/"


(* Download service description document *)

let do_request interact =
  let state = GapiCurl.global_init () in
  let result =
    GapiConversation.with_session
      GapiConfig.default
      state
      interact
  in
    ignore (GapiCurl.global_cleanup state);
    result

let get_service_description api version nocache =
  let file_name = base_path ^ api ^ "." ^ version ^ ".json" in
    if not (Sys.file_exists file_name) || nocache then begin
      Printf.printf "Downloading %s %s service description to file %s...%!"
        api version file_name;
      let document =
        do_request
          (fun session ->
             GapiDiscoveryService.ApisResource.getRest
               ~api
               ~version
               session
             |> fst) in
      let () = print_endline "Done" in
      let tree = RestDescription.to_data_model document in
      let json = GapiJson.data_model_to_json tree in
      let () = Json_io.save_json file_name json in
        document
    end else begin
      Printf.printf "Reusing %s %s service description file %s\n%!"
        api version file_name;
      let json = Json_io.load_json file_name in
      let tree = GapiJson.json_to_data_model json in
        RestDescription.of_data_model tree
    end


(* Generate OCaml source files *)

(* Parameters and properties *)
module ScalarType =
struct
  type format_t =
      NoFormat
    | DateTimeFormat
    | DateFormat
    | TimeFormat
    | Int32Format
    | Int64Format
    | OtherFormat of string

  let format_of_string = function
      "" -> NoFormat
    | "date-time" -> DateTimeFormat
    | "date" -> DateFormat
    | "time" -> TimeFormat
    | "int32" -> Int32Format
    | "int64" -> Int64Format
    | s -> OtherFormat s

  type location_t =
      NoLocation
    | Query
    | Path

  let location_of_string = function
      "" -> NoLocation
    | "query" -> Query
    | "path" -> Path
    | s -> failwith ("Unexpected location " ^ s)

  let is_scalar json_schema =
    match json_schema.JsonSchema._type with
        "string"
      | "boolean"
      | "integer" -> true
      | _ -> false

  type t = {
    original_type : string;
    description : string;
    default : string;
    required : bool;
    format : format_t;
    pattern : string;
    minimum : string;
    maximum : string;
    enum : string list;
    enumDescriptions : string list;
    repeated : bool;
    location : location_t;
  }

  let create json_schema =
    if not (is_scalar json_schema) then
      failwith ("Unexpected non-scalar type: " ^ json_schema.JsonSchema._type)
    else
      { original_type = json_schema.JsonSchema._type;
        description = json_schema.JsonSchema.description;
        default = json_schema.JsonSchema.default;
        required = json_schema.JsonSchema.required;
        format = format_of_string json_schema.JsonSchema.format;
        pattern = json_schema.JsonSchema.pattern;
        minimum = json_schema.JsonSchema.minimum;
        maximum = json_schema.JsonSchema.maximum;
        enum = json_schema.JsonSchema.enum;
        enumDescriptions = json_schema.JsonSchema.enumDescriptions;
        repeated = json_schema.JsonSchema.repeated;
        location = location_of_string json_schema.JsonSchema.location;
      }

  type data_t =
      String
    | Boolean
    | Integer
    | DateTime
    | Date

  let get_data_type st =
    match st.original_type with
        "boolean" -> Boolean
      | "integer" -> Integer
      | "string" ->
          begin match st.format with
              DateTimeFormat -> DateTime
            | DateFormat -> Date
            | _ -> String
          end
      | _ ->
          failwith ("Unexpected original type: " ^ st.original_type)

  let data_type_to_string = function
      String -> "string"
    | Boolean -> "bool"
    | Integer -> "int"
    | DateTime -> "GapiDate.t"
    | Date -> "GapiDate.t"

end

module ComplexType =
struct
  let is_reference json_schema =
    json_schema.JsonSchema._ref <> ""

  let is_complex json_schema =
    match json_schema.JsonSchema._type with
        "object"
      | "array" -> true
      | _ -> false

  type data_t =
      Scalar of ScalarType.t
    | Object of (string * t) list
    | Array of t
    | Reference of string
    | Dynamic of t
  and t = {
    id : string;
    data_type : data_t;
    original_type : string;
    description : string;
  }

  let rec data_type_to_string = function
      Scalar scalar ->
        scalar |> ScalarType.get_data_type |> ScalarType.data_type_to_string
    | Reference type_name ->
        type_name ^ ".t"
    | Array inner_type ->
        (data_type_to_string inner_type.data_type) ^ " list"
    | _ ->
        ""

  let get_references complex_type =
    let merge xs ys =
      List.fold_left
        (fun zs x ->
           if List.mem x zs then
             zs
           else
             x :: zs)
        ys
        xs
    in

    let rec loop complex_type' accu =
      match complex_type'.data_type with
        | Reference type_name ->
            type_name :: accu
        | Array inner_type ->
            loop inner_type accu
        | Object properties ->
            List.fold_left
              (fun a (_, prop) ->
                 let refs = loop prop accu in
                   merge a refs)
              accu
              properties
        | Scalar _
        | _ ->
            accu
    in
      loop complex_type []

  let is_anonymous complex_type =
    complex_type.id = ""

  let rec create json_schema =
    let create_object () =
      match json_schema.JsonSchema.additionalProperties with
          None -> Object (List.map
                            (fun (n, v) -> (n, create v))
                            json_schema.JsonSchema.properties)
            | Some p -> Dynamic (create p)
    in

    let create_array () =
      Array (json_schema.JsonSchema.items
               |> Option.get
               |> create)
    in

    let create_complex () =
      match json_schema.JsonSchema._type with
          "object" -> create_object ()
        | "array" -> create_array ()
        | _ ->
            failwith ("Unexpected complex type: "
                      ^ json_schema.JsonSchema._type)
    in

    let create_reference () =
      Reference json_schema.JsonSchema._ref
    in

    let create_scalar () =
        Scalar (ScalarType.create json_schema)
    in

    let data_type =
      if is_reference json_schema then
        create_reference ()
      else if is_complex json_schema then
        create_complex ()
      else
        create_scalar ()
    in
      { id = json_schema.JsonSchema.id;
        data_type;
        original_type = json_schema.JsonSchema._type;
        description = json_schema.JsonSchema.description;
      }

end

module TypeTable =
struct
  type t = (string, ComplexType.t) Hashtbl.t

  let create complex_types =
    let table = Hashtbl.create 64 in
      List.iter
        (fun complex_type ->
           if not (ComplexType.is_anonymous complex_type) then
             Hashtbl.add table complex_type.ComplexType.id complex_type)
        complex_types;
      table

  let sort table =
    let get_references id complex_type =
      let rec loop id' complex_type' accu =
        let references = ComplexType.get_references complex_type' in
        let full_references =
          List.fold_left
            (fun a r ->
               let referenced_type = Hashtbl.find table r in
                 loop r referenced_type a)
            accu
            references
        in
          (id', complex_type') :: full_references
      in
        loop id complex_type []
    in

    let merge xs ys =
      List.fold_right
        (fun (k, v) zs ->
           if List.mem_assoc k zs then
             zs
           else
             (k, v) :: zs)
        xs
        ys
    in

    let complex_types =
      Hashtbl.fold
        (fun id complex_type sorted ->
           Printf.printf "id=%s\n" id;
           if List.mem_assoc id sorted then
             sorted
           else
             let references = get_references id complex_type in
               print_string "References: ";
           List.iter (fun (id, _) -> Printf.printf "id=%s;" id) references;
               print_string "\nSorted: ";
           List.iter (fun (id, _) -> Printf.printf "id=%s;" id) sorted;
           print_newline ();
               merge references sorted
           )
        table
        []
    in
      List.rev_map snd complex_types

end

module Record =
struct
  type field = {
    name : string;
    field_type : ComplexType.t;
  }
  type t = field list

end

module InnerModule =
struct
  type t = {
    name : string;
    record : Record.t;
  }

end

module Module =
struct
  type file_type =
      SchemaModule
    | SchemaModuleInterface
    | ServiceModule
    | ServiceModuleInterface

  type t = {
    name : string;
    file_name : string;
    file_type : file_type;
    inner_modules : InnerModule.t list;
  }

  let create service_name file_type =
    let module_base_name =
      "Gapi" ^ (String.capitalize service_name) in
    let name =
      match file_type with
          SchemaModule
        | SchemaModuleInterface -> module_base_name
        | ServiceModule
        | ServiceModuleInterface -> module_base_name ^ "Service" in
    let extension =
      match file_type with
          SchemaModule
        | ServiceModule -> ".ml"
        | SchemaModuleInterface
        | ServiceModuleInterface -> ".mli" in
    let file_name =
      base_path ^ (String.uncapitalize name) ^ extension
    in
      { name; file_name; file_type; inner_modules = [] }

end

let open_file file_name =
  let oc = open_out file_name in
  let formatter = Format.formatter_of_out_channel oc in
    (oc, formatter)

let close_file oc formatter =
  Format.fprintf formatter "@?";
  close_out oc

let build_schema_inner_module complex_type type_table formatter =
  Format.fprintf formatter
    "module %s =@\n@[<v 2>struct@,@[<v 2>type t = {@,"
    complex_type.ComplexType.id;
  begin match complex_type.ComplexType.data_type with
      ComplexType.Object properties ->
        List.iter
          (fun (name, property) ->
             Format.fprintf formatter
               "%s : %s;@,"
               name (ComplexType.data_type_to_string
                       property.ComplexType.data_type))
          properties;
    | _ -> ()
  end;
  Format.fprintf formatter "@]@,}@,";
  Format.fprintf formatter "@]@\nend@\n@\n"

let build_schema_module service_name complex_types type_table =
  let new_module =
    Module.create service_name Module.SchemaModule in
  let () =
    Printf.printf "Building schema module %s (%s)...%!"
      new_module.Module.name new_module.Module.file_name in
  let (oc, formatter) = open_file new_module.Module.file_name in
    List.iter
      (fun complex_type ->
         build_schema_inner_module complex_type type_table formatter)
      complex_types;
    close_file oc formatter;
    print_endline "Done"

let build_schema_module_interface service =
  ()

let build_service_module service =
  ()

let build_service_module_interface service =
  ()

let generate_code service =
  let complex_types =
    List.map
      (fun (_, s) -> ComplexType.create s)
      service.RestDescription.schemas in
  let type_table = 
    TypeTable.create complex_types in
  let sorted_complex_types =
    TypeTable.sort type_table
  in
    print_newline ();
    List.iter (fun t -> print_endline t.ComplexType.id) sorted_complex_types;
    build_schema_module
      service.RestDescription.name
      sorted_complex_types
      type_table;
    build_schema_module_interface service;
    build_service_module service;
    build_service_module_interface service

(* Argument parsing and program entry point *)

let _ =
  let api = ref "" in
  let version = ref "" in
  let nocache = ref false in
  let usage =
    "Usage: " ^ Sys.executable_name ^ " -api apiname -version apiver [-nocache]" in
  let arg_specs =
    Arg.align (
      ["-api",
       Arg.Set_string api,
       "apiname The name of the API.";
       "-version",
       Arg.Set_string version,
       "apiver The version of the API.";
       "-nocache",
       Arg.Set nocache,
       " Downloads the service description, ignoring locally saved versions"
      ]) in
  let () =
    Arg.parse
      arg_specs
      (fun s -> raise (Arg.Bad ("Unexpected argument: " ^ s)))
      usage in

  (* Test *)
  let _ =
    api := "urlshortener";
    version := "v1"
  in

  let _ =
    if !api = "" || !version = "" then begin
      prerr_endline "API name and version are required.";
      prerr_endline usage;
      exit 1
    end in
  let service = get_service_description !api !version !nocache in
    generate_code service

