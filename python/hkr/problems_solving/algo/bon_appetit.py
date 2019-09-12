#!/bin/python3

import math
import os
import random
import re
import sys
# Sample Input 0
#
# 4 1
# 3 10 2 9
# 12
# Sample Output 0
#
# 5
# Complete the bonAppetit function below.
def bonAppetit(bill, k, b):
    sum = 0
    for i in range(len(bill)):
        if i != k:
            sum+=bill[i]
    if b-sum/2 == 0:
        print("Bon Appetit")
    else:
        print(int(b-sum/2))
if __name__ == '__main__':
    nk = input().rstrip().split()

    n = int(nk[0])

    k = int(nk[1])

    bill = list(map(int, input().rstrip().split()))

    b = int(input().strip())

    bonAppetit(bill, k, b)
