#!/usr/bin/env bash
LANG=en_US.UTF-8

day=$(date +%A)
forbidden_mr_day="Friday"
if [ "$day" = "$forbidden_mr_day" ]; then
    echo "Could not perform MR today";
    exit 1;
else
    exit 0;
fi
