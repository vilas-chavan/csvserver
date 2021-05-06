#!/bin/bash
RANDOM=$$
for i in {0..9}
do
        echo $i, $RANDOM
done >> ./inputdata/inputFile
