fun int2str (i0: int): string = 
    let
        fun int2str' (i: int): string = 
            if i = 0 then "0" else 
            if i < 10 then String.str((Char.chr (Char.ord #"0" + i)))
            else
            let
                val d = (i + 10) mod 10
                val s = int2str' (i div 10)
            in
                s ^ String.str((Char.chr (Char.ord #"0" + d)))
            end
    in
        if i0 = 0 then "0" else int2str' i0
    end

