function [occMeasure] = occlusionMeasure(normIrisMaskImage)
%occlusionMeasure Function that computes the occlusion measure, based on
%the amount of occlusion of the segmented iris

% Most of the variables names are following the paper Feature correlation evaluation approach for iris feature
% quality measure (by Craig Belcher, Yingzi Du, Zhi Zhou and Robert Ives) nomenclature.

%% Variables initialization
[rows, cols] = size(normIrisMaskImage);
kappa = 0.9179;
lambda = 2.5;
segMaskSize = rows*cols;

%% Computing the measure
% black pixels are occlusions, and white pixels are valid iris area
invalidArea = sum(sum(normIrisMaskImage == 0));
O = invalidArea/segMaskSize;

%% Computing the measure normalization
occMeasure = (1 - exp(-lambda*(1 - O)))/kappa;

end

