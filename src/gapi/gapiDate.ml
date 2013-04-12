(* TODO: use Ocamlnet 3 functions *)
type t = Nldate.t

let epoch = Nldate.create 0.0

let now () = Nldate.create (Unix.time ())

let to_string ?(time = true) date =
  let timezone = Nldate.format ~fmt:"%z" date in
  let tz =
    if timezone = "+0000" then
      "Z"
    else
      let tz_hour = String.sub timezone 0 3 in
      let tz_minute = String.sub timezone 3 2 in
        tz_hour ^ ":" ^ tz_minute in
    if time then
      let result = Nldate.format ~fmt:"%Y-%m-%dT%T" date in
        result ^ ".000" ^ tz
    else
      Nldate.format ~fmt:"%Y-%m-%d" date

let rfc3339_regexp = Str.regexp "^\\([0-9][0-9][0-9][0-9]\\)-\\([0-9][0-9]\\)-\\([0-9][0-9]\\)\\(T\\([0-9][0-9]\\):\\([0-9][0-9]\\):\\([0-9][0-9]\\)\\(\\.[0-9]+\\)?\\(Z\\|\\([-+]\\)\\([0-9][0-9]\\):\\([0-9][0-9]\\)\\)\\)?$"

let of_string date_string =
  let matched n =
    Str.matched_group n date_string in
  let parse_int n =
    int_of_string (matched n) in
  let matches = Str.string_match rfc3339_regexp date_string 0 in
    if matches then
      begin
        let year = parse_int 1 in
        let month = parse_int 2 in
        let day = parse_int 3 in
        let full_date = {
          epoch with
              Nldate.year;
              month;
              day = day;
              week_day = -1
        } in
          try
            let hour = parse_int 5 in
            let minute = parse_int 6 in
            let second = parse_int 7 in
            let timezone = matched 9 in
            let (tz_sign, tz_hour, tz_minute) =
              if timezone = "Z" then
                (1, 0, 0)
              else
                let sign = matched 10 in
                  ((if sign = "+" then 1 else -1), parse_int 11, parse_int 12)
            in
              { full_date with
                    Nldate.hour = hour;
                    minute = minute;
                    second = second;
                    zone = tz_sign * (tz_hour * 60 + tz_minute);
                    week_day = -1
              }
          with Not_found ->
            full_date
      end
    else
      failwith ("Invalid RFC3339 date: " ^ date_string)
