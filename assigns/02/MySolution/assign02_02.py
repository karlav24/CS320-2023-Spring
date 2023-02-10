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
    if mylist_nilq(xs):
        return xs
    else:
        pivot = xs.cons1
        less = mylist_nil()
        greater = mylist_nil()
        
        def partition(lst, pivot, less, greater):
            if mylist_nilq(lst):
                return (less, greater)
            else:
                if lst.cons1 < pivot:
                    less = mylist_cons(lst.cons1, less)
                else:
                    greater = mylist_cons(lst.cons1, greater)
                return partition(lst.cons2, pivot, less, greater)
        
        less, greater = partition(xs.cons2, pivot, less, greater)
        return mylist_append(mylist_quicksort(less), mylist_cons(pivot, mylist_quicksort(greater)))

