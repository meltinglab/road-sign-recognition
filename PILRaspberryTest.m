%Project Title: Road Sign Recognition
%Module Title: PIL Raspberry Test
%Description: Script for the PIL testing of the Raspberry
%Authors: Damiano Vandi, Matteo Lenti, Filippo Cenonfolo

images = dir('TestImages\*.png');
N = length(images);

% loop for each input image 
for i = 1:N
    im = imread(['TestImages\' images(i).name]);
    
    %Classify using mResNet implemented on Raspberry Pi
    outimg = mResNet_classify_pil(double(im));
    
    %Show the images with the result of classification
    figure(i);
    imshow(outimg)
end
