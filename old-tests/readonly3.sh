#!/usr/bin/env bash

for i in $(seq 1 16)
do
    echo "threads $i"
    for j in $(seq 1 5)
    do
        echo "run $j"
        ( nice -n -20 ./main READ_ONLY -n $i -arr 5 -d 60000000 -m ) 1> /dev/null 2>> readonly3.log;
    done
done
