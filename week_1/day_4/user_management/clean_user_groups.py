#!/usr/bin/env python3
"""Needs CSV file as argument"""

from subprocess import run
from sys import argv
from get_user_data import get_user_data_dicts

users = get_user_data_dicts(argv[1])
for user in users:
    print("Cleaning users and groups")
    run(["sudo", "deluser", user["username"]])
    run(["sudo", "delgroup", user["group"]])
