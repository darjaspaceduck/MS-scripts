#!/bin/bash

dirs=(100 110 111) 			# имя массива 

for d in "${dirs[@]}"; do 		# цикл по массиву
    mkdir -p "./test_new/$d"

    cp INCAR    "./test_new/$d/"
    cp KPOINTS "./test_new/$d/"
    cp POTCAR  "./test_new/$d/"
    cp "./poscars/POSCAR_$d" "./test_new/$d/POSCAR"
    cp "./job.bash" "./test_new/$d/"
    sed -i "s/^#SBATCH --job-name=.*/#SBATCH --job-name=test$d/" "./test_new/$d/job.bash"
done
