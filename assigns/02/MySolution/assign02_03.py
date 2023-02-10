####################################################
import sys
sys.path.append('..')
from assign02 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_mergesort (see list_mergesort in assign02.sml)
#
####################################################
def mylist_mergesort(xs):
    if mylist_nilq(xs) or mylist_nilq(xs.get_cons2()):
        return xs
    else:
        xs1, xs2 = mylist_split(xs)
        return mylist_merge(mylist_mergesort(xs1), mylist_mergesort(xs2))

def mylist_split(xs):
    slow = xs
    fast = xs.get_cons2()
    while not mylist_nilq(fast) and not mylist_nilq(fast.get_cons2()):
        slow = slow.get_cons2()
        fast = fast.get_cons2().get_cons2()
    xs1 = xs
    xs2 = slow.get_cons2()
    slow.ctag = 0
    slow.cons2 = mylist_nil()
    return xs1, xs2

def mylist_merge(xs1, xs2):
    if mylist_nilq(xs1):
        return xs2
    elif mylist_nilq(xs2):
        return xs1
    else:
        x1 = xs1.get_cons1()
        x2 = xs2.get_cons1()
        if x1 <= x2:
            return mylist_cons(x1, mylist_merge(xs1.get_cons2(), xs2))
        else:
            return mylist_cons(x2, mylist_merge(xs1, xs2.get_cons2()))

