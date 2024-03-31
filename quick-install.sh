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
echo "Installing pip dependencies..."
echo "#########################################"
echo

echo
echo "#########################################"
echo "Installing RKNN NPU server and API..."
echo "#########################################"
echo
