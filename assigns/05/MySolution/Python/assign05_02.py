####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
#
# HX-2023-03-14: 20 points
# Please *translate* into Python the posted solution
# on Piazza for word_neighbors (which is writtend in SML)
#
def word_neighbors(word):
    """
    Note that this function should returns a fnlist
    (not a pylist)
    Your implementation should be combinator-based very
    much like the posted solution.
    """
    def strsub(word, i):
        return word[i]

    def string_length(word):
        return string_foldleft(word,0,lambda r, a: r + 1)

    def string_implode(wlist):
        return foreach_to_foldleft(fnlist_foreach)(wlist, "", lambda r, b: r + b)

    def helperTabulate(length, fopr):
        return fnlist_reverse\
            (int1_foldleft(length,fnlist_nil(), lambda r, c: fnlist_cons(fopr(c),r)))

    def string_tabulate(length,fopr):
        return string_implode(helperTabulate(length,fopr))
                
    AB= "abcdefghijklmnopqrstuvwxyz"
    wlen = string_length(word)

    return \
        fnlist_concat(string_imap_fnlist\
                      (word, lambda i, c: fnlist_concat\
                       (string_imap_fnlist(AB, lambda _, c1: fnlist_sing\
                                           (string_tabulate(wlen, lambda j: strsub(word, j) if i != j else c1)) if (c != c1) else fnlist_nil()))))
#
####################################################
