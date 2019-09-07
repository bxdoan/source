#!/bin/python3

import math
import os
import random
import re
import sys
# Print a single integer that denotes the number of valleys Gary walked through during his hike.
#
# Sample Input
#
# 8
# UDDDUDUU
# Sample Output
#
# 1
# Explanation
#
# If we represent _ as sea level, a step up as /, and a step down as \, Gary's hike can be drawn as:
#
# _/\      _
#    \    /
#     \/\/
# He enters and leaves one valley.
# Complete the countingValleys function below.
def countingValleys(n, s):
    v = 0
    lvl = 0
    for i in range(n):
        if s[i] == 'U':
            lvl +=1
        if s[i] == 'D':
            lvl -=1
        if lvl == 0 and s[i] == 'U':
            v +=1
    return v

if __name__ == '__main__':

    n = int(input())

    s = input()

    result = countingValleys(n, s)

    print(result)
