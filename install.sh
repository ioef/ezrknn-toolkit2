#!/bin/bash

# Made by Pelochus
# Check for more info: https://github.com/Pelochus/ezrknn-toolkit2/

message_print() {
  echo
  echo "#########################################"
  echo $1
  echo "#########################################"
  echo
}

message_print "Checking root permission..."

if [ "$EUID" -ne 0 ]; then 
  echo "Please run this script as root!"
  exit
fi

# message_print "Changing to repository..."

# git clone https://github.com/Pelochus/ezrknn-toolkit2.git
# cd ezrknn-toolkit2/

message_print "Installing pip dependencies for ARM64..."

pip install --break-system-packages ./rknn-toolkit-lite2/packages/rknn_toolkit_lite2-2.3.0-cp312-cp312-manylinux_2_17_aarch64.manylinux2014_aarch64.whl
pip install --break-system-packages -r ./rknn-toolkit2/packages/arm64/arm64_requirements_cp312.txt

message_print "Installing RKNN NPU API..."

cp ./rknpu2/runtime/Linux/librknn_api/aarch64/librknnrt.so /usr/lib/
# TODO: Check if it should be copied to /usr/include instead
cp ./rknpu2/runtime/Linux/librknn_api/include/* /usr/local/include

message_print "Compiling RKNN Benchmark for RK3588..."

cd ./rknpu2/examples/rknn_benchmark/
bash build-linux.sh -t rk3588 -a aarch64 -b Release
cp install/rknn_benchmark_Linux/rknn_benchmark /usr/bin/rknn_benchmark

message_print "Done installing ezrknn-toolkit2!"

