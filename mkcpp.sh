#! /bin/bash
# Created by Barrett Lewis
# creates a cpp file
FILE="${1}.cpp"
FILEL="`pwd`/${FILE}" #location of file
CMD="${2}"

function createCPP() #function to create the file template
{
	echo "#include <iostream>" > $FILE
	echo >> $FILE
	echo "using namespace std;" >> $FILE
	echo >> $FILE
	
	if [ x$CMD == "x-cmd" ] 
	then
		echo "int main(int argc, char *argv[])" >> $FILE
	else
		echo "int main()" >> $FILE
	fi

	echo "{" >> $FILE
	echo >> $FILE
	echo "  return 0;" >> $FILE
	echo "}" >> $FILE 
	vim $FILE
}

if [ ! -f $FILEL ] #checks if file doesn't exist
	then
 	 createCPP
else
	echo "<${FILE}> already exists in location <`pwd`/${FILE}>"
	echo "Do you wish to overwrite <${FILE}>, this process can't be reversed"

	while true; do #gets user input to confirm or deny rewriting file
		read -p "  yes  or  no  " yn
		case $yn in
			[Yy]* ) createCPP; break;;
			[Nn]* ) exit;;
			* ) echo "Please answer yes or no.";;
		esac
	done
fi
