#!/usr/bin/env python3

for i in range (2, 100):
    # print(i)
    divs = 0
    for u in range(1, i + 1):
        if i % u == 0:
            divs += 1
    if divs <= 2:
        print(i)
