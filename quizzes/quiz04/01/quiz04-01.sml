(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
Please put your implementation here for quiz04-01
*)
val theAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

datatype 'a stream = Cons of 'a * (unit -> 'a stream)

fun cycling_list(xs: 'a list): 'a stream =
    let
        fun helper(lst: 'a list): 'a stream =
            case lst of
                [] => helper(xs)
              | x::xs' => Cons(x, fn () => helper(xs' @ xs))
    in
        helper(xs)
    end
   
val alphabet_list = string_listize(theAlphabet)

fun alphabeta_cycling_list(): char stream =
    cycling_list(alphabet_list)

val alphabet_stream = cycling_list(alphabet_list)
(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-quiz04-01.sml] *)