%Project Title: Road Sign Recognition
%Module Title: Dataset Reading
%Authors: Damiano Vandi, Matteo Lenti, Filippo Cenonfolo


GTSRB_training_path = fullfile('C:\','Users','Daminao','Desktop','GTSRB','Final_Training','Images');
%Class for the management of the dataset
imds = imageDatastore(GTSRB_training_path, 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
%Number of images in the dataset
nImages = size(imds.Files,1);
%Size of the images
imSize = [32 32];
resizedImds = augmentedImageDatastore(imSize, imds);