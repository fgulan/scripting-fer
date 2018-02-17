#!/bin/bash

for file in localhost_access_log.????-02-??.txt
do
    date=`echo $file | sed -E 's/localhost_access_log\.(....)-(..)-(..)\.txt/\3-\2-\1/'`
    echo
    echo "datum: $date"
    echo "--------------------------------------------------"
    cut -d '"' -f 2 $file | sed 's/^/: /g'| sort | uniq -c | tr -s ' ' ' ' | sort -nr
done
