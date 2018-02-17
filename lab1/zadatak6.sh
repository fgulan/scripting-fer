#!/bin/bash

backupFolder=${!#}
end=$((($#) -1))

if [ ! -d "$backupFolder" ]; then
    mkdir "$backupFolder"
    echo "Stvaram folder $backupFolder"
fi

counter=0
for index in $(eval echo "{1..$end}")
do
    file=`eval "echo \$"{$index}""`
    if [ -f "$file" ] && [ -r "$file" ]; then
        cp "$file" "$backupFolder" && ((counter++))
    elif [ ! -e "$file" ]; then
        echo "Datoteka $file ne postoji."
    elif [ ! -d "$file" ]; then
        echo "Problem s citanjem datoteke $file."
    fi
done

echo "Uspjesno kopirano $counter datoteka u direktorij $backupFolder"