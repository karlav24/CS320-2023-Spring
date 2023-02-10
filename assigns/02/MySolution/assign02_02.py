####################################################
import sys
sys.path.append('..')
from assign02 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (10 points)
# mylist_quicksort (see list_quicksort in assign02.sml)
#
####################################################
def mylist_append(xs, ys):
    if mylist_nilq(xs):
        return ys
    else:
        return mylist_cons(xs.get_cons1(), mylist_append(xs.get_cons2(), ys))

def mylist_quicksort(xs):
        def qsort(xs):
            if mylist_nilq(xs):
                return xs
            pivot = xs.get_cons1()
            less_than, greater_than = partition(xs.get_cons2(), pivot)
            return mylist_concatenate(qsort(less_than), mylist_cons(pivot, qsort(greater_than)))
    
        def partition(xs, pivot):
            if mylist_nilq(xs):
                return (mylist_nil(), mylist_nil())
            first = xs.get_cons1()
            if first <= pivot:
                less_than, greater_than = partition(xs.get_cons2(), pivot)
                return (mylist_cons(first, less_than), greater_than)
            else:
                less_than, greater_than = partition(xs.get_cons2(), pivot)
                return (less_than, mylist_cons(first, greater_than))
        
        def mylist_concatenate(xs1, xs2):
            if mylist_nilq(xs1):
                return xs2
            return mylist_cons(xs1.get_cons1(), mylist_concatenate(xs1.get_cons2(), xs2))
        return qsort(xs)
