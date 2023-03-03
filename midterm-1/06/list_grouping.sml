(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-02: midterm-06: 20 points
//
Given a list of integers xs, list_grouping(xs)
returns a list of pairs (n, x) where n indicates
the number of times x occurs in xs; for each x in
xs, there must be a pair (n, x) for some n in the
returned list.
//
For instance,
list_grouping([1,2]) = [[1,1], [1,2]]
list_grouping([1,2,2,2,1]) = [[2,1], [3,2]]
list_grouping([1,2,1,2,3]) = [[2,1], [2,2], [1,3]]
//
In order to receive full credit, your implementation
should be able to handle a list containing 1M elements
in less than 10 seconds (mine can do it in less than
two seconds)
//
*)
(* ****** ****** *)

(*
fun
list_grouping(xs: int list): (int * int) list = ...
*)
fun list_grouping xs =
  let
    fun count x [] acc = (list_reverse acc, false)
      | count x ((n, y)::ys) acc =
          if x = y then ((n+1, y)::ys @ acc, true)
          else count x ys ((n, y)::acc)
  in
    foldr (fn (x, acc) =>
      let
        val (acc', updated) = count x acc []
      in
        if updated then acc'
        else (1, x)::acc'
      end) [] xs
  end

(* ****** ****** *)

(*
Some testing code:
val N = 1000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))
*)
(* ****** ****** *)

(*
Some testing code:
Your implementation needs to be efficient to pass the
following test:
val N = 1000000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))
*)

fun sort xs =
  let
    fun merge ([], ys) = ys
      | merge (xs, []) = xs
      | merge (x::xs', y::ys') =
          if x < y then x :: merge (xs', y::ys')
          else y :: merge (x::xs', ys')

    fun split xs =
      let
        fun aux (xs, ys) =
          case xs of
            [] => (ys, [])
          | [x] => (x::ys, [])
          | x::y::xs' =>
              let
                val (ys', zs) = aux (xs', ys)
              in
                (x::ys', y::zs)
              end
      in
        aux (xs, [])
      end

    fun mergeSort [] = []
      | mergeSort [x] = [x]
      | mergeSort xs =
          let
            val (ys, zs) = split xs
          in
            merge (mergeSort ys, mergeSort zs)
          end
  in
    mergeSort xs
  end

fun list_grouping(xs: int list): (int * int) list =
  let
    fun count_consec([], count, acc) = list_reverse((count, hd xs) :: acc)
      | count_consec([x], count, acc) = list_reverse((count+1, x) :: acc)
      | count_consec(x::y::ys, count, acc) =
          if x = y then count_consec(y::ys, count+1, acc)
          else count_consec(y::ys, 1, (count+1, x) :: acc)
  in
    count_consec(sort xs, 1, [])
  end


(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_grouping.sml] *)
