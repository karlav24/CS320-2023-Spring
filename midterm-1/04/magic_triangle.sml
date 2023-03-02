(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-04: 10 points
*)
(* ****** ****** *)
(*
Magic Triangle:
             1
           1   1
         1   2   1
       1   3   3   1
     1   4   6   4   1
   1   5   10  10  5   1
 1   6   15  20  15  6   1

THe magic triangle has the following structure:
- All numbers on the left and right borders are 1.
- All numbers in the interior (non-border) are the sum of the
  numbers in the row directly above it.

The following example shows how row 5 is computed from row 4.

row 4:      1     4     6     4    1
           / \   / \   / \   / \  / \
row 5:    1   1+4   4+6   6+4  4+1   1


We can represent a magic triangle in SML as an int list list where each row
is stored as a nested int list.

row 0  [[1]
row 1   [1,  1]
row 2   [1,  2,  1]
row 3   [1,  3,  3,  1]
row 4   [1,  4,  6,  4,  1]
row 5   [1,  5,  10, 10, 5,  1]
row 6   [1,  6,  15, 20, 15, 6,  1]]
...


Please implement a function that produces a magic triangle with n row.

triangle 0 = [[1]]
triangle 1 = [[1], [1, 1]]
triangle 2 = [[1], [1, 1], [1, 2, 1]]
triangle 3 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]
triangle 4 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
...
triangle n = ???

Hint: You might want a helper function to compute the current row from
the previous.

*)

(* ****** ****** *)

(*
fun
magic_triangle (n : int) : int list list = ...
*)
fun last (xs : 'a list) =
  case xs of
    [] => raise Empty
  | [x] => x
  | x :: xs' => last xs'

fun magic_triangle (n : int) : int list list =
    let
        fun next_row prev_row = 
            let 
                fun sum_pairs xs =
                    case xs of 
                        [] => []
                      | [x] => [x]
                      | x::y::ys => (x+y)::sum_pairs (y::ys)
            in
                [1] @ sum_pairs prev_row @ [1]
            end

        fun helper n row acc =
            if n < row then
                list_reverse acc
            else if row = 1 then
                helper n (row+1) [[1]] 
            else
                let 
                    val new_row = next_row (last acc)
                in
                    helper n (row+1) (new_row :: acc)
                end
    in
        helper n 1 []
    end

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-magic_triangle.sml] *)
