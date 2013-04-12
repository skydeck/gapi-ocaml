(* Warning! This file is generated. Modify at your own risk. *)
open Extlib
open GapiUtils.Infix
open GapiPredictionV1_5Model

module Scope =
struct
  let devstorage_full_control = "https://www.googleapis.com/auth/devstorage.full_control"

  let devstorage_read_only = "https://www.googleapis.com/auth/devstorage.read_only"

  let devstorage_read_write = "https://www.googleapis.com/auth/devstorage.read_write"

  let prediction = "https://www.googleapis.com/auth/prediction"


end

module HostedmodelsResource =
struct
  let predict
        ?(base_url = "https://www.googleapis.com/prediction/v1.5/")
        ?std_params
        ~hostedModelName
        input
        session =
    let full_url = GapiUtils.add_path_to_url ["hostedmodels";
      ((fun x -> x) hostedModelName); "predict"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json Input.to_data_model) ~data:input
      full_url (GapiJson.parse_json_response Output.of_data_model) session


end

module TrainedmodelsResource =
struct
  module TrainedmodelsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* trainedmodels-specific query parameters *)
      maxResults : int;
      pageToken : string;

    }

    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 0;
      pageToken = "";

    }

    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";

    ] |> List.concat

    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        maxResults;
        pageToken;

      } in
      if parameters = default then None else Some parameters

  end

  let analyze
        ?(base_url = "https://www.googleapis.com/prediction/v1.5/")
        ?std_params
        ~id
        session =
    let full_url = GapiUtils.add_path_to_url ["trainedmodels";
      ((fun x -> x) id); "analyze"] base_url in
    let params = TrainedmodelsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      TrainedmodelsParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Analyze.of_data_model) session

  let delete
        ?(base_url = "https://www.googleapis.com/prediction/v1.5/")
        ?std_params
        ~id
        session =
    let full_url = GapiUtils.add_path_to_url ["trainedmodels";
      ((fun x -> x) id)] base_url in
    let params = TrainedmodelsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      TrainedmodelsParameters.to_key_value_list params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session

  let get
        ?(base_url = "https://www.googleapis.com/prediction/v1.5/")
        ?etag
        ?std_params
        ~id
        session =
    let full_url = GapiUtils.add_path_to_url ["trainedmodels";
      ((fun x -> x) id)] base_url in
    let params = TrainedmodelsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      TrainedmodelsParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Training.of_data_model) session

  let insert
        ?(base_url = "https://www.googleapis.com/prediction/v1.5/")
        ?std_params
        training
        session =
    let full_url = GapiUtils.add_path_to_url ["trainedmodels"] base_url in
    let params = TrainedmodelsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      TrainedmodelsParameters.to_key_value_list params in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json Training.to_data_model)
      ~data:training full_url
      (GapiJson.parse_json_response Training.of_data_model) session

  let predict
        ?(base_url = "https://www.googleapis.com/prediction/v1.5/")
        ?std_params
        ~id
        input
        session =
    let full_url = GapiUtils.add_path_to_url ["trainedmodels";
      ((fun x -> x) id); "predict"] base_url in
    let params = TrainedmodelsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      TrainedmodelsParameters.to_key_value_list params in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json Input.to_data_model) ~data:input
      full_url (GapiJson.parse_json_response Output.of_data_model) session

  let update
        ?(base_url = "https://www.googleapis.com/prediction/v1.5/")
        ?std_params
        ~id
        update
        session =
    let full_url = GapiUtils.add_path_to_url ["trainedmodels";
      ((fun x -> x) id)] base_url in
    let params = TrainedmodelsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      TrainedmodelsParameters.to_key_value_list params in
    GapiService.put' ?query_parameters
      ~data_to_post:(GapiJson.render_json Update.to_data_model) ~data:update
      full_url (GapiJson.parse_json_response Training.of_data_model) session


end
