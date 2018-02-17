#!/bin/bash

# 1
echo "Voce: "
grep -Ei 'banana|jabuka|jagoda|dinja|lubenica' namirnice.txt
echo

# 2
echo "Ne voce: "
grep -Eiv 'banana|jabuka|jagoda|dinja|lubenica' namirnice.txt > ne-voce.txt
echo

# 3
echo "Sifre: "
grep -rE "[A-Z]{3}[0-9]{6}" ~/projekti
echo

# 4
echo "Mijenjane datoteke: "
find . -mtime +6 -mtime -15 -ls
echo

# 5
echo "Ispis brojeva od 1 do 15: "
for i in {1..15}; do echo $i; done
echo