%Project Title: Road Sign Recognition
%Module Title: Network Training
%Description: function used for network training
%Authors: Damiano Vandi, Matteo Lenti, Filippo Cenonfolo

%Arguments: 
%   resizedImdsTrain: training images
%   resizedImdsValidation: validation images
%   lgraph: network to be used

%Output: trained network


function net = NetworkTraining(resizedImdsTrain, resizedImdsValidation, lgraph)

%Define options for the training 
options = trainingOptions('adam', ...
    'InitialLearnRate',0.001, ...
    'MaxEpochs',100, ...
    'MiniBatchSize',128, ...
    'Shuffle','every-epoch', ...
    'ValidationData',resizedImdsValidation, ...
    'ValidationFrequency',245, ...
    'Verbose',false, ...
    'Plots','training-progress');

%Launch the network training
net = trainNetwork(resizedImdsTrain,lgraph,options);

end