#!/bin/bash

[ "$#" -ne "2" ] && echo 'Unesite odredisni i izvorisni direktorij.' && exit 1

source=$1
destination=$2

if [ ! -d "$destination" ]
then
    mkdir "$destination" && echo "Stvaram direktorij $destination"
fi

find "$source" -type f | while read file
do
    date=`stat -x -t "%F" "$file" | grep -i 'Modify:' | grep -Eio '[0-9]{4}-[0-9]{2}'`
    subDestination="$destination/$date"
    if [ ! -d "$subDestination" ]
    then
        mkdir "$subDestination" && echo "Stvaram direktorij $subDestination"
    fi

    mv "$file" "$subDestination"
done
