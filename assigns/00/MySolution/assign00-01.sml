
fun fact x =
  if x > 0 then x * fact(x-1) else 1

fun findOverflow(n) =
    if n < 0 then n
    else (
        if fact(n) < 0 then n
        else findOverflow(n+1)
    )
    handle Overflow => n
val N = findOverflow(0)
