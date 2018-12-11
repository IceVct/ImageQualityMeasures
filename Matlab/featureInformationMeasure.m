function [fimMeasure] = featureInformationMeasure(normImage, normMaskImage, L, N)
%featureInformationMeasure Function that computes the feature information
%measures based on the iris normalized segmeneted image

% Most of the variables names are following the paper A Selective Feature Information Approach for Iris
% Image-Quality Measure (by Craig Belcher and Yingzi Du) nomenclature.

%% Variables initialization
[rows, cols] = size(normImage);

% information distance weighting variables
k = 1/33;
l = 0.1;
Beta = 0.04;
alpha = 1/Beta;

%% Computing the measure

%% Computing the measure normalization

end

