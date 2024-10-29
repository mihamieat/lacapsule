#!/usr/bin/env python3

import random

def dice(difficulty):
    number = random.randint(1, 20)
    attribute = random.randint(1, 20)
    sign_bool = bool(random.getrandbits(1))
    if sign_bool:
        result = number + attribute
    else: result = number - attribute
    if result < 0:
        result = 0
    if result > 20:
        result = 20
    # print(number, sign_bool, attribute, result)
    if result > difficulty:
        print("Success")
    else: print("Failure")
    if result == 20:
        return "Critical"
    elif result == 1:
        return "Fumble"
    
for _ in range (100):
    if result := dice(10):
        print(result)
