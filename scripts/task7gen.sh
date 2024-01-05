#!/bin/sh
TASK_ID=40
mkdir -p output/task7/
cp 7_rev/PROTOCOL.md output/task7/
for i in $(seq 1 49); do
  KEY=$(./build/keygen $TASK_ID)
  ./build/revproto "$KEY" "output/task7/task7.pcap"
  cd output/task7/
  zip "task7_${i}.zip" task7.pcap PROTOCOL.md
  cd ../../
done