import math
AB = int(input())
BC = int(input())
print(math.atan2(AB,BC))
print(math.degrees(math.atan2(AB,BC)))
print(str(int(round(math.degrees(math.atan2(AB,BC)))))+'°')
