#!/bin/python3

import math
import os
import random
import re
import sys
# Sample Input 0
#
# 7 11
# 5 15
# 3 2
# -2 2 1
# 5 -6
# Sample Output 0
#
# 1
# 1
# Explanation 0
#
# The first apple falls at position 5 - 2 = 3.
# The second apple falls at position 5 + 2 =7.
# The third apple falls at position 5 + 1 = 6.
# The first orange falls at position 15 + 5 = 20.
# The second orange falls at position 15 - 6 = 9.
# Only one fruit (the second apple) falls within the region between 7 and 11, so
# we print 1 as our first line of output.
# Only the second orange falls within the region between 7 and 11, so we print 1
#  as our second line of output.
# Complete the countApplesAndOranges function below.
def countApplesAndOranges(s, t, a, b, apples, oranges):

if __name__ == '__main__':
    st = input().split()

    s = int(st[0])

    t = int(st[1])

    ab = input().split()

    a = int(ab[0])

    b = int(ab[1])

    mn = input().split()
    m = int(mn[0])

    n = int(mn[1])

    apples = list(map(int, input().rstrip().split()))

    oranges = list(map(int, input().rstrip().split()))

    countApplesAndOranges(s, t, a, b, apples, oranges)
