#!/usr/bin/env python3

import subprocess
import sys

def make_executable(file):
    """Make a file executable."""
    user = sys.argv[2] if len(sys.argv) > 2 else None
    group = sys.argv[3] if len(sys.argv) > 3 else None
    print(f"Changing permissions for {file}")
    subprocess.run(["chmod", "u+x", file])
    if user:
        print(f"Changing file {file} user to {user}")
        subprocess.run(["sudo", "chown", user, file])
    if group:
        print(f"Changing file {file} group to {group}")
        subprocess.run(["sudo", "chgrp", group, file])

make_executable(sys.argv[1])
