#!/usr/bin/env bash

for i in $(seq 1 16)
do
    echo "threads $i"
    for j in $(seq 1 5)
    do
        echo "run $j"
        ( nice -n -20 ./main READ_ONLY -n $i -arr 5000 -d 70000 -m ) 1> /dev/null 2>> readonly4.log;
    done
done
