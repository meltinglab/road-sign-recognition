%Project Title: Road Sign Recognition
%Module Title: PIL Raspberry Test
%Description: Script for the PIL testing of the Raspberry
%Authors: Damiano Vandi, Matteo Lenti, Filippo Cenonfolo

files = dir('TestImages\*.png');
N = length(files);
% loop for each file 
for i = 1:N
    im = imread(['TestImages\' files(i).name]);
    outimg = mResNet_classify_pil(double(im));
    figure(i);
    imshow(outimg)
end
