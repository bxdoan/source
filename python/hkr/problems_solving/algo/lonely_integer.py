#!/bin/python3
# You will be given an array of integers. All of the integers except one occur
# twice. That one is unique in the array.
#
# Given an array of integers, find and print the unique element.
#
# For example, a = [1,2,3,4,3,2,1], the unique element is 4.
#
# Function Description
#
# Complete the lonelyinteger function in the editor below. It should return
# the integer which occurs only once in the input array.
#
# lonelyinteger has the following parameter(s):
#
# a: an array of integers
# Input Format
#
# The first line contains a single integer, n, denoting the number of integers
# in the array.
# The second line contains n space-separated integers describing the values in a.
# Sample Input 0
#
# 1
# 1
# Sample Output 0
#
# 1
# Explanation 0
#
# There is only one element in the array, thus it is unique.
#
# Sample Input 1
#
# 3
# 1 1 2
# Sample Output 1
#
# 2
# Explanation 1
#
# We have two 's, and  is unique.
#
# Sample Input 2
#
# 5
# 0 0 1 2 1
# Sample Output 2
#
# 2
# Explanation 2
#
# We have two 0's, two 1's, and one 2. 2 is unique.

import math
import os
import random
import re
import sys

# Complete the lonelyinteger function below.
def lonelyinteger(a):

if __name__ == '__main__':
    n = int(input())

    a = list(map(int, input().rstrip().split()))

    result = lonelyinteger(a)

    print(str(result) + '\n')
