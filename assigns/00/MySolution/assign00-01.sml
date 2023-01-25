
fun fact x =
  if x > 0 then x * fact(x-1) else 1

fun pow (base:int, exponent:int) =
    if exponent = 0 then 1
    else if exponent = 1 then base
    else base * pow(base, exponent - 1)

val maxWord = pow(2,31) - 1;

fun findOverflow n =
    if n < 0 then raise Fail "The argument must be greater than or equal to 0"
    else
    (
            if (fact n) > maxWord then n
            else findOverflow (n+1)
    )
val overflow = findOverflow(0);
