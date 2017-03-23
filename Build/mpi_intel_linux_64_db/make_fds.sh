#!/bin/bash
platform=intel64
dir=`pwd`
target=${dir##*/}

if [ "$IFORT_COMPILER" != "" ]; then
source $IFORT_COMPILER/bin/compilervars.sh $platform
fi
source ../Scripts/set_mpidist.sh eth $MPIDIST_ETH
if [ "$MPIDIST" == "" ]; then
  exit
fi

echo Building $target with $MPIDIST
make -j4 MPIFORT="$MPIFORT" VPATH="../../Source" -f ../makefile $target
