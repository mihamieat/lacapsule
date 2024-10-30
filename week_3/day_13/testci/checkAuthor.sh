#!/usr/bin/env bash

author=$1
char="@"
shift

# Check if '@' appears exactly once in the string
if [[ "$author" == *"$char"* ]] && [[ $(echo "$author" | awk -F"$char" '{print NF-1}') -eq 1 ]]; then
  echo "Valid email address"
else
  echo "Invalid email address"
  exit 1
fi
