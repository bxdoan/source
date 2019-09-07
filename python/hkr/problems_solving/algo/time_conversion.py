#!/bin/python3

import os
import sys

#
# Complete the timeConversion function below.
#
def timeConversion(s):
    res = ''
    print(s[-2:0])
    if s[-2:] == 'PM':
        res = str(int(s[0:2])%12+12) + s[2:-2]
    else:
        res = '{:02d}'.format(int(s[0:2])%12) + s[2:-2]
    return res

if __name__ == '__main__':
    s = input()

    result = timeConversion(s)

    print(result + '\n')
