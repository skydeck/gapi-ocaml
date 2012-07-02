open Extlib

module OcamlnetPipe =
struct
  type t = {
    netpipe : Nlchannels.pipe;
    outfilter : Nlchannels.output_filter option;
  }

  let create ?out_channel () =
    let netpipe = new Nlchannels.pipe () in
    let outfilter =
      Option.map
        (fun ch ->
           new Nlchannels.output_filter
             netpipe
             ch)
        out_channel
    in
      { netpipe;
        outfilter;
      }

  let read_byte p =
    p.netpipe#input_byte ()

  let read_string p len =
    let result = String.create len in
      ignore (p.netpipe#input result 0 len);
      result

  let read_line p =
    p.netpipe#input_line ()

  let out_ch p =
    Option.default
      (p.netpipe :> Nlchannels.out_obj_channel)
      p.outfilter

  let write_byte p b =
    let ch = out_ch p in
      ch#output_byte b

  let write_string p s =
    let ch = out_ch p in
      ch#output_string s

  let end_reading p =
    p.netpipe#close_in ()

  let end_writing p =
    p.netpipe#close_out ();
    Option.may (fun ch -> ch#close_out ()) p.outfilter

end
