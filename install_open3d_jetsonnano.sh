

git clone https://github.com/isl-org/Open3D

VIRTUAL_ENV=/home/akhilkkjet/VENV/my_env_3
echo $VIRTUAL_ENV

sudo apt-get update -y
sudo apt-get install -y apt-utils build-essential python3-dev xorg-dev libglu1-mesa-dev libblas-dev liblapack-dev liblapacke-dev libsdl2-dev libc++-7-dev libc++abi-7-dev libxi-dev clang-7 libjpeg-dev gfortran

cd Open3D
mkdir build
cd build

cmake -DCMAKE_CUDA_COMPILER=/usr/local/cuda-10.2/bin/nvcc -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DBUILD_CUDA_MODULE=ON -DBUILD_GUI=ON -DBUILD_TENSORFLOW_OPS=OFF -DBUILD_PYTORCH_OPS=OFF -DBUILD_UNIT_TESTS=OFF -DCMAKE_INSTALL_PREFIX=~/open3d_install -DPYTHON_EXECUTABLE=$(which python) ..

make -j2
make install

python3 -m pip install Cython
python3 -m pip install -U numpy
python3 -m pip install -U matplotlib

make install-pip-package
