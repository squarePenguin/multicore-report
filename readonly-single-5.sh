#!/usr/bin/env bash

TEST="single-5"

echo $TEST

for i in $(seq 1 16)
do
    echo "threads $i"
    for j in $(seq 1 5)
    do
        echo "run $j"
        ( taskset -c 1 ./main READ_ONLY -n $i -arr 5 -d 1000000 -mutex ) 1> /dev/null 2>> $TEST.log;
    done
done
