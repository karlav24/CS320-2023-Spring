(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
Please put your implementation here for quiz04-02
*)
fun stream_dupremov(fxs: int stream): int stream = (
    let 
        fun helper(fxs: int stream, prev_elem: int): int stream = fn() => 
            case fxs() of strcon_nil => strcon_nil
            | strcon_cons(xs,fxs) => if xs <> prev_elem then
                strcon_cons(xs, helper(fxs, xs))
                else 
                helper(stream_tail(fxs), xs)()
    in 
        let 
            val head = stream_head(fxs)
        in 
            helper(fxs, head-1)
        end
    end
)
(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-quiz04-02.sml] *)