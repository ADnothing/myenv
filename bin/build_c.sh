#!/usr/bin/env bash

touch $1.c

echo "/*" >> $1.c
echo "USER, date" >> $1.c
echo "" >> $1.c
echo "Compilation :" >> $1.c
echo "gcc -ansi -Wall -Wextra -o file.x file.c" >> $1.c 
echo "Execution :" >> $1.c
echo "./file.x" >> $1.c
echo "*/" >> $1.c
echo "" >> $1.c
echo "int main(void)" >> $1.c
echo "{" >> $1.c
echo "/* VARIABLES */" >> $1.c
echo "" >> $1.c
echo "" >> $1.c
echo "/* INSTRUCTIONS */" >> $1.c
echo "" >> $1.c
echo "" >> $1.c
echo "return 0;" >> $1.c
echo "}" >> $1.c

exit 0
