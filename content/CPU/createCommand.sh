#!/bin/bash
# Created by: Seb Blair
# Date Created: 23/11/2020
# Version 1.0

# Makes script a command by removing extension, chmod +x  and cp to /usr/local/bin/command

USAGE(){
         echo -e  $1
         echo -e "\nUsage: [-c create command] [-v version]"
}

VERSION="Version: 1.0"
AUTHOR="Author: Seb Blair"
RELEASED="Release Date: 2020-11-23"
COMMANDDIR="/usr/local/bin/"

if [ $# -lt 1 ];then
        USAGE "Not enough arguments"
        exit 1
elif [ $# -gt 2 ];then
        USAGE "Too many arguments"
elif [[ ( $1 == '--help' ) || ( $1 == '-h' ) ]];then
        USAGE 'Help'
        exit 1
fi

# check for -c and that the file passed in exists
if [ ! $1 == '-c' ] || [ ! -f "$2" ]; then
        USAGE "please select correct option and 2nd argument needs to exist"
        exit 1
fi

FILE=$2
FILE=${FILE%.*}


sudo mv $2 ${FILE}
echo "$2 extension has now been removed and renamed as ${FILE}"

sudo chmod +x ${FILE}
echo "${FILE} is now an exe"

echo "copying ${FILE} to ${COMMANDDIR}${FILE}"
sudo cp ${FILE} ${COMMANDDIR}${FILE}

if [ ! -f "${COMMANDDIR}${FILE}" ];then
        USAGE "File not copied..."
        exit 1
else
        echo "${FILE} ready to use"
fi


