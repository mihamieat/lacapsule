#!/usr/bin/env python3
import csv

def get_user_data_dicts(csv_path):
    """Read and store user data from csv file."""
    with open(csv_path, "r", newline="") as csv_file:
        csv_reader = csv.reader(csv_file)
        next(csv_reader)

        return [{"username": row[0], "group": row[1], "password": row[2], "is_root": row[3] == "true"} for row in csv_reader]
