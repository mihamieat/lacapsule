#!/usr/bin/env bash

if [ ! -d $1 ]; then
    echo "This path is not a directory"
else
    stat -c "%U" $1/* | uniq -c
fi