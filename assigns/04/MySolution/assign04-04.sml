(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-16: 30 points
//
Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html
//
Please give a NON-RECURSIVE implementation that solves the 8-queen puzzle.
//
type board_t =
int * int * int * int * int * int * int * int
//
fun
queen8_puzzle_solve(): board_t list =
(*
returns a list of boards consisting of all the solutions to the puzzle.
*)
//
*)
type board_t =
int * int * int * int * int * int * int * int

val board_set = fn(bd: board_t, row: int, col:int) => 
	let
	val (x0, x1, x2, x3, x4, x5, x6, x7) = bd
	in
	(case row of 1 => (col, x1, x2, x3, x4, x5, x6, x7)
	|2 => (x0, col, x2, x3, x4, x5, x6, x7)
	|3 => (x0, x1, col, x3, x4, x5, x6, x7)
	|4 => (x0, x1, x2, col, x4, x5, x6, x7)
	|5 => (x0, x1, x2, x3, col, x5, x6, x7)
	|6 => (x0, x1, x2, x3, x4, col, x6, x7)
	|7 => (x0, x1, x2, x3, x4, x5, col, x7)
	|8 => (x0, x1, x2, x3, x4, x5, x6, col)
	|row => bd )
	end

val board_get = fn(bd:board_t, row:int) =>
	let 
	val (x0, x1, x2, x3, x4, x5, x6, x7) = bd
	exception OutOfBound		
	in (case row of 1 => x0
	| 2 => x1
	| 3 => x2
	| 4 => x3
	| 5 => x4
	| 6 => x5
	| 7 => x6
	| 8 => x7	
	| i0 => raise OutOfBound
	) 
	end

val safety1 = fn(row0:int, col0:int, row:int, col:int) =>
	not(col0 = col) = not( abs(row0-row) = abs(col0-col))

val safety2 = fn(row0:int, col0:int, bd:board_t) =>
        int1_forall(row0-1, fn(i0) => safety1(row0, col0, row0-1-i0, board_get(bd, row0-1-i0)));

val search= fn(add:int list, acum: board_t list, bd: board_t, row:int) => 
list_reduce_left(add, acum, fn(r0, x0) => 
if safety2(row, x0, bd) then r0 @ [board_set(bd, row, x0)] else r0) 

val unfolder = fn(xs:board_t list list) => list_reduce_left(xs, [], fn(r0, x1) => x1 @ r0)
val search_cont = fn(add:int list, b_l:board_t list, row:int) =>
unfolder(list_map(b_l, fn(x0) => search(add, [], x0, row)))

val N = 8

fun queen8_puzzle_solve():board_t list =
	let 
		val add = [1,2,3,4,5,6,7,8]
		val board = (0,0,0,0,0,0,0,0)
	in
		list_reduce_left(add, [board], fn(r0, x1) => search_cont(add, r0, x1))
	end


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-04.sml] *)
