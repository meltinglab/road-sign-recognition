function outImg = mResNet_classify(I)
%#codegen
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
persistent net;

if isempty(net)
    net = coder.loadDeepLearningNetwork('trained_net.mat');
end

in = zeros(32, 32, 3);
in(:, :, :) = imresize(I, [32, 32]);

coder.extrinsic('predict')
predicted_class = predict(net, in, 'ReturnCategorical', true);

outImg = postprocess(in, predicted_class);
end

