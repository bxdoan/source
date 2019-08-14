# Sample Input
#
# 5
# Sample Output
#
# 1
# 22
# 333
# 4444
for i in range(1,int(input())): #More than 2 lines will result in 0 score. Do not leave a blank line also
    print(int((pow(10,i)-1)/9)*i)
