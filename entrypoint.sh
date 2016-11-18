#!/bin/bash
while [ true ]
do
  $*

  if [ "${SYNC_PERIOD:-0}" -le 0 ]
  then
    break
  fi

  sleep $SYNC_PERIOD
done;
