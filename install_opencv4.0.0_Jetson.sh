#!/bin/bash
#
# Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA Corporation and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA Corporation is strictly prohibited.
#
pip3 install numpy
pip3 install protobuf
#pip3 install PyGTK


version="4.0.0"
folder="workspace"

echo $VIRTUAL_ENV

echo "** Remove other OpenCV first"
# sudo apt-get purge *libopencv*


echo "** Install requirement"
sudo apt-get update
sudo apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install -y python2.7-dev python3.8-dev python-dev python-numpy python3-numpy
sudo apt-get install -y libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev
sudo apt-get install -y libv4l-dev v4l-utils qv4l2 v4l2ucp
sudo apt-get install -y curl


echo "** Download opencv-"${version}
mkdir $folder
cd ${folder}
curl -L https://github.com/opencv/opencv/archive/${version}.zip -o opencv-${version}.zip
curl -L https://github.com/opencv/opencv_contrib/archive/${version}.zip -o opencv_contrib-${version}.zip
unzip opencv-${version}.zip
unzip opencv_contrib-${version}.zip
cd opencv-${version}/


echo "** Building..."
mkdir release
cd release/
cmake -D WITH_CUDA=ON -D WITH_CUDNN=ON -D CUDA_ARCH_BIN="5.3,6.2,7.2" -D CUDA_ARCH_PTX="" -D OPENCV_GENERATE_PKGCONFIG=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-${version}/modules -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON -D BUILD_opencv_python2=OFF -D PYTHON_EXECUTABLE=${VIRTUAL_ENV}/bin/python3.8 -D BUILD_opencv_python3=ON -D BUILD_TESTS=OFF -D  BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D CMAKE_BUILD_TYPE=RELEASE -D INSTALL_PYTHON_EXAMPLES=ON -D OPENCV_PYTHON3_INSTALL_PATH=${VIRTUAL_ENV}/lib/python3.8/site-packages -D CMAKE_INSTALL_PREFIX=${VIRTUAL_ENV} ..
make -j2
make install


echo "** Install opencv-"${version}" successfully"
echo "** Bye :)"
