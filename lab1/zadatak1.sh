#!/bin/bash

# 1,2
proba="Ovo je proba"
echo $proba
echo

# 3
lista_datoteka=*
echo $lista_datoteka
echo

# 4
for i in {1..3}
do
	proba3=$proba3$proba'. '
done
echo proba3
echo

# 5
a=4 && b=3 && c=7
echo $((($a+4)*$b % $c))
echo

# 6
broj_rijeci=`cat *.txt | wc -w`
echo "Broj rijeci u .txt datotekama je: $broj_rijeci"
echo

# 7
echo "Kazalo: "
ls ~
echo

# 8
echo "passwd: "
cut -f 1,6,7 -d : /etc/passwd | tail -n +11
echo

# 9
ps -fA | tr -s " " | cut -f 2,3,9 -d ' '
