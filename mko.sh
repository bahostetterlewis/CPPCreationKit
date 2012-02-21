#! /bin/bash
# mkc.sh
# Created by Barrett Lewis
# creats a class and header file
# creates basic functions
NAME=$1
FNAME=$(echo $1 | tr '[A-Z]' '[a-z]')
CPP="${FNAME}.cpp"
H="${FNAME}.h"
CPPL="`pwd`/${CPP}" #location that cpp will exist in
HL="`pwd`/${H}" #location that h will exist

function createCPP() #creates the CPP files
{
	echo Making file:$CPP
	echo "#include \"${H}\"" > $CPP
	echo >> $CPP
	echo "${NAME^}::${NAME^}()" >> $CPP
	echo "{" >> $CPP
	echo >> $CPP
	echo "}" >> $CPP
	echo >> $CPP
	echo "${NAME^}::~${NAME^}()" >> $CPP
	echo "{" >> $CPP
	echo >> $CPP
	echo "}" >> $CPP
}

function createH() #create h file
{
	echo Making file:$H
 	echo "#ifndef ${NAME^^}_H" > $H
	echo "#define ${NAME^^}_H" >> $H
	echo >> $H
	echo "#include <iostream>" >> $H
	echo "using namespace std;" >> $H
	echo >> $H
	echo "class ${NAME^}" >> $H
	echo "{" >> $H
	echo "  public:" >> $H
	echo "    ${NAME^}();" >> $H
	echo "    ~${NAME^}();" >> $H
	echo "	protected:" >> $H
	echo "  private:" >> $H
	echo >> $H
	echo "};" >> $H
	echo >> $H
	echo "#endif" >> $H 
}

if [ ! -f $CPPL -a ! -f $HL ]
	then
		echo Using name $1
		createCPP
		createH
		vim -O $H $CPP
elif [ -f $CPPL -a ! -f $HL ]
	then
		echo using name $1
		createH
		echo "<${CPP}> already exists in location <${CPPL}>"
		echo "Overwrite <${CPP}>, this process can't be reversed"
		while true; do #get user input about replacing cpp
			read -p "  Yes  or  No  " yn
			case $yn in
				[Yy]* ) createCPP; break;;
				[Nn]* ) exit;;
				* ) echo "Please answer yes or no.";;
			esac
		done
		vim -O $H $CPP
elif [ ! -f $CPPL -a -f $HL ]
	then
		echo using name $1
		createCPP
		echo "<${H}> already exists in location <${HL}>"
		echo "Overwrite <${H}>, this process can't be reversed"
		while true; do
				read -p "  Yes  or  No  " yn
				case $yn in
				[Yy]* ) createH; break;;
				[Nn]* ) exit;;
				* ) echo "Please answer yes or no.";;
			esac
		done
		vim -O $H $CPP
else
	echo "<${H}> already exists in location <${HL}>"
	echo "Overwrite <${H}>, this process can't be reversed"
	while true; do
			read -p "  Yes  or  No  " yn
			case $yn in
			[Yy]* ) createH; break;;
			[Nn]* ) exit;;
			* ) echo "Please answer yes or no.";;
		esac
	done 
	echo "<${CPP}> already exists in location <${CPPL}>"
	echo "Overwrite <${CPP}>, this process can't be reversed"
	while true; do #get user input about replacing cpp
		read -p "  Yes  or  No  " yn
		case $yn in
			[Yy]* ) createCPP; break;;
			[Nn]* ) exit;;
			* ) echo "Please answer yes or no.";;
		esac
	done
	vim -O $H $CPP
fi
