fun isPrime n0 =
    let
        fun isPrimeHelper n i =
            if i * i > n then true
            else if n mod i = 0 then false
            else isPrimeHelper n (i+1)
    in
        if n0 < 2 then false
        else isPrimeHelper n0 2
    end

