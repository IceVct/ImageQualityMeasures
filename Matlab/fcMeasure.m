function [computedQuality] = fcMeasure(normIrisSeg, normIrisSegMask, pupilRadius, irisRadius)
%FC(Feature Correlation)_measure Function that computes the iris segmentation quality, based on
% normalized segmented image

% Most of the variables names are following the paper Feature correlation evaluation approach for iris feature
% quality measure (by Craig Belcher, Yingzi Du, Zhi Zhou and Robert Ives) nomenclature.

%% Variables initialization
[rows, cols] = size(normIrisSeg);
logGaborImage = zeros(rows, cols);

%% Performing the Log Gabor Filter
% [EO, BP] = loggaborconvolve(normIrisSeg, 4, 6, 3, 2.4, 0.38, 1.3, 0, 0);
% logGaborImage = abs(EO{4, 1});
[filteredImage, ~] = masekloggaborconvolve(normIrisSeg, 22, 0.5);
logGaborImage = abs(filteredImage);

% for i = 1:rows
%     % 0.65, 1.7
%     % 0.45, 2
%     % 0.38, 2.4
%     % USADO PELOS AUTORES DO PAPER sigma = 0.2, wavelength = 40/s e s =
%     % numero de pixels por linha do arco
% %     wavelength = 40/cols
%     logGaborImage(i, :) = oneDLogGaborFilter(normIrisSeg(i, :), 3, 0.38, 2.4, 0);
% end
% logGaborImage = abs(logGaborImage);

%% Feature Correlation Measure
fcmMeasure = featureCorrelationMeasure(logGaborImage, normIrisSegMask);

%% Feature Region Measures

% Occlusion Measure
occMeasure = occlusionMeasure(normIrisSegMask);

% Dilation Measure
dilMeasure = dilationMeasure(pupilRadius, irisRadius);

%% Overall Measure
% computing the overall measure, that is the multiplication of all of the
% individual measures after the normalization
computedQuality = fcmMeasure*occMeasure*dilMeasure;

end

