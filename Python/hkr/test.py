#!/bin/python3
def recursion(n):
	if n == 0:
		return 1
	else:
		return (n * recursion(n-1))

def sort(L):
	smaller = []
	equal = []
	greater = []
	if len(L) > 1:
		pavot = L[0]
		for i in L:
			if i < pavot:
				smaller.append(i)
			elif i == pavot:
				equal.append(i)
			elif i > pavot:
				greater.append(i)
		return sort(smaller)+equal+sort(greater)
	else:
		return L



if __name__ == '__main__':
	inp = input().split()
	print(inp)
	m = map(int, inp)
	print(m)
	L = list(m)
	print(L)
	print(*sort(L))