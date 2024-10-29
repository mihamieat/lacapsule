#!/usr/bin/env python3
"""Needs CSV file as argument"""

import subprocess
import sys
from get_user_data import get_user_data_dicts


def create_users(users_data):
    """Create linux users from users data."""
    for user in users_data:
        print(f"Creating user {user['username']}")
        subprocess.run(["sudo", "useradd", "-m", user["username"], "-p", user["password"]])
        print(f"Creating group {user['group']}")
        subprocess.run(["sudo", "groupadd", user["group"]])
        print(f"Adding {user['username']} to group {user['group']}")
        subprocess.run(["sudo", "usermod", "-aG", user["group"], user['username']])
        if user["is_root"]:
            print(f"\033[31mSetting {user['username']} as a root user\033[0m")
            subprocess.run(["sudo", "usermod", "-aG", "sudo", user['username']])



users  = get_user_data_dicts(sys.argv[1])
# print(users)
create_users(users)
