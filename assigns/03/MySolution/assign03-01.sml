(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
//
HX-2023-02-09: 10 points
//
The function find_root(f0)
finds the first root of [f0] in
the following sequence:
0, 1, -1, 2, -2, 3, -3, 4, -4, ...
*)
(*
fun
find_root(f0: int -> int): int = ...
*)

(* ****** ****** *)
fun
find_root(f0: int -> int): int =
let
exception ZERO of int 
  fun find_root_helper(x: int): int =
   if f0(x) = 0
   then raise ZERO(x)
   else if f0(~x) = 0
   then raise ZERO(~x)
   else
   find_root_helper(x+1)
in
  find_root_helper(0) handle ZERO(x) =>x
end


(* end of [CS320-2023-Spring-assign03-01.sml] *)