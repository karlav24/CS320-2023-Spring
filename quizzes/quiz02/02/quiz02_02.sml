(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
val abs = fn (x: int) => if x >= 0 then x else ~x

fun quiz02_02 (xs: int list, ys: int list) = (
  let
    fun checkPair (x, y) = abs(x - y) < 10
    fun helper [] ys = false
      | helper (x::xs) ys =
        let
          fun check y [] = false
            | check y (z::zs) = checkPair(x, z) orelse check y zs
        in
          check x ys orelse helper xs ys
        end
  in
    helper xs ys
  end
)
(* ****** ****** *)
(* end of [CS320-2023-Spring-quizzes-quiz02_01.sml] *)