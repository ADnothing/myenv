#!/usr/bin/env bash

#VARIABLES
ans=""
lib=""
today=$(date | awk '{print $2, $3, $4}')


#CHECK
if [ $# -lt 1 ]; then
    echo -e "ERROR : Need at least one filename as an argument."
    exit 1
fi

#MAKEFILE BUILDING
echo -n "Create a Makefile ? (y/n) " ; read ans

if [ $ans == y ]; then
  bash build_make.sh
fi

for file in "$@"; do
  if [ -f "$file.c" ]; then
    echo -e "ERROR: File $file.c already exists."
    exit 2
  fi


  #CREATING THE .c
  
  bash build_c.sh $file
  sed -i "s/date/$today/g" "$file".c
  sed -i "s/USER/$USER/g" "$file".c

  if [ ! -f "$file.c" ]; then
    echo -e "ERROR: Failed to create $file.c"
    exit 3
  fi

  
    # Add rules to the Makefile for building this file
    if [ "$ans" == y ]; then
      sed -i '5s/.*/make/' "$file.c"
      echo "all: $file.x" >> Makefile
      echo "" >> Makefile
      echo "$file.x: $file.o" >> Makefile
      echo -e "\t\$(CC) \$(CFLAGS) -o $file.x $file.o \$(LIBS)" >> Makefile
      echo "" >> Makefile
      echo "$file.o: $file.c" >> Makefile
      echo -e "\t\$(CC) \$(CFLAGS) -c $file.c" >> Makefile
      echo "" >> Makefile
    fi
  
  
  
done

if [ $ans == y ]; then
  echo "clean:" >> Makefile
  echo -e "\trm -f *.o *.x" >> Makefile
fi


exit 0
