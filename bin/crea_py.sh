#!/usr/bin/env bash

if [ $# -lt 1 ]; then
    echo -e "ERROR : Need at least one filename as an argument."
    exit 1
fi

today=$(date | awk '{print $2, $3, $4}')

for file in "$@"; do
  if [ -f "$file.py" ]; then
    echo -e "ERROR : $file.py already exist."
    exit 2
  fi

  sed -e "s/File/$file/g" $HOME/Documents/templates/template_py.py > "$file"_temp1
  sed -e "s/date/$today/g" "$file"_temp1 > "$file"_temp2
  sed -e "s/USER/$USER/g" "$file"_temp2 > "$file".py

  rm "$file"_temp
  
  if [ ! -f "$file.py" ]; then
    echo -e "ERROR: Failed to create $file.c"
    exit 3
  fi

done

exit 0
