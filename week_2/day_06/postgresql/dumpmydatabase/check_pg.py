#!/usr/bin/env python3

import subprocess
from time import sleep

while True:
    output = subprocess.run("pg_isready")
    print(output)
    sleep(5)
