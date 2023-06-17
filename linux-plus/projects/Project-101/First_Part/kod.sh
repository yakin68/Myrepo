#!/bin/bash

cat event_history.csv | grep serdar | grep TerminateInstances | tee result1.txt | awk -F ',' '/i-/ {print $1 $10}' result1.txt | cut -d '"' -f 1,7 | tee yak1.txt
