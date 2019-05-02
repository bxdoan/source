#!/usr/bin/python

#quickshort
def quicksort(x):
    if len(x) == 1 or len(x) == 0:
        return x
    else:
        pivot = x[0]
        i = 0
        for j in range(len(x)-1):
            if x[j+1] < pivot:
                x[j+1],x[i+1] = x[i+1], x[j+1]
                i += 1
        x[0],x[i] = x[i],x[0]
        print(x[:i])
        print(x[i+1:])
        first_part = quicksort(x[:i])
        second_part = quicksort(x[i+1:])
        print("first:", first_part)
        print("second:", second_part)
        first_part.append(x[i])
        print("first_append:", first_part)
        return first_part + second_part

alist = [54,26,93,17,77,31,44,55,20]
print("result:", quicksort(alist))
