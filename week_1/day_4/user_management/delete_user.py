#!/usr/bin/env python3

import subprocess
import sys

def delete_user(username):
    print(f"Deleting {username}")
    subprocess.run(["sudo", "deluser", username])

delete_user(sys.argv[1])