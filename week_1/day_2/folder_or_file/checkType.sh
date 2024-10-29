#!/usr/bin/env bash
paths=$*

for path in $paths; do
	if [ ! -e $path ]; then
		echo "$path does not exist"
		exit 1
	elif [ -f $path ];
	then
		echo "$path is a file."
	elif [ -d $path ]; then
		echo "$path is a directory."
	fi
done
