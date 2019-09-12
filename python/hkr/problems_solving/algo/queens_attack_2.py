#!/bin/python3

import math
import os
import random
import re
import sys
# Sample Input 0
#
# 4 0
# 4 4
# Sample Output 0
#
# 9
# Sample Input 1
#
# 5 3
# 4 3
# 5 5
# 4 2
# 2 3
# Sample Output 1
#
# 10
# Sample Input 2
#
# 1 0
# 1 1
# Sample Output 2
#
# 0
# Explanation 2
#
# Since there is only one square, and the queen is on it, the queen can move 0 squares.
# Complete the queensAttack function below.
def move_queen(n, updated_row, updated_col, r , c, obstacles):
    p = 0
    while True:
        r = updated_row(r)
        c = updated_col(c)
        key = (r - 1) * n + c
        if (c < 1 or c > n or r < 1 or r > n) or (key in obstacles):
            return p
        p += 1
    return p

# Complete the queensAttack function below.
def queensAttack(n, k, r_q, c_q, obs):
    obstacles = {}
    for b in obs:
        obstacles[(b[0] - 1) * n + b[1]] = None

    p = 0
    dr = [-1, -1, -1, 0, 0 , 1 , 1,1]
    dc = [0, -1, 1, 1, -1 , 0 , 1,-1]

    for i in range(8):
        p += move_queen(n, (lambda r: r + dr[i]), (lambda c: c + dc[i] ), r_q, c_q, obstacles)

    return p

if __name__ == '__main__':
    nk = input().split()

    n = int(nk[0])

    k = int(nk[1])

    r_qC_q = input().split()

    r_q = int(r_qC_q[0])

    c_q = int(r_qC_q[1])

    obstacles = []

    for _ in range(k):
        obstacles.append(list(map(int, input().rstrip().split())))

    result = queensAttack(n, k, r_q, c_q, obstacles)

    print(str(result) + '\n')
