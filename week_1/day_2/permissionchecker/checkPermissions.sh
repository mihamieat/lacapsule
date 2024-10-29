#!/usr/bin/env bash

if [ ! -f "$1" ]; then
	echo "FILE does not exist."
elif [ -x "$1" ]; then
	echo "You have permissions to execute FILE"
else
	echo "You do not have permissions to execute FILE"
fi
