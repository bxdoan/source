# Print the value of . 
# In the case of ZeroDivisionError or ValueError, print the error code.
# Sample Input
# 3
# 1 0
# 2 $
# 3 1
# Sample Output

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


if __name__ == '__main__':
    print("HKR")
    exception()

