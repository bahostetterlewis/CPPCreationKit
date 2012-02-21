#! /bin/bash
#oc.sh
#Create by Barrett Lewis
#opens both class files side by side
#one parameter, name of the file, automatically
#converts it to all lower case and then gives them to vim

#NAME=$(echo $1 | tr '[A-Z]' '[a-z]')
NAME=$1
FILE1="`pwd`/${NAME}.cpp"
FILE2="`pwd`/${NAME}.h"

if [ ! -f $FILE1 -a ! -f $FILE2 ]
	then
		echo "Class <${NAME}> does not exist in current directory \"`pwd`\""
elif [ -f $FILE1 -a ! -f $FILE2 ]
	then
		echo "file <${NAME}.cpp> has no .h file <${NAME}.h> in directory \"`pwd`\""
elif [ ! -f $FILE1 -a -f $FILE2 ]
	then
		echo "file <${NAME}.h> has no .cpp file <${NAME}.cpp> in directory \"`pwd`\""
else
	vim -O $FILE2 $FILE1
fi
