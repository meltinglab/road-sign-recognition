%Project Title: Road Sign Recognition
%Module Title: Dataset Reading
%Description: Function for the reading of the dataset images
%Authors: Damiano Vandi, Matteo Lenti, Filippo Cenonfolo

%Arguments:
%   dataset_path: path to the dataset directory

%Outputs:
%   resizedImdsTrain: training images
%   resizedImdsValidation: validation images


function [resizedImdsTrain, resizedImdsValidation] = DatasetReading(dataset_path)
    
    %Class for the management of the dataset
    imds = imageDatastore(dataset_path, 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
    
    %Size of the images
    imSize = [32 32];

    %Split dataset: 80% training, 20% validation
    [imdsTrain,imdsValidation] = splitEachLabel(imds, 0.8, 'randomize');

    %Resize training and validation dataset
    resizedImdsTrain = augmentedImageDatastore(imSize, imdsTrain);
    resizedImdsValidation = augmentedImageDatastore(imSize, imdsValidation);
end