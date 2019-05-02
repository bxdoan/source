
# Sample Input
# 3
# sam 99912222
# tom 11122222
# harry 12299933
# sam
# edward
# harry
# Sample Output
# sam=99912222
# Not found
# harry=12299933
def dictionaries_and_maps():
    d = dict()
    for _ in range(int(input())):
        name , phoneNumber = input().rstrip().split()
        d[name] = phoneNumber
    n = 0
    while n != '\n':
        n = input()
        if n in d:
            print(n+"="+d[n])
        elif n not in d:
            print("Not found")

if __name__ == '__main__':
    dictionaries_and_maps()