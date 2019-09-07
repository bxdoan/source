#!/bin/python3

import math
import os
import random
import re
import sys

# Sample Input 0
#
# 4
# 73
# 67
# 38
# 33
# Sample Output 0
#
# 75
# 67
# 40
# 33
#
# Complete the 'gradingStudents' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts INTEGER_ARRAY grades as parameter.
#

def gradingStudents(grades):
    # Write your code here
    res = []
    for i in grades:
        roundUp = 5 * ceil(i/5)
        print(roundUp)
        if i >= 38 and roundUp - i < 3:
            res.append(roundUp)
        else:
            res.append(i)
    return res

if __name__ == '__main__':
    grades_count = int(input().strip())

    grades = []

    for _ in range(grades_count):
        grades_item = int(input().strip())
        grades.append(grades_item)

    result = gradingStudents(grades)

    print('\n'.join(map(str, result)))
    print('\n')
