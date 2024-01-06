#!/bin/sh
source ./scripts/init.sh
TASK_ID=34
mkdir -p output/task2/
o=$(pwd)
for i in $(seq 1 49); do
  KEY=$(./build/keygen $TASK_ID)
  cd "${o}/2_dns/"
  FLAG="$KEY" "${o}/build/writeflag" > src/flag.rs
  cargo build -r --target x86_64-pc-windows-gnu --target x86_64-unknown-linux-musl --target-dir build/
  docker run -ti -v .:/src --network=host artifactory.wgdp.io/wtp-docker/library/rust:1.74-osxcross \
  sh -c "cd /src && cargo build -r --target x86_64-apple-darwin --target aarch64-apple-darwin --target-dir build/"
  cp build/x86_64-pc-windows-gnu/release/dns_server.exe "$o/output/task2/task2.exe"
  cp build/x86_64-unknown-linux-musl/release/dns_server "$o/output/task2/task2.linux"
  cp build/x86_64-apple-darwin/release/dns_server "$o/output/task2/task2.x64mac"
  cp build/aarch64-apple-darwin/release/dns_server "$o/output/task2/task2.armmac"
  cd "${o}/output/task2/"
  strip task2.*
  file task2.*
  zip "task2_${i}.zip" task2.*
  rm -vf task2.*
  cd "${o}"
done
