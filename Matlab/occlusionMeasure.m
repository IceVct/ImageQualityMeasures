function [occMeasure] = occlusionMeasure(normIrisMaskImage)
%occlusionMeasure Function that computes the occlusion measure, based on
%the amount of occlusion of the segmented iris

% Most of the variables names are following the paper A Selective Feature Information Approach for Iris
% Image-Quality Measure (by Craig Belcher and Yingzi Du) nomenclature.

%% Variables initialization
[rows, cols] = size(normIrisMaskImage);
kappa = 0.011;
lambda = 4.5;
segMaskSize = rows*cols;

%% Computing the measure
% black pixels are occlusions, and white pixels are valid iris area
invalidArea = sum(sum(normIrisMaskImage == 0));
O = invalidArea/segMaskSize;

%% Computing the measure normalization
occMeasure = 1 - kappa*exp(lambda*O);

end

