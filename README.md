# Opencv-and-open3D-in-Jetson-nano-with-cuda-support.
Basically here im explaining how to install opencv and open3d in jetson nano b01 developement board with cuda supprt.
Jetson nano is by default comes with prebuild opencv which support both gstreamer and cuda. but no support available for open3D.
Open3D is also a usefull computer vision library for many 3D visualization task with OpenCV.

Installing Open3D and OpenCV together with cuda support was not worked for me straight forward, Thats is why im adding this repository to explain how to install OpenCv and Open3D in jetson nano with cuda and gstreamer support.

## Limitations/issues which i observed while installing Open3D and OpenCV in jetson nano.
1. Pre installed opencv is built for python 3.6.9, but basic Open3D need python 3.8 or later, so installing Open3D in root wont work.
2. Even after installing python 3.8 in the root, The installation of Open3D not worked (even tried to set python executable path explicitly to python 3.8, but not worked)
3. My requirement was to have an environment where i can have both OpenCV and Open3D with cuda support and gstreamer support.
4. So the best option was as follows,
   * Create a python 3.8 virtual environment.
   * Build OpenCV and Open3D from source with cuda and Gstreamer support in this environment.
  
## Steps to install OpenCv and Open3D
1. Open terminal in your working directory.
2. Update the OS with following command.

       sudo apt-get update
       sudo apt-get upgrade
4. Clone this repository to your working directory with the following command.

        git clone git@github.com:asujaykk/Opencv-and-open3D-in-Jetson-nano-with-cuda-support..git
6. Install python3.8.

        sudo apt-get install python3.8
7. Install pip3

        sudo apt-get install python3-pip
9. Install virtualenv package.

        pip install virtualenv

11. Create A folder named VIRTUAL_ENV to store all virtual environment.

        mkdir VIRTUAL_ENV
13. Create a virtual environment with python3.8 as 'opencv_open3d' inside 'VIRTUAL_ENV' folder.

         virtualenv -p /usr/bin/python3.8 VIRTUAL_ENV/opencv_open3d




     
 
