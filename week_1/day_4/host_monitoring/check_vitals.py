#!/usr/bin/env python3

from datetime import datetime
import psutil
import shutil


def monitor_storage(device):
    """Monitor Hard disk usage."""
    total, _, free = shutil.disk_usage(device)
    total_gb = total/(1024**3)
    percent_free = free / total * 100
    return f"HDD: Free : {percent_free:.2f}%, Total : {total_gb:.2f}Gb"

def monitor_cpu():
    """Monitor CPU usage."""
    return f"CPU: {psutil.cpu_percent()}%"

def monitor_ram():
    """Monitor RAM usage."""
    memory_data = psutil.virtual_memory()
    free = memory_data.free / memory_data.total * 100
    total = memory_data.total / (1024**3)
    return f"RAM: Free : {free:.2f}%, Total : {total:.2f}Gb"

state_string = f"State at {datetime.now()}\n{monitor_cpu()}\n{monitor_ram()}\n{monitor_storage('/')}\n\n"

with open("/home/engineer/logs/vitals.log", "a") as file:
    file.write(state_string)
