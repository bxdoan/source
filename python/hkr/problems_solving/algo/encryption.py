#!/bin/python3

import math
import os
import random
import re
import sys
# Sample Input
#
# haveaniceday
# Sample Output 0
#
# hae and via ecy
# Complete the encryption function below.
def encryption(s):
    c = math.ceil(math.sqrt(len(s)))
    return ' '.join(map(lambda x: s[x::c], range(c)))

if __name__ == '__main__':
    s = input()

    result = encryption(s)

    print(result + '\n')
