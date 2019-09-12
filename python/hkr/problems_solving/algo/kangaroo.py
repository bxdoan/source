#!/bin/python3

import math
import os
import random
import re
import sys
# Sample Input 0
#
# 0 3 4 2
# Sample Output 0
#
# YES
# Sample Input 1
#
# 0 2 5 3
# Sample Output 1
#
# NO
# Complete the kangaroo function below.
def kangaroo(x1, v1, x2, v2):
    res = 'NO'
    if v2 >= v1:
        return res
    s1 = x1
    s2 = x2
    while s2 >= s1:
        print(s2, s1)
        if s1 == s2:
            res = 'YES'
        s1 += v1
        s2 += v2
    return res

if __name__ == '__main__':
    x1V1X2V2 = input().split()

    x1 = int(x1V1X2V2[0])

    v1 = int(x1V1X2V2[1])

    x2 = int(x1V1X2V2[2])

    v2 = int(x1V1X2V2[3])

    result = kangaroo(x1, v1, x2, v2)

    print(result + '\n')
