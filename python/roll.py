#!/bin/python3
import random
list = range(1, 6)
while 1:
    print("Do you want to roll again?(y/n)")
    a = input()
    if a == 'y':
        print("Rolling: ", random.choice(list))
    elif a == 'n':
        break
