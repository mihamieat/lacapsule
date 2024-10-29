#!/usr/bin/env bash

age=18
if [ $age -gt 18 ]
then
	echo "You are an adult."
elif [ $age -eq 18 ];then
	echo "You have just reached majority."
else
	echo "You are a minor."
fi
