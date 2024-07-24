#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Feb 18 11:39:47 2024

@author: akhil_kk
"""

import numpy as np
import open3d as o3d
import cv2

img_disp =cv2.imread('img_disp.jpg', cv2.IMREAD_GRAYSCALE)
img =cv2.imread('img_hsv.jpg')

print(img[369,650])
cv2.imshow('imgi',img)
cv2.waitKey(11000)
h, w = img.shape[:2]
print(h)
print(w)
total_pix= w*h

# Step 1: Generate random 3D points or define specific coordinates
# Generate random 3D points
num_points = 2
points = np.random.rand(num_points, 3)  # Generate random points in the range [0, 1]

points = np.ones((total_pix,3)) *255
colours= np.zeros((total_pix,3)) 
count=0


 
for i in range(0,h,1):
   for j in range(0,w,1):
        if count ==total_pix:
            break
        points[count]= [i,j,img_disp[i,j] ]
        #colours[count] = [0, 0, 1]
        colours[count] = [img[i,j,2]/255, img[i,j,1]/255, img[i,j,0]/255]
        count+=1
        
#print(points)
#exit()


#print(points)
# Alternatively, you can define specific coordinates
# points = np.array([[x1, y1, z1], [x2, y2, z2], ...])

# Step 2: Convert the NumPy array to an Open3D PointCloud object
point_cloud = o3d.geometry.PointCloud()


point_cloud.points = o3d.utility.Vector3dVector(points)
point_cloud.colors = o3d.utility.Vector3dVector(colours)
# Step 3: Visualize the PointCloud using Open3D's visualization tools
#o3d.visualization.draw_geometries([point_cloud])


import time

vis = o3d.visualization.Visualizer()
vis.create_window(
    window_name='3D visualization',
    width=960,
    height=540,
    left=480,
    top=270)
vis.get_render_option().background_color = [0.05, 0.05, 0.05]
vis.get_render_option().point_size = 1
vis.get_render_option().show_coordinate_frame = True

vis.add_geometry(point_cloud)

frame = 0

while True:
    #points[:,2] +=3
    #print(points)
    point_cloud.points = o3d.utility.Vector3dVector(points)
    vis.update_geometry(point_cloud)
    vis.poll_events()
    vis.update_renderer()
    # # This can fix Open3D jittering issues:
    time.sleep(0.005)
