#!/bin/bash
echo "setup started @ `date`"
./1-setup.sh
echo "setup ended @ `date`"

#echo "data started @ `date`"
#./2-data.sh
#echo "data ended @ `date`"

echo "test started @ `date`"
./3-test.sh
echo "test ended @ `date`"

echo "---the end--- 🎅"
