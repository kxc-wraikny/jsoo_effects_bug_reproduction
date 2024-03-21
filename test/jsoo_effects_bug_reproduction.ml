module Fut = Prr.Fut
module Tc = Tezt_core
module Tj = Tezt_js

module Lwt_util = struct
  (* Lwt Util *)
  let lwt_of_fut : 'a. 'a Fut.t -> 'a Lwt.t =
    fun fut ->
    let p, res = Lwt.wait () in
    Fut.await fut (fun x -> Lwt.wakeup_later res x);
    p
end

module Test_util = struct
  (* Test Util *)
  let registerTests tests =
    tests
    |> List.iter (fun (title, tags, f, loc) -> Tc.Test.register ~__FILE__:loc ~title ~tags f)
  let describe ~__FILE__:loc desc ?(tags = []) tests =
    tests
    |> List.map (fun (title, ttags, f) -> desc ^ " - " ^ title, tags @ ttags, f, loc)
    |> registerTests
  let it title ?(tags = []) f = title, tags, f
end

open Lwt_util
open Test_util

let () =
  let (>>=) = Fut.bind in
  describe ~__FILE__ ~tags:[ "pure" ] "plus"
    [ it "should return 2 by 1, 1" (fun () ->
        Tc.Check.((1 + 1 = 2) int) ~error_msg:"expected 1 + 1 = %R, got %L";
        Tc.Base.unit);
      it "should return 3 by 1, 2" (fun () ->
        Tc.Check.((1 + 2 = 3) int) ~error_msg:"expected 1 + 2 = %R, got %L";
        Tc.Base.unit);
    ];
  describe ~__FILE__ ~tags:[ "pure" ] "Fux obj"
    [ it "can trans to lwt" (fun () ->
        let t =
          Fut.tick ~ms:100 >>= fun () ->
          Printf.printf "waited"; Fut.return () in
        lwt_of_fut t);
    ];
  Tj.Test.run ()
