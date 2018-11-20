#!/usr/bin/env bash

for i in $(seq 1 16)
do
    for j in $(seq 1 10)
    do
        # echo "threads=$i run $j" >> spin.log;
        ( ./main SPIN -n $i -d 25000 ) 1> /dev/null 2>> spin.log;
    done
done
