#!/usr/bin/env bash

echo "Files to update:"

read files

echo "New owner and group:"

read owner group

for file in $files; do
	sudo chown $owner $file
	old_owner=$(stat -c "$U" "$file")
	echo "$file owner "$old_owner" changed to "$owner""
	if [ -n $group ]; then
		sudo chgrp $group $file
		old_group=$(stat -c "$G" "$file")
		echo "$file group "$old_group" changed to "$group""
	fi
done

