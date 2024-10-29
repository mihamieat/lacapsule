#!/usr/bin/env python3

def fatcto(num):
    a = 1
    for i in range(1, num + 1):
        a = a * i
    return a

print(fatcto(4))