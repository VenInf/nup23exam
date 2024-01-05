#!/bin/sh
TASK_ID=33
mkdir -p output/task1/
for i in $(seq 1 49); do
  KEY=$(./build/keygen $TASK_ID)
  ./build/trafgen "$KEY" "output/task1/elem_${i}.pcap"
  gzip "output/task1/elem_${i}.pcap"
done