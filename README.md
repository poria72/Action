# Action Recognition using Pyramid Decomposition of Motion Information
This Repository is Implementation Code of Proposed Method in [Action Recognition using Pyramid Decomposition of Motion Information Paper](https://ieeexplore.ieee.org/document/8786379).

## Abstract
In this paper, a temporal representation method for video action recognition is proposed. Since the intrinsic property of the video signal is its temporal variation, the optical flow image is calculated to show short-term motion. In order to present a low complexity action recognition method, pre-trained large-scale image datasets networks are utilized for feature extraction. For video level representation pyramid pooling time series is considered since the short-term variation can be captured and form the fixed-size long-term features. In addition, to solve the information missing problem through long videos, a simple video level representation using temporal partitioning are proposed too. The experimental results of the proposed methods illustrate an acceptable performance both in first and third-person action recognition.

## Prerequisites
**This Code Runs On MATLAB R2016b and in CPU Mode.**
To run This Code You Will Need Some Toolbox and Library. Please Install Following Steps in Order:
1. **MatConvNet**, CNNs for MATLAB and **vlfeat**:
>MatConvNet is a MATLAB toolbox implementing Convolutional Neural Networks (CNNs) for computer vision applications. It is simple, efficient, and can run and learn state-of-the-art CNNs. Many pre-trained CNNs for image classification, segmentation, face recognition, and text detection are available.
Go To This [Link](http://www.vlfeat.org/matconvnet/) and Install MatConvNet and vlfeat. _DON'T REMMEMBER TO ADD INSTALATION FOLDER TO MATLAB PATH._
vlfeat Will Be Installed During MatConvNet Instaltion.
*Our Version is: matconvnet-1.0-beta23 , vlfeat-0.9.20*

2. **Pre-Trained CNN:**
>We Used [imagenet-vgg-f](http://www.vlfeat.org/matconvnet/models/imagenet-vgg-f.mat) as The Pre-Trained CNN For Feature Extraction. Download and Copy it to The Root Folder of Project.

3. **MMRead**
>In Order To Read Video Frames, We Used mmread MATLAB Library. You Can Download it [Here](https://www.mathworks.com/matlabcentral/fileexchange/8028-mmread).

4. **LIBSVM**
> LIBSVM is an integrated software for support vector classification, (C-SVC, nu-SVC), regression (epsilon-SVR, nu-SVR) and distribution estimation (one-class SVM). It supports multi-class classification. This Library and it's Documentation Are Available in [This Link](https://www.csie.ntu.edu.tw/~cjlin/libsvm/).
*Our Version is: libsvm-3.22*

5. **Optical Flow Extraction Library:**
> Optical Flow Extraction is a Bottleneck In This Code, So We Used an Dence Optical Flow Extraction Implemented in C++ by C. Liu. Download This Library From [Here](https://people.csail.mit.edu/celiu/OpticalFlow/) and Compile It Using It's Description(You Will Need a C++ Compiler in This Step That Can Be VisualStudio C++ Compiler of MinGW).
  
# How To Use
After Install Libraries, Clone This Repository into a Folder. Your Dataset Should Be Placed in Root Folder By This Ordering:

- Datset Folder

  - Classes as Sub-Folder
  
    - Class Samples as Video File
      
For Example:

- KTH

  - boxing
  
    - video1.avi
    
    - video2.avi
    
    - ...
    
  - handclapping
  
    - video1.avi
    
    - video2.avi
    
    - ...
    
  - ...
  
`Main.m`, `getSettings.m` Are The All Files That You Need.

In Order to Run The Code, Firstly Initialize Variables in `getSettings.m` Based On Guides in Comments, Then Run `Main.m`.

