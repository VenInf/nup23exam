#!/bin/sh
source ./scripts/init.sh
TASK_ID=35
mkdir -p output/task3/
for i in $(seq 1 49); do
  KEY=$(./build/keygen $TASK_ID)
  for binary in dns_server dns_server.aarm dns_server.ax64 dns_server.exe; do
    ./build/keyset "build/${binary}" "$KEY" "output/task3/${binary}"
  done
  codesign -f -s - output/task3/dns_server.a*
  cd output/task3/
  zip "task3_${i}.zip" dns_server dns_server.aarm dns_server.ax64 dns_server.exe
  rm -f dns_server dns_server.aarm dns_server.ax64 dns_server.exe
  cd ../..
done
