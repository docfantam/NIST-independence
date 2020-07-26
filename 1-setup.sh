#!/bin/bash

# download NIST
wget -q https://csrc.nist.gov/CSRC/media/Projects/Random-Bit-Generation/documents/sts-2_1_2.zip

# extract NIST
unzip -q sts-2_1_2.zip
rm sts-2_1_2.zip

# rename directory and subdirectory
mv sts-2.1.2/ testing-area/
cd testing-area
mv sts-2.1.2/ NIST1/

# execute makefile
cd NIST1
make > /dev/null
cd ..

# make multiple NIST instances
for i in {2..100}
do
	cp -R NIST1/ NIST$i/
done
cd ..
