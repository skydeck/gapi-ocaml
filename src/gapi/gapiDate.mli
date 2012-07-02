(** Datetime data type.
  *)

type t = Nldate.t

val epoch : Nldate.t

val now : unit -> Nldate.t

val to_string : ?time:bool -> t -> string

val of_string : string -> t
