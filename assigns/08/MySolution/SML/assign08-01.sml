(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-04-07: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)

fun
stream_permute_list(xs: 'a list): 'a list stream = 
let
  fun insert(x, []) = [[x]]
  | insert(x, (y::ys)) =
  (x::y::ys) :: list_map((insert(x, ys)), (fn ys => y::ys))

  fun permutate([]) = list_streamize [[]]
  | permutate((x::xs)) =
        let
            val permute = permutate(xs)
        in
            stream_concat(stream_make_map(permute, (fn x1 => list_streamize(insert(x, x1))))) 
        end
in
    permutate(xs)
end

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign08-01.sml] *)
