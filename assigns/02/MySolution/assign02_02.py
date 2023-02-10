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
        pivot = xs.get_cons1()
        smaller_list = mylist_nil()
        bigger_list = mylist_nil()
        curr = xs.get_cons2()
        while not mylist_nilq(curr):
            if curr.get_cons1() <= pivot:
                smaller_list = mylist_cons(curr.get_cons1(), smaller_list)
            else:
                bigger_list = mylist_cons(curr.get_cons1(), bigger_list)
            curr = curr.get_cons2()
        return mylist_append(mylist_quicksort(smaller_list), mylist_cons(pivot, mylist_quicksort(bigger_list)))
