(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-02-16: 10 points
Please give a NON-RECURSIVE implementation
of isPrime that is based on combinators in
the mysmlib-library for this class.
*)

(* ****** ****** *)

(*
fun
isPrime(n0: int): bool =
let
fun
loop(i0: int): bool =
if
(i0 * i0 > n0)
then true else
(if n0 mod i0 = 0 then false else loop(i0+1))
in
  if n0 >= 2 then loop(2) else false
end
*)

val isPrime = fn(n0:int)=>
    if n0<=1
    then false
    else int1_forall(n0, fn(i) => if i>=2 then n0 mod i<>0 else true)
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-01.sml] *)
