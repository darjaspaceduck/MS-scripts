#!/bin/bash

for d in ./111/111_adsSites/*/; do
    job="$d/job.bash"

    if [[ -f $job ]]; then
        echo "Submitting $job"
        ( cd "$d" && sbatch job.bash )
    else
        echo "No job.bash in $d — skipping"
    fi
done
