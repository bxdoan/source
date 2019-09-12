#!/bin/python3

import math
import os
import random
import re
import sys
# Sample Input 0
#
# 6
# 1 4 4 4 5 3
# Sample Output 0
#
# 4
# Explanation 0
#
# The different types of birds occur in the following frequencies:
#
# Type 1: 1 bird
# Type 2: 0 birds
# Type 3: 1 bird
# Type 4: 3 birds
# Type 5: 1 bird
# The type number that occurs at the highest frequency is type 4, so we print 4
# as our answer.
#
# Sample Input 1
#
# 11
# 1 2 3 4 5 4 3 2 1 3 4
# Sample Output 1
#
# 3
# Explanation 1
#
# The different types of birds occur in the following frequencies:
#
# Type 1: 2
# Type 2: 2
# Type 3: 3
# Type 4: 3
# Type 5: 1
# Two types have a frequency of , and the lower of those is type 3.
# Complete the migratoryBirds function below.
def migratoryBirds(arr):
    count = [0]*6
    for t in arr:
        count[t] += 1
    return count.index(max(count))

if __name__ == '__main__':
    arr_count = int(input().strip())

    arr = list(map(int, input().rstrip().split()))

    result = migratoryBirds(arr)

    print(str(result) + '\n')
