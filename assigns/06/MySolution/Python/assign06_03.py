####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
"""
HX-2023-03-24: 20 points
Solving the N-queen puzzle
"""
####################################################

def initial(N):
    lst = []
    for i in range(N):
        lst.append(0)
    return [lst]

def checking(x1, intz, num):
    check = True
    if intz == 0:
        return check
    for i in range(intz):
        if (x1[i] == num or (abs(intz - i) == abs(x1[i] - num))):
            check = False
            break
    return check

def get_children(x1, N):
    i = 1
    x2 = x1[:]
    x3 = []
    intz = 0
    while intz < N:
        if x1[intz] != 0:
            intz = intz + 1
        else:
            break
    while i <= N:
        if checking(x1, intz, i):
            x2[intz] = i
            x3.append(x2[:])
        i = i + 1
    return x3
            

def solve_N_queen_puzzle(N):
    init = initial(N)
    store = gtree_dfs(init, lambda x: get_children(x, len(init[0])))
    store2 = stream_make_filter(store, lambda x1: tuple(x1) if x1[-1] != 0 else None)
    return store2

####################################################
