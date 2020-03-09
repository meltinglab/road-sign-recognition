%Project Title: Road Sign Recognition
%Module Title: Postprocess
%Description: Function to process and display the classification result
%Authors: Damiano Vandi, Matteo Lenti, Filippo Cenonfolo

%Arguments:
%   im: input image
%   predicted_class: class predicted by the network

%Outputs:
%   outimg: processed image

function outimg = Postprocess(im, predicted_class)
%#codegen

%Define class names
ClassNames = {'20 km/h', '30 km/h', 'no overtaking for tracks',...
              'crossroads aheah', 'priority road', 'give way', 'stop',...
              'road closed', 'road closed truck', 'no entry', 'danger',...
              'left curve', '50 km/h', 'right curve', 'combined curves l-r',...
              'uneaven road', 'loose gravel', 'road narrows on right',...
              'work in progress', 'traffic lights', 'pedestrian crossing',...
              'school ahead', 'cycle crossing', '60 km/h', 'snow',...
              'animal crossing', 'restriction end sign', 'turn right',...
              'turn left', 'go straight', 'go straight or right',...
              'go straight or left', 'keep right', 'keep left', '70 km/h',...
              'roundabout', 'end no-overtaking', 'end no-overtaking truck',...
              '80 km/h', 'end 80km/h', '100 km/h', '120 km/h', 'no overtaking'};

%Save the name of the predicted class 
label = ClassNames{predicted_class};

%Initialize the output image
outputImage = zeros(320,256,3, 'uint8');
resizedImage = imresize(im, [256, 256]);

%Populate output image
for k = 1:3
    outputImage(65:end,:,k) = resizedImage(:,:,k);
end

scol = 1;
srow = 1;
outputImage = insertText(outputImage, [scol, srow], 'Classification with mResNet', 'TextColor', [255 255 255],'FontSize',18, 'BoxColor', [0 0 0]);
srow = srow + 30;

%Add the predicted label to the output image
str = ['Predicted class: ' label];
outputImage = insertText(outputImage, [scol, srow], str, 'TextColor', [255 255 255],'FontSize',15, 'BoxColor', [0 0 0]);

%Return output image
outimg = outputImage;

end

