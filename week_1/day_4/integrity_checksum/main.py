#!/usr/bin/env python3
import hashlib
import os
import sys
from time import sleep
from datetime import datetime

# Store file hashes in a dictionary where the filename is the key
footprints = {}

def file_hash(path):
    """Return a file's digital footprint"""
    with open(path, "rb") as f:
        file_content = f.read()
        m = hashlib.sha256()
        m.update(file_content)
    return m.hexdigest()

def store_file_hashes(directory):
    """Get file hashes from a directory and store/update them in footprints"""
    logs = []
    for filename in os.listdir(directory):
        file_path = os.path.join(directory, filename)
        
        if os.path.isfile(file_path): 
            current_hash = file_hash(file_path)
            
            if filename not in footprints:
                # If it's a new file, store the hash
                footprints[filename] = current_hash
                print(f"New file detected: {filename}")
                logs.append(f"{datetime.now()}: New file detected: {filename}")
            else:
                # If the file already exists, compare the hash
                if footprints[filename] != current_hash:
                    print(f"Hash changed for file {filename}")
                    logs.append(f"\n{datetime.now()}: Hash changed for file {filename}")
                    footprints[filename] = current_hash
    return logs 

while True:
    if len(sys.argv) < 2:
        print("Usage: ./main.py <directory>")
        sys.exit(1)
    
    path_to_check = sys.argv[1]

    if os.path.exists(path_to_check) and os.path.isdir(path_to_check):
        with open ("./logs", "a") as f:
            f.write("\n".join(store_file_hashes(path_to_check)))
    else:
        print(f"Invalid directory: {path_to_check}")
        sys.exit(1)
    
    sleep(5)
