#!/usr/bin/env python3

from subprocess import run
from sys import argv
from time import sleep


table = argv[1]
user = "developer"

with open("dumpz.sql", "w") as output_file:
    run(["pg_dump", "autodump", "-t", table, "-U", user, "-W", "-h", "localhost"], stdout=output_file)