#!/bin/bash

#SBATCH --job-name=lcexp_en_base
#SBATCH --mail-type=ALL
#SBATCH --mail-user=admin@tonioweidler.de
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=12
#SBATCH --partition=normal
#SBATCH --constraint=gpu
#SBATCH --hint=nomultithread

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# load modules
module load daint-gpu
module load cray-python
module load cudatoolkit/10.0.130_3.22-7.0.1.0_5.2__gdfb4ce5

# load virtual environment
source ${HOME}/lcvenv/bin/activate

# start job
python3 -O model/network/train_efficient_net.py data/imagenet/ -j=0 -a=efficientnet-b0 --opt_inh --gpu 0
