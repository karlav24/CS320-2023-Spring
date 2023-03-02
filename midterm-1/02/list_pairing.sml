(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-01: 10 points
*)
(* ****** ****** *)
(*
Given a list xs, list_pairing(xs) returns
a list of pairs and an option; the 1st pair
consists of the first and last elements in xs,
and the 2nd pair consists of the second and the
second last elements in xs, and so on and so forth;
and the option is NONE if |xs| is even, and it is
SOME(xm) if |xs| is odd and xm is the middle element
in xs.
//
For instance, we have:
//
list_pairing([]) = ([], NONE)
list_pairing([1]) = ([], SOME(1))
list_pairing([1,2]) = ([(1,2)], NONE)
list_pairing([1,2,3]) = ([(1,3)], SOME(2))
list_pairing([1,2,3,4]) = ([(1,4),(2,3)], NONE)
//
*)
(* ****** ****** *)
(*
fun
list_pairing
(xs: 'a list): ('a * 'a) list * 'a option = ...
*)
fun
list_sub(xs: 'a list, itr: int): 'a =
	if itr = 0 then hd(xs)
	else list_sub(tl(xs), itr-1)	
    
fun list_pairing(xs: 'a list): ('a * 'a) list * 'a option =
    let
        val rev = list_reverse(xs)
        val mid = list_length(xs) div 2
        fun pair_aid(xs: 'a list, ys: 'a list, itr: int): ('a * 'a) list =
            if itr = 0 then nil
            else (case xs of
                nil => nil
              | x1::xs' => [(x1, hd(ys))] @ pair_aid(xs', tl(ys), itr-1)
            )
    in
        (case list_length(xs) mod 2 = 0 of
            true => (pair_aid(xs, rev, list_length(xs)), NONE)
          | false => (pair_aid(xs, rev, list_length(xs)), SOME(list_sub(xs, mid)))
        )
    handle _ => (nil, NONE)
    end


(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_pairing.sml] *)
