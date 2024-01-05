#!/bin/sh
TASK_ID=33
mkdir -p output/task1/
for i in $(seq 1 49); do
  KEY=$(./build/keygen $TASK_ID)
  ./build/trafgen "$KEY" "output/task1/task1.pcap"
  cd output/task1/
  zip "task1_${i}.zip" "task1.pcap"
  rm task1.pcap
  cd ../..
done