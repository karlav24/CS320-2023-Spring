(* ****** ****** *)
(*
HX-2023-02-07: 50 points
*)
(* ****** ****** *)

type int2 = int * int
type int3 = int * int * int
type int4 = int * int * int * int
type int5 = int * int * int * int * int

(* ****** ****** *)

(*
The following function int5_sort
is based on ListMergeSort.sort, which is
defined recursively. Given a tuple of 5
integers, int5_sort returns an ordered tuple
of the same 5 integers. For instance,
int5_sort(1, 2, 1, 2, 2) = (1, 1, 2, 2, 2)
int5_sort(3, 1, 2, 5, 2) = (1, 2, 2, 3, 5)
int5_sort(3, 1, 2, 5, 4) = (1, 2, 3, 4, 5)
*)

(*
val
int5_sort =
fn(xs: int5): int5 =
let
val (x1, x2, x3, x4, x5) = xs
val ys =
ListMergeSort.sort(op>=)[x1,x2,x3,x4,x5]
val y1 = hd(ys) and ys = tl(ys)
val y2 = hd(ys) and ys = tl(ys)
val y3 = hd(ys) and ys = tl(ys)
val y4 = hd(ys) and ys = tl(ys)
val y5 = hd(ys) and ys = tl(ys)
in
  (y1, y2, y3, y4, y5)
end
*)

(* ****** ****** *)
(*
Please give a non-recursive implementation of int5_sort
as int5_sort_nr. That is, please implement int5_sort_nr
in a non-recursive manner such that int5_sort(xs) equals
int5_sort_nr(xs) for every 5-tuple xs of the type int5.
*)
(* ****** ****** *)

(*
Please Give your implementation as follows:
*)
fun int2_sort(cs: int2): int2 =
  if #1(cs) <= #2(cs) then cs
  else (#2(cs), #1(cs))
    
fun int4_sort(cs1: int2, cs2: int2): int4 =
  if #1(cs1) > #2(cs2) then (#1(cs2), #2(cs2), #1(cs1), #2(cs1))
  else 
    if #2(cs1) <= #1(cs2) then (#1(cs1), #2(cs1), #1(cs2), #2(cs2))
    else
      if #1(cs1) >= #1(cs2) then
        if #2(cs1) <= #2(cs2) then (#1(cs2), #1(cs1), #2(cs1), #2(cs2))
        else
          (#1(cs2), #1(cs1), #2(cs2), #2(cs1))
      else
        if #2(cs1) <= #2(cs2) then (#1(cs1), #1(cs2), #2(cs1), #2(cs2))
        else
          (#1(cs1), #1(cs2), #2(cs2), #2(cs1))

fun
int5_sort_nr(xs: int5): int5 =
  let
    val frst = (#1(xs), #2(xs))
    val snd = (#3(xs), #4(xs))
    val trd = #5(xs)
    val int2frst = int2_sort(frst)
    val int2snd = int2_sort(snd)
    val int4sort = int4_sort(int2frst, int2snd)
  in
    if trd >= #4(int4sort) then (#1(int4sort),#2(int4sort),#3(int4sort),#4(int4sort), trd)
    else
      if trd >= #3(int4sort) then (#1(int4sort),#2(int4sort),#3(int4sort),trd,#4(int4sort))
      else
        if trd >= #2(int4sort) then (#1(int4sort),#2(int4sort),trd,#3(int4sort),#4(int4sort))
        else
          if trd >= #1(int4sort) then (#1(int4sort),trd,#2(int4sort),#3(int4sort),#4(int4sort))
          else (trd,#1(int4sort),#2(int4sort),#3(int4sort),#4(int4sort))
  end

(* ****** ****** *)

(* end of [CS320-2023-Spring-quiz01-int5_sort_nonrec.sml] *)

(* ****** ****** *)

