%Description: Script for the network testing
%Authors: Damiano Vandi, Matteo Lenti, Filippo Cenonfolo

load('trained_net.mat');

%Path of the test images
dataset_path = 'C:\Users\filip\Downloads\GTSRB_Final_Test_Images\GTSRB\Final_Test\Images'; 
%Name of the .csv file that contains the GT labels
labelsFilename = strcat(dataset_path,'\GT-final_test.csv');

%.csv file loading in a table
imageTable = readtable(labelsFilename, 'PreserveVariableNames', true);
labels = imageTable{:,'ClassId'};

%Class for the management of the dataset
imdsTest = imageDatastore(dataset_path);
imdsTest.Labels = categorical(labels);

%Size of the images
imSize = [32 32];

%Resize test dataset
resizedImdsTest = augmentedImageDatastore(imSize, imdsTest);

%Classification and Ground Truth Values
YPred = classify(net,resizedImdsTest);
YGT = resizedImdsTest.Labels;

%Accuracy computation
accuracy = sum(YPred == YGT)/numel(YGT)