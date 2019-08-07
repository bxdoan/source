#!/bin/python3
from itertools import product

print(*list(product(map(int, input().strip().split()),map(int, input().strip().split()))))
