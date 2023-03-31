####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *

sys.path.append("./../../../05/MySolution/Python")
from assign05_02 import *

sys.path.append("./../../")
from dictwords import*

import queue
####################################################
"""
HX-2023-03-24: 30 points
Solving the doublet puzzle
"""
####################################################
def word_neighbors_legal(word):
    return fnlist_filter_pylist(word_neighbors(word), word_is_legal)

def wpath_neighbors_legal(wpath):
    word1 = wpath[-1]
    words = word_neighbors_legal(word1)
    return [wpath + (word2,) for word2 in words]

def gtree_bfs(nxs, fchildren):
    def helper(nxs):
        if nxs.empty():
            return strcon_nil()
        else:
            nx1 = nxs.get()
            for nx2 in fchildren(nx1):
                nxs.put(nx2)
            return strcon_cons(nx1, gtree_bfs(nxs, fchildren))
    return lambda: helper(nxs)
def doublet_stream_from(word):
    nxs = queue.Queue() 
    nxs.put((word,))
    return gtree_bfs(nxs, wpath_neighbors_legal)

####################################################
