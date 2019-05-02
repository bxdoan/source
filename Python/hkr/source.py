# Print the value of . 
# In the case of ZeroDivisionError or ValueError, print the error code.
# Sample Input:
# 3
# 1 0
# 2 $
# 3 1
# Sample Output:
# Error Code: integer division or modulo by zero
# Error Code: invalid literal for int() with base 10: '$'
# 3
def exception():
    n = int(input())
    c = {}
    for i in range(n):
        c[i] = input().rstrip().split()
        for j in range(len(c)):
            a, b = c[i]
            try:
                print (int(a)/int(b))
            except ZeroDivisionError:
                print("Error Code: integer division or modulo by zero")
            except ValueError as e:
                print("Error Code: ",e)

# A single line containing the complex number . Note: complex() function can 
# be used in python to convert the input as a complex number.
# Constraints
# Given number is a valid complex number
# Output Format
# Output two lines: 
# The first line should contain the value of . 
# The second line should contain the value of .
# Sample Input:
# 1+2j
# Sample Output:
# 2.23606797749979 
# 1.1071487177940904
import cmath
def polar_coordinate():
    print(*cmath.polar(complex(input())), sep='\n')

# Input Format
# The first line contains integer , the number of test cases. 
# The next  lines contains the string .
# Constraints
# Output Format
# Print "True" or "False" for each test case without quotes.
# Sample Input
# 2
# .*\+
# .*+
# Sample Output
# True
# False
import re
def incorrect_regex():
    for _ in range(int(input())):
        ans = True
        try:
            reg = re.compile(input())
        except re.error:
            ans = False
        print(ans)

# Both players are given the same string, .
# Both players have to make substrings using the letters of the string .
# Stuart has to make words starting with consonants.
# Kevin has to make words starting with vowels. 
# The game ends when both players have made all possible substrings. 
# Scoring
# A player gets +1 point for each occurrence of the substring in the string .
# For Example:
# String  = BANANA
# Kevin's vowel beginning word = ANA
# Here, ANA occurs twice in BANANA. Hence, Kevin will get 2 Points. 
# Sample Input
# BANANA
# Sample Output
# Stuart 12
def minion_game(string):
    Vowels = 'AEIOU'
    kevsc = 0
    stusc = 0
    for i in range(len(string)):
        print(string[i], kevsc, stusc)
        if string[i] in Vowels:
            kevsc += (len(string)-i)
        else:
            stusc += (len(string)-i)
    if kevsc > stusc:
        print("Kevin", kevsc)
    elif kevsc < stusc:
        print("Stuart", stusc)
    else:
        print("Draw")

# Sample Input
# AABCAAADA
# 3   
# Sample Output
# AB
# CA
# AD
# 'setdefault' method returns the key value available in the dictionary and if given
# key is not available then it will provided default value and adds it to the dictionary
# def merge_the_tools(string, k):
for part in zip(*[iter(string)] * k):
    d = dict()
    print(''.join([ d.setdefault(c, c) for c in part if c not in d ]))

if __name__ == '__main__':
    s, k = input(), int(input())
    merge_the_tools(s, k)

