function [computedQuality] = fcMeasure(normIrisSeg, normIrisSegMask, pupilRadius, irisRadius)
%FC(Feature Correlation)_measure Function that computes the iris segmentation quality, based on
% normalized segmented image

% Most of the variables names are following the paper Feature correlation evaluation approach for iris feature
% quality measure (by Craig Belcher, Yingzi Du, Zhi Zhou and Robert Ives) nomenclature.

%% Variables initialization
[rows, cols] = size(normIrisSeg);

%% Performing the Log Gabor Filter
[EO, BP] = loggaborconvolve(normIrisSeg, 4, 6, 3, 1.7, 0.65, 1.3, 0, 1);
logGaborImage = abs(EO{4, 1});

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

