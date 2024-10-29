#!/bin/bash

echo "PPID of this script: $PPID"
echo "UID of this script: $UID"
echo "PID of this script: $$"
echo "Kill this script in 2 seconds"
sleep 2
kill $$
