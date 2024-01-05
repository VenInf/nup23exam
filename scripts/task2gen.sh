#!/bin/sh
source ./scripts/init.sh
mkdir -p output/task2/
TASK_ID=34
for i in $(seq 1 49); do
  KEY=$(./build/keygen $TASK_ID)
  for binary in http_server http_server.aarm http_server.ax64 http_server.exe; do
    ./build/keyset "build/${binary}" "$KEY" "output/task2/${binary}"
  done
  codesign -f -s - output/task2/http_server.a*
  cd output/task2/
  zip "task2_${i}.zip" http_server http_server.aarm http_server.ax64 http_server.exe
  rm -f http_server http_server.aarm http_server.ax64 http_server.exe
  cd ../..
done
