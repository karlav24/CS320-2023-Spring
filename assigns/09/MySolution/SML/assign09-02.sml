(* ****** ****** *)
use "./../../MySolution/SML/generator.sml";
(* ****** ****** *)
use "./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
There is an implementation of infinite generators
in [generator.sml]. Please study the implementation.
How do you use it to give an implementation of generators
that are possibily finite?
*)

(* ****** ****** *)

type 'a fgenerator = 'a option generator

(* ****** ****** *)

(*
//
HX-2023-04-15: 20 points
//
Please implement the following function that converts
a stream into a generator that is possibly finite.
(*
There is not much code to write here; the problem mainly
test your understanding of continuations.
*)
//
fun
fgenerator_make_stream(fxs: 'a stream): 'a fgenerator = ...
//
*)
fun fgenerator_make_stream(fxs: 'a stream): 'a fgenerator =
    let
	fun gen_from_stream(strm: 'a stream, ret0, cret) =
	    case strm() of
	    	 strcon_nil => (generator_yield(NONE, ret0, cret); gen_from_stream(fn() => strcon_nil, ret0, cret))
		 |strcon_cons(x, func) => (generator_yield(SOME x, ret0, cret); gen_from_stream(func, ret0, cret))
    in
	generator_make_fun(fn(ret0, cret) => gen_from_stream(fxs, ret0, cret))
    end

(* ****** ****** *)

(* end of [CS320-2023-Spring-assigns-assign09-02.sml] *)
