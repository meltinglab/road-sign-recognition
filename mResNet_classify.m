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

if isempty(net)
    net = coder.loadDeepLearningNetwork('trained_net.mat');
end

in = zeros(32, 32, 3);
in(:, :, :) = imresize(I, [32 32]);

[~,predicted_class] = max(predict(net, in));
outImg = postprocess(in, predicted_class);
end

