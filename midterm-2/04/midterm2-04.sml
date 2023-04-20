(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
// A non-empty sequence of numbers forms a
// "drawdown" if every number in the sequence does not
// exceed the first one. A maximal drawdown is one that
// is not contained in any longer drawdowns.
// Please implement a function stream_drawdowns that takes
// an infinite stream fxs of integers and returns a stream
// enumerating all the maximal drawdowns in fxs.
//
*)
fun stream_drawdowns(fxs: int stream): int list stream = 
     let
        fun assis(curr: int list, fxs: int stream): int list stream = fn() =>
            case fxs() of
                strcon_nil => strcon_nil
                |strcon_cons(x, xs) =>
                    case curr of
                        [] => assis([x], xs)()
                        |hd::tl => 
                            if x <= hd then assis(x::curr, xs)()
                            else strcon_cons(list_reverse(curr), assis([x], xs))
    in
        assis([], fxs)
    end

(* ****** ****** *)

(*
fun
stream_drawdowns(fxs: int stream): int list stream = ... *)

(* ****** ****** *)


(* end of [CS320-2023-Spring-midterm2-04.sml] *)
