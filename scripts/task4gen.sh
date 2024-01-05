#!/bin/sh
source ./scripts/init.sh
TASK_ID=36
mkdir -p output/task4/
o=$(pwd)
for i in $(seq 1 49); do
  KEY=$(./build/keygen $TASK_ID)
  cd "${o}/4_tcp/"
  FLAG="$KEY" "${o}/build/writeflag" > src/flag.rs
  cargo build -r --target x86_64-pc-windows-gnu --target x86_64-unknown-linux-musl --target-dir build/
  docker run -ti -v .:/src --network=host artifactory.wgdp.io/wtp-docker/library/rust:1.74-osxcross \
  sh -c "cd /src && cargo build -r --target x86_64-apple-darwin --target aarch64-apple-darwin --target-dir build/"
  cp build/x86_64-pc-windows-gnu/release/tcprst.exe "$o/output/task4/task4.exe"
  cp build/x86_64-unknown-linux-musl/release/tcprst "$o/output/task4/task4.linux"
  cp build/x86_64-apple-darwin/release/tcprst "$o/output/task4/task4.x64mac"
  cp build/aarch64-apple-darwin/release/tcprst "$o/output/task4/task4.armmac"
  cd "${o}/output/task4/"
  strip task4.*
  file task4.*
  zip "task4_${i}.zip" task4.*
  rm -vf task4.*
  cd "${o}"
done
