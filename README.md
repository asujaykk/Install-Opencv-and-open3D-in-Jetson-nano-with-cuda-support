# Install Opencv-and-open3D-in-Jetson-nano-with-cuda-support.
Basically here im explaining how to install opencv and open3d in jetson nano b01 developement board with cuda supprt and Gstreamer support.
The version of OpenCV and Open3D is as follows. 
   1. Python: 3.8.0 
   2. OpenCV: 4.0.0
   3. Open3D: 0.18.0

Jetson nano is by default comes with prebuild opencv which support both gstreamer and cuda. but no support available for open3D.
Open3D is also a usefull computer vision library for many 3D visualization task with OpenCV.

Installing Open3D and OpenCV together with cuda support was not worked for me straight forward, Thats is why im adding this repository to explain how to install OpenCv and Open3D in jetson nano with cuda and gstreamer support.

## Limitations/issues which i observed while installing Open3D and OpenCV in jetson nano.
1. Pre installed opencv is built for python 3.6.9, but basic Open3D need python 3.8 or later, so installing Open3D in root wont work.
2. Even after installing python 3.8 in the root, The installation of Open3D not worked (even tried to set python executable path explicitly to python 3.8)
3. My requirement was to have an environment where i can have both OpenCV and Open3D with cuda support and gstreamer support.
4. So the best option was as follows,
   * Create a python 3.8 virtual environment.
   * Build OpenCV and Open3D from source with cuda and Gstreamer support in this environment.
  
## Steps to install OpenCv and Open3D
1. Open terminal in your working directory.
2. Clone this repository to home directory.

       git clone https://github.com/asujaykk/Install-Opencv-and-open3D-in-Jetson-nano-with-cuda-support.git

3. Create 8GB swap memory for building pencv and open3d from source by running the '8gb_swap.sh' script.

       cd Install-Opencv-and-open3D-in-Jetson-nano-with-cuda-support
       sudo bash 8gb_swap.sh
4. Install virtualenv.

       cd ~
       sudo apt-get install virtualenv
5. Install python 3.8.

       sudo apt install python3.8
6. Install dependancies (This should be created before creating virtual environment for properly installing opencv to virtual environment)

       sudo apt-get update
       sudo apt-get install -y build-essential cmake git libgtk3.0-dev libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
       sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
       sudo apt-get install -y python2.7-dev python3.8-dev python-dev python-numpy python3-numpy
       sudo apt-get install -y libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev
       sudo apt-get install -y libv4l-dev v4l-utils qv4l2 v4l2ucp
       sudo apt-get install -y curl
7.  Create A folder named 'V_ENV' to store all virtual environment.

        cd ~
        mkdir V_ENV
8. Create a virtual environment with python3.8 as 'opencv_open3d' inside 'V_ENV' folder.

         cd ~
         virtualenv -p python3.8 V_ENV/opencv_open3d
9. Now activate the newly created virtual environment..
   
        cd ~
        source V_ENV/opencv_open3d/bin/activate
   
10. Install OpenCV version 4.0.0 with the script from the cloned folder.
    Close all other applications while installing (otherwise build may break due to out of memory error)

        cd ~
        cd Install-Opencv-and-open3D-in-Jetson-nano-with-cuda-support
        bash install_opencv4.0.0_Jetson.sh
    
11. Remove existing old cmake and Install cmake version greater than 3.20.0

        sudo apt remove --purge cmake
        hash -r
        sudo snap install cmake --classic
        
12. Install open3d version 0.18.0 with the script 'install_open3d_jetsonnano.sh'.
    Close all other applications while installing (otherwise build may break due to out of memory error)
    
        bash  install_open3d_jetsonnano.sh
13. Run 'open3d_test_real_render.py' python script available in the folder to verify whether Open3D and OpenCV working.
   Once you run the script,  then first a heat map image shows up and then a 3D visualization of the same heatmap appear as given below.

        cd ~
        source V_ENV/opencv_open3d/bin/activate
        cd Install-Opencv-and-open3D-in-Jetson-nano-with-cuda-support
        python3 open3d_test_real_render.py
    
The heat map image visualized by opencv
    
![Screenshot from 2024-07-24 23-12-54](https://github.com/user-attachments/assets/78e6c7e5-235d-4597-9a03-3cbdb7f7f38f)
The heat map visualized with open3D.
    


![vokoscreen-2024-07-24_23-28-33](https://github.com/user-attachments/assets/1158fa21-d426-4d2c-b130-72b4352ad1f2)

References:
1. Open3D : https://github.com/isl-org/Open3D
2. opencv installation script  : https://github.com/AastaNV/JEP/tree/eb1afabb256a9a9bf9c4790c5ed1a300e993f9ae/script



     
 
