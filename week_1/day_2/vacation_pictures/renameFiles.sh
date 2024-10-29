#!/usr/bin/env bash

if [ ! -d $1 ] || [ ! $(basename $1) = "picturesToRename" ]; then
	echo "Not a directory or not the right directory"
	exit 1
fi

today=$(date +"%Y-%m-%d-")

for file in $(ls $1); do
	if [[ "$file" == *.$2 ]]; then
		new_name="$today$file"
		echo "Renaming $file to $new_name"
		mv "$1/$file" "$1/$today$file"
	fi
done
