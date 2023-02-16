(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
The function list_tabulate takes an integer
[n] and a function [f] and returns a list that
equals [f(0), f(1), ..., f(n-1)]
//
list_tabulate(n: int, f: int -> 'a): 'a list
//
*)
fun list_tabulate(n: int, f: int-> 'a): 'a list = 
	let
		fun list_tabulate_helper( f: int -> 'a, start: int, finish: int): 'a list = 
			if start = finish then [] 
			else f(start) :: list_tabulate_helper(f, start+1, finish)
	in
		list_tabulate_helper(f, 0, n)
	end
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-03.sml] *)
