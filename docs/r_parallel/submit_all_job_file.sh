#!/bin/bash

JobFolder="JobFiles"
ResFolder="res"
if [ ! -d $ResFolder ]; then
	mkdir -p $ResFolder
fi

# lam=null


for arg1 in 2 3 4; do
	for arg2 in 1 2 3; do 
		JOBFILE=arg1$arg1-arg2$arg2".job"
		sbatch ./$JobFolder/$JOBFILE
	done
done