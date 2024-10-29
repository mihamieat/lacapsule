#!/usr/bin/env bash

timestamp=$(date +"%Y-%m-%d-%H-%M-%s")
echo "environment type: $ENV_TYPE"

if [[ $ENV_TYPE == "dev" ]]; then
	if [ ! -d ~/backup/dev ]; then
		mkdir -p ~/backup/dev
	fi
elif [[ $ENV_TYPE == "preprod" ]]; then
        if [ ! -d ~/backup/preprod ]; then
                mkdir -p ~/backup/preprod
        fi
elif [[ $ENV_TYPE == "prod" ]]; then
        if [ ! -d ~/backup/prod ]; then
                mkdir -p ~/backup/prod
        fi
else
	echo "Wrong environment type."
	exit 1
fi

echo "Copying data to /home/engineer/backup/$ENV_TYPE/"
cp /home/engineer/data/ma_donnee_importante.txt /home/engineer/backup/$ENV_TYPE/$timestamp.txt
