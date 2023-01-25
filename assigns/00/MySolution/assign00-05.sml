fun stringrev(cs: string) =
    let
        fun helper(n) =
            if n <= 0 then ""
            else String.str(String.sub(cs,n-1)) ^ helper(n-1)
    in
        helper(String.size cs)
    end


