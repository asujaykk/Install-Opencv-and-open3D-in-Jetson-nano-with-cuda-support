
version="0.18.0"

curl -L https://github.com/isl-org/Open3D/archive/refs/tags/v${version}.zip -o Open3D-${version}.zip
unzip Open3D-${version}.zip


echo $VIRTUAL_ENV

echo "** Install requirement"
sudo apt-get update -y
sudo apt-get install -y apt-utils build-essential python3-dev xorg-dev libglu1-mesa-dev libblas-dev liblapack-dev liblapacke-dev libsdl2-dev libc++-7-dev libc++abi-7-dev libxi-dev clang-7 libjpeg-dev gfortran

python3 -m pip install Cython
python3 -m pip install -U numpy
python3 -m pip install -U matplotlib


echo "** Building..."
cd Open3D-${version}
mkdir build
cd build

cmake -DBUILD_CUDA_MODULE=ON -DCMAKE_CUDA_COMPILER="/usr/local/cuda-10.2/bin/nvcc" -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON  -DBUILD_GUI=ON -DBUILD_TENSORFLOW_OPS=OFF -DBUILD_PYTORCH_OPS=OFF -DBUILD_UNIT_TESTS=OFF -DCMAKE_INSTALL_PREFIX=~/open3d_install -DPython3_EXECUTABLE=$(which python) ..

make -j2
make install
make install-pip-package
