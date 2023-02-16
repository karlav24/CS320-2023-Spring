(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

fun list_longest_ascend(xs: int list): int list
*)

(* ****** ****** *)

fun checkLength (xs: int list, ys: int list): int list =
    if list_length(xs) >= list_length(ys)
    then xs
    else ys

fun longest_tail(xs: int list): int list =
    case xs of 
    [] => []
    |
    [x] => [x]
    |
    x1::x2::xs =>
    	       if x1<=x2
	       then checkLength(x1::longest_tail(x2::xs), longest_tail(x1::xs)) 
	       else longest_tail(x1::xs)
  

fun list_longest_ascend(xs: int list): int list =
    let fun list_help(xs: int list, ys: int list)=
    	case xs of
	[] => ys
	|
	x1::xs =>
	       let val zs = longest_tail(x1::xs)
	       in
	         if list_length(zs) > list_length(ys)
		 then list_help(xs,zs)
		 else list_help(xs,ys)
	       end
    in
      list_help(xs,[])
    end
(* end of [CS320-2023-Spring-assign03-04.sml] *)
