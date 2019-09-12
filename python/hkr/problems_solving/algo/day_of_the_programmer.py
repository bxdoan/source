#!/bin/python3

import math
import os
import random
import re
import sys
# Sample Input 2
#
# 1800
# Sample Output 2
#
# 12.09.1800
# Explanation 2
#
# Since 1800 is leap year. Day lies on 12 September.
# Complete the dayOfProgrammer function below.
def dayOfProgrammer(year):
    if (year == 1918):
        return '26.09.1918'
    elif ((year <= 1917) & (year%4 == 0)) or ((year > 1918) & (year%400 == 0 or
                                            ((year%4 == 0) & (year%100 != 0)))):
        return '12.09.%s' %year
    else:
        return '13.09.%s' %year

if __name__ == '__main__':
    year = int(input().strip())

    result = dayOfProgrammer(year)

    print(result + '\n')
