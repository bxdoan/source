# Enter your code here. Read input from STDIN. Print output to STDOUT
# Input Format
# The first line contains the first integer, , and the second line contains the second integer, .
#
# Output Format
# Print the result as described above.
#
# Sample Input
#
# 177
# 10
# Sample Output
#
# 17
# 7
# (17, 7)
m = int(input())
n = int(input())
print(m//n)
print(m%n)
print(divmod(m,n))
