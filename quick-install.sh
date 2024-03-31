#!/bin/bash

# Made by Pelochus
# Check for more info: https://github.com/Pelochus/EZRKNN-Toolkit2/

echo
echo "#########################################"
echo "Checking root permission..."
echo "#########################################"
echo

if [ "$EUID" -ne 0 ]; then 
  echo "Please run this script as root!"
  exit
fi

echo
echo "#########################################"
echo "Installing apt dependencies..."
echo "#########################################"
echo

sudo apt install -y git python-is-python3 python3-pip libxslt1-dev zlib1g-dev libglib2.0-dev libsm6 libgl1-mesa-glx libprotobuf-dev build-essential adb

echo
echo "#########################################"
echo "Cloning repository..."
echo "#########################################"
echo

git clone https://github.com/Pelochus/EZRKNN-Toolkit2.git
cd EZRKNN-Toolkit2/

echo
echo "#########################################"
echo "Installing pip dependencies for ARM64..."
echo "#########################################"
echo

pip install ./rknn-toolkit-lite2/packages/rknn_toolkit_lite2-2.0.0b0-cp311-cp311-linux_aarch64.whl
pip install -r ./rknn-toolkit2/packages/requirements_cp311-2.0.0b0.txt

echo
echo "#########################################"
echo "Installing RKNN NPU API..."
echo "#########################################"
echo

cp ./rknpu2/runtime/Linux/librknn_api/aarch64/librknnrt.so /usr/lib/
# TODO: Check if it should be copied to /usr/include instead
cp ./rknpu2/runtime/Linux/librknn_api/include/* /usr/local/include
