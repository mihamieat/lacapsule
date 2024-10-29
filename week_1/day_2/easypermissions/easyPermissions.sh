#!/usr/bin/env bash

echo "Files to update:"

read -p ">" files

echo "New permissions:"

read -p ">" permissions

for file in $files; do
	sudo chmod $permissions $file
	echo "$file permissions chanded to $permissions"
done
