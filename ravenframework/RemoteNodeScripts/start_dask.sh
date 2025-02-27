#Created on Mar 21, 2023
#
# OUTPUT FILE FOR LOGGING
OUTFILE=$1
SCHEDULER_FILE=$2
NUM_CPUS=$3
RAVEN_FRAMEWORK_DIR=$4
REMOTE_BASH=$5
WORKING_DIR=$6
PYTHONPATH=$7
export PYTHONPATH

echo starting >> $OUTFILE

cd $WORKING_DIR
source $REMOTE_BASH >> $OUTFILE 2>&1

which dask >> $OUTFILE 2>&1
hostname >> $OUTFILE
echo PYTHONPATH $PYTHONPATH >> $OUTFILE

dask worker --nworkers $NUM_CPUS --scheduler-file $SCHEDULER_FILE  >> $OUTFILE 2>&1 &
