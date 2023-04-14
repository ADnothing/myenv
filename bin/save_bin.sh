#!/usr/bin/env bash

source_dir="$HOME/bin"
destination_dir="$HOME/backup_bin"
ans=""


if [ ! -d "$source_dir" ]; then
  echo "ERROR : $source_dir doesn't exist anymore."
  exit 1
fi

while [ ! "$ans" == "n" ] && [ ! "$ans" == "y" ]; do
  echo -n "Replace your prievious backup ? (y/n) " ; read ans
done

if [ "$ans" == "n" ] ; then
  echo "Save canceled."
  exit 2
fi


cp -R "$source_dir" "$destination_dir"


if [ $? -eq 0 ]; then
  echo "Copy succeeded."
else
  echo "ERROR: Failed to copy."
  exit 3
fi

exit 0
