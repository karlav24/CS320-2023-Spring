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
    if mylist_nilq(xs) or mylist_nilq(xs.cons2):
        return xs
    else:
        def split_list(lst, mid, left, right):
            if mylist_nilq(lst):
                return (left, right)
            else:
                if mid == 0:
                    right = mylist_cons(lst.cons1, right)
                    return split_list(lst.cons2, mid, left, right)
                else:
                    left = mylist_cons(lst.cons1, left)
                    return split_list(lst.cons2, mid-1, left, right)
        
        mid = mylist_size(xs) // 2
        left = mylist_nil()
        right = mylist_nil()
        
        left, right = split_list(xs, mid, left, right)
        
        left = mylist_mergesort(left)
        right = mylist_mergesort(right)
        
        return mylist_merge(left, right)

def mylist_merge(left, right):
    if mylist_nilq(left):
        return right
    elif mylist_nilq(right):
        return left
    else:
        if left.cons1 < right.cons1:
            return mylist_cons(left.cons1, mylist_merge(left.cons2, right))
        else:
            return mylist_cons(right.cons1, mylist_merge(left, right.cons2))

