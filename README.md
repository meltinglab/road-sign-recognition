# road-sign-recognition
The aim of the project is to build and train a Neural Network for road sign classification and 
deploy it on Raspberry Pi.

## Getting Started
These instructions explain how to set up the tools needed to execute the steps described in the next sections. 
### Prerequisites
In order to reproduce the examples the following tools are needed:
- Raspberry Pi (tested on Model 2B and 3B)
- MATLAB Deep Learning Toolbox
- MATLAB Coder
- Embedded Coder
- MATLAB Support Package for Raspberry Pi Hardware
- MATLAB Coder Interface for Deep Learning Libraries
- [German Traffic Sign Recognition Benchmark (GTSRB) Dataset](http://benchmark.ini.rub.de/?section=gtsrb&subsection=dataset)
### Installing
Install MATLAB and all the packages specified in the prerequisites section.
For the deployment on the Raspberry the Raspbian Mathworks image should be installed as well as the ARM Compute library and opencv libraries.

## Neural Network Configuration
In this section are described the instructions for the training and testing of the Convolutional Neural Network (mResNet). The files and scripts needed for this section can be found in the [mResNetCNNConfiguration](https://github.com/meltinglab/road-sign-recognition/blob/master/mResNetCNNConfiguration) folder.
### mResNet
The [mResNet.mlx](https://github.com/meltinglab/road-sign-recognition/blob/master/mResNetCNNConfiguration/mResNet.mlx) contains the live script of the Convolutional Neural Network mResNet created with the Deep Network Designer tool from the Deep Learning Toolbox. 
### Network Training
In order to train the Network for traffic sign recognition, the script [TrainingMain.m](https://github.com/meltinglab/road-sign-recognition/blob/master/mResNetCNNConfiguration/TrainingMain.m) must be executed. The script calls the [DatasetReading.m](https://github.com/meltinglab/road-sign-recognition/blob/master/mResNetCNNConfiguration/DatasetReading.m) and [NetworkTraining.m](https://github.com/meltinglab/road-sign-recognition/blob/master/mResNetCNNConfiguration/NetworkTraining.m) function returning the trained mResNet.
### Network Testing
In order to test the correct behavior of the trained network, the [NetworkTest.m](https://github.com/meltinglab/road-sign-recognition/blob/master/mResNetCNNConfiguration/NetworkTest.m) script must be executed which returns the classification accuracy of the network. If the previous steps were executed correctly, the classification accuracy should be about 0.98.
## Raspberry Deployment
deploy it on a Raspberry Pi using MATLAB Coder for code generation.

todo: citare documenti

Steps: 
1) Read the dataset and split the images in training set and validation set
2) Image preprocessing
3) Build the network (mResNet) 
4) Define training options and train the network in MATLAB
5) Validationn of the network
6) Write the code for the deployment on Raspberry Pi
7) Deploy the network and verify the results
 


