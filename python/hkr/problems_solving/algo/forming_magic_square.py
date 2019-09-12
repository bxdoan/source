#!/bin/python3

import math
import os
import random
import re
import sys
# Sample Input 0
#
# 4 9 2
# 3 5 7
# 8 1 5
# Sample Output 0
#
# 1
# Explanation 0
#
# If we change the bottom right value,s[2][2] , from 5 to 6 at a cost of |6-5| = 1,
# s becomes a magic square at the minimum possible cost.
#
# Sample Input 1
#
# 4 8 2
# 4 5 7
# 6 1 6
# Sample Output 1
#
# 4
# Explanation 1
#
# Using 0-based indexing, if we make
#
# s[0][1]->9 at a cost of |9-8| = 1
# s[1][0]->3 at a cost of |3-4| = 1
# s[2][0]->8 at a cost of |8-6| = 2,
# then the total cost will be 1 + 1 + 2 = 4.
# Complete the formingMagicSquare function below.
def formingMagicSquare(s):
    n = [item for sublist in s for item in sublist]
    all_n = [[8,1,6,3,5,7,4,9,2],[6,1,8,7,5,3,2,9,4],[4,9,2,3,5,7,8,1,6],
             [2,9,4,7,5,3,6,1,8],[8,3,4,1,5,9,6,7,2],[4,3,8,9,5,1,2,7,6],
             [6,7,2,1,5,9,8,3,4],[2,7,6,9,5,1,4,3,8]]
    allsum = []
    for l in all_n:
        allsum.append(sum([abs(n[i]-l[i]) for i in range(9)]))
    return min(allsum)

if __name__ == '__main__':
    s = []

    for _ in range(3):
        s.append(list(map(int, input().rstrip().split())))

    result = formingMagicSquare(s)

    print(str(result) + '\n')
