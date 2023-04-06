(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-31: 10 points
Please implement the following function
that turns a list of streams into stream of
lists.
//
fun
stream_ziplst('a stream list): 'a list stream
//
If we use a list of streams to represent a
list of rows of a matrix, then the returned
stream consist of lists that are columns of the
matrix.
*)

(* ****** ****** *)
fun stream_ziplst(xs: 'a stream list): 'a list stream =    fn() =>
    let
        fun helper(xs, x) =
            let
                val list = list_foldright(xs, [], fn(y, strm) => stream_get_at(strm, x) :: y)
            in
                strcon_cons(list, fn() => helper(xs, x+1))
            end 
            handle Subscript => strcon_nil
    in
        helper(xs,0)
    end 

(* end of [CS320-2023-Spring-assign07-01.sml] *)
