use "./../../../mysmlib/mysmlib-cls.sml";

val string_foreach =
    fn (cs, work) =>
        int1_foreach (String.size(cs), fn (i) => work (String.sub(cs, i)))

fun quiz02_01(word: string): char -> int =
    let
        fun addOne (x: int, c: char) = if c = word then x + 1 else x

        fun helper(c: char, s: string, acc: int) =
            string_foreach (s, fn ch => acc := addOne (!acc, ch))

    in
        fn c => helper(c, word, ref 0)
    end

