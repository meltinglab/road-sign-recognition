%Project Title: Road Sign Recognition
%Module Title: mResNet Classify
%Description: Function to classify the traffic sign image given as input
%Authors: Damiano Vandi, Matteo Lenti, Filippo Cenonfolo

%Arguments:
%   I: input image to be classified

%Outputs:
%   outImg: classified image

function outImg = mResNet_classify(I)
%#codegen

persistent net;

%Load the pretrained mResNet CNN model
if isempty(net)
    net = coder.loadDeepLearningNetwork('trained_net.mat');
end

%Resize the input image with the correct dimensions
in = zeros(32, 32, 3);
in(:, :, :) = imresize(I, [32 32]);

%Make the prediction and save it to predicted_class
[~,predicted_class] = max(predict(net, in));

%Return the output image with the prediction 
outImg = Postprocess(in, predicted_class);
end

