#!/bin/bash

mkdir -p data
for i in {1..100}
do
	dd if=/dev/urandom of=./data/$i.dat bs=1M count=40 status=none
done
