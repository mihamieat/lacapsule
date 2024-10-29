#!/usr/bin/env python3

a = [1]

for i in range(1, 256+1):
    a.append(sum(a))

print(a)