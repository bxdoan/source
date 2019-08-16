#!/bin/python3

from itertools import product

K,M = map(int,input().split())
N = (list(map(int, input().split()))[1:] for _ in range(K))
results = map(lambda x: sum(i**2 for i in x)%M, product(*N))
print(max(results))

# K, M = map(int, input().split())
# sum = 0
# for _ in range(K):
#     N = list(map(int, input().split()))
#     sum += max(N)**2
# print(sum%M)
