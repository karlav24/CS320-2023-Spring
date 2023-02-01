fun str2int_opt(cs: string): int option =
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
        if size cs = 0 then NONE
        else if String.sub(cs,0) = #"-" then NONE
        else
            SOME(str2int_rec(0, 0))
        handle Fail _ => NONE
end
