#!/bin/bash

makejobscript="make_job_file.sh"
JobFolder="JobFiles"

if [ ! -d $JobFolder ]; then
	mkdir -p $JobFolder
fi


for arg1 in 2 3 4; do
	for arg2 in 1 2 3; do 
		OUTFILE=arg1$arg1".job"
                bash ./$makejobscript $arg1 $arg2> ./$JobFolder/$OUTFILE
    done
done

