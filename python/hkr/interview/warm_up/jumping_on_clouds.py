#!/bin/python3

import math
import os
import random
import re
import sys
# Sample Input 0
#
# 7
# 0 0 1 0 0 1 0
# Sample Output 0
#
# 4
# Explanation 0:
# Emma must avoid c[2] and c[5]. She can win the game with a minimum of 4 jumps:
# Sample Input 1
#
# 6
# 0 0 0 0 1 0
# Sample Output 1
#
# 3
# Explanation 1:
# The only thundercloud to avoid is c[4]. Emma can win the game in 3 jumps:
# Complete the jumpingOnClouds function below.
def jumpingOnClouds(c):
    res = 0

    return res
if __name__ == '__main__':
    n = int(input())

    c = list(map(int, input().rstrip().split()))

    result = jumpingOnClouds(c)

    print(result)
