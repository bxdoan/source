 #!/bin/python3
# Sample Input
#
# 6 3
# 1 3 2 6 1 2
# Sample Output
#
#  5

import math
import os
import random
import re
import sys

# Complete the divisibleSumPairs function below.
def divisibleSumPairs(n, k, ar):
    res = 0
    for i in range(n):
        for j in range(i+1, n):
            if (ar[i] + ar[j])%k == 0:
                res+=1
    return res

if __name__ == '__main__':
    nk = input().split()

    n = int(nk[0])

    k = int(nk[1])

    ar = list(map(int, input().rstrip().split()))

    result = divisibleSumPairs(n, k, ar)

    print(str(result) + '\n'))
