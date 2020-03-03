function outImg = mResNet_classify(I)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
persistent net;

if isempty(net)
    net = coder.loadDeepLearningNetwork('trained_net.mat');
end

in = zeros(32, 32, 3);
in(:, :, :) = imresize(I, [32, 32]);

predicted_class = net.classify(in);

outImg = postprocess(in, predicted_class);
end

