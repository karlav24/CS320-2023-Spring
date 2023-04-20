(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
// 10 points for stream_take
// 10 points for stream_drop
//
Given a stream fxs, stream_take(fxs, n)
returns another stream containing the first
n items in fxs (or all the elements of fxs if
fxs contains fewer than n elements).
//
Given a stream fxs, stream_drop(fxs, n)
returns another stream containing all but the
first n elements of fxs.
//
*)

(* ****** ****** *)

(*
fun
stream_take
(fxs: 'a stream, n: int): 'a stream = ...
*)

(* ****** ****** *)

(*
fun
stream_drop
(fxs: 'a stream, n: int): 'a stream = ...
*)
fun
stream_take
(fxs: 'a stream, n: int): 'a stream =
let
    fun take_helper(cxs: 'a strcon, remaining: int): 'a strcon =
      case (cxs, remaining) of
        (_, 0) => strcon_nil
      | (strcon_nil, _) => strcon_nil
      | (strcon_cons(cx, fxs'), _) => strcon_cons(cx, fn () => take_helper(fxs'(), remaining-1))
  in
    fn () => take_helper(fxs(), n)
  end


(* ****** ****** *)

fun
stream_drop(fxs: 'a stream, n: int): 'a stream =
  let
    fun drop_helper(fxs: 'a stream, i: int): 'a strcon =
      if i <= 0 then
        fxs()
      else
        drop_helper(stream_tail(fxs), i-1)

    val dropped = drop_helper(fxs, n)
  in
    fn () => dropped
  end
(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-00.sml] *)
