#!/bin/python3

import math
import os
import random
import re
import sys
import functools
# Complete the extraLongFactorials function below.
def extraLongFactorials(n):
    print(functools.reduce(lambda x, y: x*y, range(n+1)[1:]))
if __name__ == '__main__':
    n = int(input())

    extraLongFactorials(n)
