#!/bin/bash

makejobscript="make_job_file.sh"
JobFolder="JobFiles"

if [ ! -d $JobFolder ]; then
	mkdir -p $JobFolder
fi
for arg1 in  1 5 10 40 100; do
    for arg2 in  5 10 20 50; do
        OUTFILE=arg1$arg1-arg2$arg2".job"
        bash ./$makejobscript $arg1 $arg2> ./$JobFolder/$OUTFILE
			
    done
done
done
done