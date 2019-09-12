#!/bin/python3

import math
import os
import random
import re
import sys
# Sample Input 0
#
# 5
# 1 2 1 3 2
# 3 2
# Sample Output 0
#
# 2
# Sample Input 1
#
# 6
# 1 1 1 1 1 1
# 3 2
# Sample Output 1
#
# 0
# Complete the birthday function below.
def birthday(s, d, m):
    res = 0
    for i in range(len(s)-m+1):
        if sum([s[n] for n in range(i,i+m)]) == d:
            res+=1
    return res
    
if __name__ == '__main__':
    n = int(input().strip())

    s = list(map(int, input().rstrip().split()))

    dm = input().rstrip().split()

    d = int(dm[0])

    m = int(dm[1])

    result = birthday(s, d, m)

    print(str(result) + '\n')
