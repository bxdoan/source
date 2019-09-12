#!/bin/python3

import math
import os
import random
import re
import sys
# Sample Input
#
# 4 3
# 1 7 2 4
# Sample Output
#
# 3
# Explanation
#
# The sums of all permutations of two elements from S={1,7,2,4} are:
#
# 1 + 7 = 8
# 1 + 2 = 3
# 1 + 4 = 5
# 7 + 2 = 9
# 7 + 4 = 11
# 2 + 4 = 6
# We see that only S' = {1,7,4} will not ever sum to a multiple of k=3.
#
# Complete the 'nonDivisibleSubset' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER k
#  2. INTEGER_ARRAY s
#

def nonDivisibleSubset(k, s):
    # Write your code here
    residuals = [i %k for i in s]
    counter = [0] * k
    for r in residuals:
        counter[r] += 1

    # max one element with residual 0
    c = min(counter[0], 1)
    print(residuals)
    print(counter)
    print(c)
    # Consider k=3. You want to add max(counts[1], counts[2]) to count.
    # Since 3//2 = 1, without +1 you would have range(1, 1), which is [].
    for i in range(1, (k//2)+1):
        if i != k-i:
            c += max(counter[i], counter[k-i])
        else:
            c += min(counter[i], 1)

    return c
if __name__ == '__main__':
    first_multiple_input = input().rstrip().split()

    n = int(first_multiple_input[0])

    k = int(first_multiple_input[1])

    s = list(map(int, input().rstrip().split()))

    result = nonDivisibleSubset(k, s)

    print(str(result) + '\n')
