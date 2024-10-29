#!/usr/bin/env python3

import os
import sys

NUMNER_OF_FILES = 10

def create_dummy_files(base_dir):
    """Create dummy files for testing."""
    os.makedirs(base_dir, exist_ok=True)
    for i in range(1, NUMNER_OF_FILES):
        file_path = os.path.join(base_dir, f"file_{i}")
        with open(file_path, "w") as file:
            file.write(f"This is the content of file_{i}")

create_dummy_files(sys.argv[1])
