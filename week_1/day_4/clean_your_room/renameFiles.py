#!/usr/bin/env python3

import os
import sys


def rename_files(directory, prefix, suffix):
    """Rename files in a directory."""

    for filename in os.listdir(directory):
        new_name = f"{prefix}_{filename}_{suffix}"
        os.rename(os.path.join(directory, filename), os.path.join(directory, new_name))

rename_files(sys.argv[1], sys.argv[2], sys.argv[3])
