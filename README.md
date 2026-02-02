# check.sh 
```

#!/bin/bash

#this code checks OUTCARs in the subdirectories and give the list of values depending on the subdirectory's name as an output.

base="100_hollow" # target directory 

printf "%-5s %s\n" "n_O" "TOTEN(eV)"
printf "%-5s %s\n" "----" "----------"

for d in "$base"/*/; do
    nO=$(basename "$d")
    outcar="$d/OUTCAR"

    if [[ -f $outcar ]]; then
        energy=$(grep "free  energy   TOTEN" "$outcar" | tail -1 | awk '{print $(NF-1)}')
        printf "%-5s %s\n" "$nO" "$energy"
    else
        printf "%-5s %s\n" "$nO" "NO_OUTCAR"
    fi
done
```
