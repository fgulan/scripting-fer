#!/bin/bash

[ "$#" -ne "2" ] && echo 'Unesite odredisni direktorij i regex.' && exit 1

source=$1
name=$2

echo "Putanja: $source"
echo "Uzorak: $name"

echo "Ukupan broj redaka u datotekama s uzorkom $name je:"
find "$source" -mindepth 2 -maxdepth 2 -name "$name" -print0 | xargs -0 cat | wc -l