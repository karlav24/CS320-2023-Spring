val list_append = op@
val list_reverse = List.rev
(* ****** ****** *)

exception XlistConsMatch
exception XlistSubscript

(* ****** ****** *)

datatype 'a xlist =
xlist_nil
|
xlist_cons of ('a * 'a xlist)
|
xlist_snoc of ('a xlist * 'a)
|
xlist_append of ('a xlist * 'a xlist)
|
xlist_reverse of ('a xlist)

(* ****** ****** *)

fun
list_of_xlist(xs: 'a xlist): 'a list =
(
case xs of
xlist_nil => []
|
xlist_cons(x1, xs) => x1 :: list_of_xlist(xs)
|
xlist_snoc(xs, x1) => list_of_xlist(xs) @ [x1]
|
xlist_append(xs, ys) => list_of_xlist(xs) @ list_of_xlist(ys)
|
xlist_reverse(xs) => list_reverse(list_of_xlist(xs))
)


fun xlist_remove_reverse (xs: 'a xlist): 'a xlist =
    let
    fun remove_reverse(xs: 'a xlist): 'a xlist =
    	case xs of
    	xlist_nil => xlist_nil
    	|xlist_cons(x1,xs) => xlist_snoc(remove_reverse(xs), x1)
    	|xlist_snoc(xs, x1) => xlist_cons(x1, remove_reverse(xs))
    	|xlist_append(xs, ys) => xlist_append(remove_reverse(ys), remove_reverse(xs))
    	|xlist_reverse(xs) => xs
    in
	case xs of
     xlist_nil =>xlist_nil
    |xlist_cons(x1,xs) =>xlist_cons(x1, xlist_remove_reverse(xs))
    |xlist_snoc(xs, x1) => xlist_snoc(xlist_remove_reverse(xs), x1)
    |xlist_append(xs,ys) => xlist_append(xlist_remove_reverse(xs), xlist_remove_reverse(ys))
   	|xlist_reverse(xs) => remove_reverse(xs)
    end

































