####################################################
import sys
sys.path.append('..')
from assign02 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_append (see list_append in assign02.sml)
# mylist_rappend (see list_rappend in assign02.sml)
# mylist_reverse (see list_reverse in assign02.sml)
#
####################################################
def mylist_append(xs, ys):
    if mylist_nilq(xs):
        return ys
    else:
        return mylist_cons(xs.get_cons1(), mylist_append(xs.get_cons2(), ys))

def mylist_rappend(xs, ys):
    if mylist_nilq(ys):
        return xs
    else:
        return mylist_cons(ys.get_cons1(), mylist_rappend(xs, ys.get_cons2()))

def mylist_reverse(xs):
    def aux(xs, acc):
        if mylist_nilq(xs):
            return acc
        else:
            return aux(xs.get_cons2(), mylist_cons(xs.get_cons1(), acc))
    return aux(xs, mylist_nil())

