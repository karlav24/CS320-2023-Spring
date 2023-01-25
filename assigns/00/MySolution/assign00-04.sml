fun str2int(cs: string) : int =
    let
        fun str2int_rec(i:int, acc: int) : int =
            if i = size cs then acc
            else
                let val c = String.sub(cs, i) in
                if c >= #"0" andalso c <= #"9" then
                    str2int_rec(i+1, acc * 10 + (Char.ord c - Char.ord #"0"))
                else raise Fail "Not a number"
                end
    in
        if String.sub(cs,0) = #"-" then
            str2int_rec(1, 0) * ~1
        else
            str2int_rec(0, 0)
    end
