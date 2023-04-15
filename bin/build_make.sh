#!/usr/bin/env bash

touch Makefile

echo "#===============================================================#" >> Makefile
echo -e "#\t\t\tVariables" >> Makefile
echo "#===============================================================#" >> Makefile
echo "" >> Makefile
echo "CC = gcc" >> Makefile
echo "CFLAGS = -ansi -Wall -Wextra" >> Makefile
echo "LIBS = libs" >> Makefile
echo "" >> Makefile
echo "#===============================================================#" >> Makefile
echo "# all	:	Compile all the executables" >> Makefile
echo "# clean	:	remove all the *.o and the executables" >> Makefile
echo "#===============================================================#" >> Makefile
echo "" >> Makefile

exit 0
