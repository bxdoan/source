#!/bin/python3

import math
import os
import random
import re
import sys
# Output Format
#
# Print the number of integers that are considered to be between a and b.
#
# Sample Input
#
# 2 3
# 2 4
# 16 32 96
# Sample Output
#
# 3
# Explanation
#
# 2 and 4 divide evenly into 4, 8, 12 and 16.
# 4, 8 and 16 divide evenly into 16, 32, 96.
#
# 4, 8 and 16 are the only three numbers for which each element of a is a factor
#  and each is a factor of all elements of b.
#
# Complete the 'getTotalX' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY a
#  2. INTEGER_ARRAY b
#

def getTotalX(a, b):
    # Write your code here
    nmax,nmin,count = max(a),min(b),0
    for i in range(1,int(nmin/nmax)+1):
        if(sum((i*nmax)%n for n in a)+sum(n%(i*nmax) for n in b))==0:
            count+=1
    return count

if __name__ == '__main__':
    first_multiple_input = input().rstrip().split()

    n = int(first_multiple_input[0])

    m = int(first_multiple_input[1])

    arr = list(map(int, input().rstrip().split()))

    brr = list(map(int, input().rstrip().split()))

    total = getTotalX(arr, brr)

    print(str(total) + '\n')
