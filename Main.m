%Project Title: Road Sign Recognition
%Module Title: Main
%Description: Main script used for network training
%Authors: Damiano Vandi, Matteo Lenti, Filippo Cenonfolo

%Recall the network
mResNet;

%ToDo Specify correct dataset path 
dataset_path = ; 

%Read data for training and validation
[resizedImdsTrain, resizedImdsValidation] = DatasetReading(dataset_path);

%Train the network
net = NetworkTraining(resizedImdsTrain, resizedImdsValidation, lgraph); 
