#!/bin/bash

# create directory for test results
mkdir -p logs

# array of 11 NIST tests
test=(Frequency BlockFrequency CumulativeSums Runs LongestRun Rank Universal ApproximateEntropy Serial LinearComplexity FFT)

cd testing-area/
for i in {1..100}
do
	(
	mkdir -p ../logs/$i;
	cd NIST$i/;
	
	printf "0\n../../data_idq/x$i\n0\n111111100110011\n0\n300\n1\n" | ./assess 1000000 > /dev/null;
	cd experiments/AlgorithmTesting/;
	for j in ${!test[@]}
	do
		cp ${test[j]}/results.txt ../../../../logs/$i/$j.txt
	done
	cd ../../..;
	echo "$i done @ `date`";
	rm -R NIST$i;
	) &
done
wait
cd ..

