################################################
import sys
sys.setrecursionlimit(50000)
################################################
def my_int_from1(start):
    while True:
        yield start
        start = start + 1
################################################    
for i in my_int_from1(0):
    if i >= 10000:
        break
    else:
        print("i =", i)
################################################

