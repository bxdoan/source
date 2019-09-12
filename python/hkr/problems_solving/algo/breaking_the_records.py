#!/bin/python3

import math
import os
import random
import re
import sys
# Sample Input 0
#
# 9
# 10 5 20 20 4 5 2 25 1
# Sample Output 0
#
# 2 4
# Sample Input 1
#
# 10
# 3 4 21 36 10 28 35 5 24 42
# Sample Output 1
#
# 4 0
# Complete the breakingRecords function below.
def breakingRecords(scores):
    Minimum, Maximum, min, max = scores[0],scores[0], 0,0
    for i in range(1, len(scores)):
        if scores[i] > Maximum:
            Maximum = scores[i]
            max += 1
        elif scores[i] < Minimum:
            Minimum = scores[i]
            min += 1
    return max, min

if __name__ == '__main__':
    n = int(input())

    scores = list(map(int, input().rstrip().split()))

    result = breakingRecords(scores)

    print(' '.join(map(str, result)))
    print('\n')
