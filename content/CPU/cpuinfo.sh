#!/bin/bash
# Created by: Seb Blair
# Date Created: 23/02/2023
# Version 2.2
# Notes: programmatically print out cores and information


#NTHCORE=$(lscpu|awk 'NR==3 {print $2}')
CPUDIR=/sys/devices/system/cpu/cpu0/cpufreq/
NTHCORE=$(lscpu | grep -w "CPU(s):*" | awk 'NR==1 {print$2}')
COLUMNS=''
HEADER="SCPU Policies\t| CORES 0:${NTHCORE}-->"

for (( c=0; c<=${NTHCORE}; c++ ))
do
  COLUMNS="${COLUMNS} -"
done

echo -e ${HEADER}

for i in ${CPUDIR}{cpuinfo,scaling}_*; do #iterate over the all cput frequencies
  PNAME=$(basename $i)

  [[ "${PNAME}" == *available* ]] || [[ "${PNAME}" == *transition* ]] || \
  [[ "${PNAME}" == *driver* ]]    || [[ "${PNAME}" == *setspeed* ]] && continue

  echo "${PNAME}: "

  for (( j=0; j<${NTHCORE}; j++ ))
  do
    KPARAM=$( echo $i | sed "s/cpu0/cpu$j/" ) # replace cpu0 with cpuj for  /sys/devices/system/cpu/cpuj/cpufreq...
    cat "${KPARAM}"
  done
done | paste ${COLUMNS} | column -t