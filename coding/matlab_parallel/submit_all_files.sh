#!/bin/bash

JobFolder="JobFiles"
ResFolder="res"
if [ ! -d $ResFolder ]; then
	mkdir -p $ResFolder
fi

for arg1 in  1 5 10 40 100; do
    for arg2 in  5 10 20 50; do
        JOBFILE=arg1$arg1-arg2$arg2".job"
        sbatch ./$JobFolder/$JOBFILE

    done
done
done
done