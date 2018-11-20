#!/usr/bin/env bash

for i in `seq 1 32`
do
    for j in `seq 1 10`
    do
        echo "N=$i t=$j" >> spin.log;
        ( time ./main SPIN -n $i -a 5000 -d 27000 ) 1> /dev/null 2>> spin.log;
    done
done
