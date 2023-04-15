#!/usr/bin/env bash

if [ $# -lt 1 ]; then
    echo -e "ERROR : Need at least one filename as an argument."
    exit 1
fi

today=$(date | awk '{print $2, $3, $4}')
ans=""

echo -n "Create a main python file ? (y/n) " ; read ans

if [ "$ans" == y ]; then
  if [ -f "main.py" ];  then
    echo -e "ERROR : main.py already exist."
    exit 2
  fi
  
  bash build_py.sh main
  sed -i "s/date/$today/g" main.py
  sed -i "s/USER/$USER/g" main.py
  
fi

for file in "$@"; do
  if [ -f "$file.py" ]; then
    echo -e "ERROR : $file.py already exist."
    exit 3
  fi

  bash build_py.sh $file
  sed -i "s/date/$today/g" "$file".py
  sed -i "s/USER/$USER/g" "$file".py
  sed -i "s/File/$file/g" "$file".py

  
  if [ ! -f "$file.py" ]; then
    echo -e "ERROR: Failed to create $file.c"
    exit 4
  fi
  
  if [ "$ans" == y ]; then
    echo "from $file import *" >> main.py
  fi

done

if [ "$ans" == y ]; then
  echo "" >> main.py
  echo 'if __name__ == "__main__":' >> main.py
  echo -e "\t" >> main.py
fi

exit 0
