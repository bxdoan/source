# -*- coding: utf-8 -*-
#!/bin/python3
# You are in charge of the cake for your niece's birthday and have decided the
# cake will have one candle for each year of her total age. When she blows out
# the candles, she’ll only be able to blow out the tallest ones. Your task is to
#  find out how many candles she can successfully blow out.
#
# For example, if your niece is turning 4 years old, and the cake will have 4
#  candles of height 4, 4, 1, 3, she will be able to blow out 2 candles
#  successfully, since the tallest candles are of height 4 and there are 2 such
#  candles.
#  Sample Input 0
#
# 4
# 3 2 1 3
# Sample Output 0
#
# 2
# Explanation 0
#
# We have one candle of height 1, one candle of height 2, and two candles of
# height 3. Your niece only blows out the tallest candles, meaning the candles
# where height = 3. Because there are 2 such candles, we print 3 on a new line.

import math
import os
import random
import re
import sys

# Complete the birthdayCakeCandles function below.
def birthdayCakeCandles(ar):
    age = max(ar)
    res = 0
    for i in ar:
        if i == age:
            res +=1
    return res

if __name__ == '__main__':
    ar_count = int(input())

    ar = list(map(int, input().rstrip().split()))

    result = birthdayCakeCandles(ar)

    print(str(result))
