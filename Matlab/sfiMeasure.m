function [computedQuality] = sfiMeasure(normIrisSeg, normIrisSegMask, pupilRadius, irisRadius)
%SFI_measure Function that computes the iris segmentation quality, based on
% normalized segmented image

% Most of the variables names are following the paper A Selective Feature Information Approach for Iris
% Image-Quality Measure (by Craig Belcher and Yingzi Du) nomenclature.

%% Variables initialization
[rows, cols] = size(normIrisSeg);
fimMeasure = 0;
occMeasure = 0;
dilMeasure = 0;

% window length, the paper suggests L as ImWidth/6, but since the image
% width that this project is dealing is 512, then its divided by 8
L = cols/8;

% N top weighted representative information distances of the image, as
% suggested by the paper
N = rows/8;


%% Feature Information Measure
% fimMeasure = featureInformationMeasure(normIrisSeg, normIrisSeg, L, N);

%% Feature Region Measures

% Occlusion Measure
% occMeasure = occlusionMeasure(normIrisSegMask);

% Dilation Measure
% dilMeasure = dilationMeasure(pupilRadius, irisRadius);

%% Overall Measure
% computing the overall measure, that is the multiplication of all of the
% individual measures after the normalization
computedQuality = fimMeasure*occMeasure*dilMeasure;

end

