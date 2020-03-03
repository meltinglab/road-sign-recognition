function outimg = postprocess(im, predicted_class)
%#codegen
%POSTPROCESS Summary of this function goes here
%   Detailed explanation goes here

ClassNames = {'20 km/h', '30 km/h', '50 km/h', '60 km/h', '70 km/h',...
            '80 km/h', 'end 80km/h', '100 km/h', '120 km/h',...
            'no overtaking','no overtaking for tracks',...
            'crossroads aheah', 'priority road', 'give way', 'stop',...
            'road closed', 'road closed truck', 'no entry', 'danger',...
            'left curve', 'right curve', 'combined curves l-r',...
            'uneaven road', 'loose gravel', 'road narrows on right',...
            'work in progress', 'traffic lights', 'pedestrian crossing',...
            'school ahead', 'cycle crossing', 'snow', 'animal crossing',...
            'restriction end sign', 'turn right', 'turn left',...
            'go straight', 'go straight or right', 'go straight or left',...
            'keep right', 'keep left', 'roundabout', 'end no-overtaking',...
            'end no-overtaking truck'};
 
label_string = string(predicted_class);
label = ClassNames(str2num(label_string)+1);

outputImage = zeros(320,256,3, 'uint8');
resizedImage = imresize(im, [256, 256]);

for k = 1:3
    outputImage(65:end,:,k) = resizedImage(:,:,k);
end

scol = 1;
srow = 1;
outputImage = insertText(outputImage, [scol, srow], 'Classification with mResNet', 'TextColor', 'w','FontSize',18, 'BoxColor', 'black');
srow = srow + 30;

str = strcat('Predicted class: ', label);
outputImage = insertText(outputImage, [scol, srow], str, 'TextColor', 'w','FontSize',15, 'BoxColor', 'black');

outimg = outputImage;

end

