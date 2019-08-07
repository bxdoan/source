# Input Format
#
# The first line contains integers  and  separated by a space.
# The second line contains  integers, the elements of the array.
# The third and fourth lines contain  integers,  and , respectively.
#
# Output Format
#
# Output a single integer, your total happiness.
n, m = input().split()

sc_ar = input().split()

A = set(input().split())
B = set(input().split())
print(sum([(i in A) - (i in B) for i in sc_ar]))
