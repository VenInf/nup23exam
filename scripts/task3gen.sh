#!/bin/sh
source ./scripts/init.sh
TASK_ID=35
mkdir -p output/task3/
o=$(pwd)
for i in $(seq 1 49); do
  KEY=$(./build/keygen $TASK_ID)
  cd "${o}/3_http/"
  FLAG="$KEY" "${o}/build/writeflag" > src/flag.rs
  cargo build -r --target x86_64-pc-windows-gnu --target x86_64-unknown-linux-musl --target-dir build/
  docker run -ti -v .:/src --network=host artifactory.wgdp.io/wtp-docker/library/rust:1.74-osxcross \
  sh -c "cd /src && cargo build -r --target x86_64-apple-darwin --target aarch64-apple-darwin --target-dir build/"
  cp build/x86_64-pc-windows-gnu/release/http_server.exe "$o/output/task3/task3.exe"
  cp build/x86_64-unknown-linux-musl/release/http_server "$o/output/task3/task3.linux"
  cp build/x86_64-apple-darwin/release/http_server "$o/output/task3/task3.x64mac"
  cp build/aarch64-apple-darwin/release/http_server "$o/output/task3/task3.armmac"
  cd "${o}/output/task3/"
  strip task3.*
  file task3.*
  zip "task3_${i}.zip" task3.*
  rm -vf task3.*
  cd "${o}"
done
