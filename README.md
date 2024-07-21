# Install Opencv-and-open3D-in-Jetson-nano-with-cuda-support.
Basically here im explaining how to install opencv and open3d in jetson nano b01 developement board with cuda supprt.
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

       git clone https://github.com/asujaykk/Opencv-and-open3D-in-Jetson-nano-with-cuda-support.git

3. Create 8GB swap memory for building pencv and open3d from source by running the '8gb_swap.sh' script.

       cd Opencv-and-open3D-in-Jetson-nano-with-cuda-support
       sudo bash 8gb_swap.sh
4. Install virtualenv.

       cd ~
       sudo apt-get install virtualenv
5. Install python 3.8.

       sudo apt install python3.8
6. Create A folder named 'V_ENV' to store all virtual environment.

        cd ~
        mkdir V_ENV
7. Create a virtual environment with python3.8 as 'opencv_open3d' inside 'V_ENV' folder.

         cd ~
         virtualenv -p python3.8 V_ENV/my_env
8. Now activate the newly created virtual environment..
   
        cd ~
        source V_ENV/my_env/bin/activate
   
10. Install OpenCV version 4.0.0 with the script from the cloned folder.
    Close all other applications while installing (otherwise build may break due to out of memory error)

        cd ~
        cd Opencv-and-open3D-in-Jetson-nano-with-cuda-support
        bash install_opencv4.0.0_Jetson.sh
    
12. Remove existing old cmake and Install cmake version greater than 3.20.0

        sudo apt remove --purge cmake
        hash -r
        sudo snap install cmake --classic
        
13. Install open3d version 0.18.0 with the script 'install_open3d_jetsonnano.sh'.
    Close all other applications while installing (otherwise build may break due to out of memory error)
    
        bash  install_open3d_jetsonnano.sh

        
     
 
