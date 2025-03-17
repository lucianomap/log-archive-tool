#!/bin/bash

#Verifying if the argument passed is valid

if [[ ! -e $1 ]] ; then
        echo "Please inform an existing file or directory."
        exit 1
fi

#Assigning variables

directory=$1
date=$(date +%Y%m%d)
current_time=$(date +%H%M%S)


#Compressing

echo "Compressing $1 ..."
sudo tar -cvzf "${directory}_$(echo "$date")_$(echo "$current_time").tar.gz" $directory


#Verifying if the filed has been compressed

if [[ $? = 0 ]]; then
        echo "File compressed successfully!"
else
        echo "Compression failed."
        exit 1
fi
