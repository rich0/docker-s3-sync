#!/bin/sh
echo "CALLED WITH [ $* ]"
while [ true ]
do
  echo "RUNNING [ $* ]"
  sh -c "$*"

  if [ "${SYNC_PERIOD:-0}" -le 0 ]
  then
    echo "Sync period is <= 0, exiting"
    break
  fi

  sleep $SYNC_PERIOD
done
