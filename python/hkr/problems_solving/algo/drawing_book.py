#!/bin/python3

import os
import sys
from math import ceil

#
# Complete the pageCount function below.
#
# Sample Input 1
#
# 5
# 4
# Sample Output 1
#
# 0
def pageCount(n, p):
    return int(min(p//2,n//2-p//2))
    #
    # Write your code here.
    #

if __name__ == '__main__':
    n = int(input())

    p = int(input())

    result = pageCount(n, p)

    print(str(result) + '\n')
