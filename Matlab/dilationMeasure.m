function [dilMeasure] = dilationMeasure(pupilRadius, irisRadius)
%dilationMeasure Function that computes the dilation measure, based on the
%dilation of the segmented iris

% Most of the variables names are following the paper A Selective Feature Information Approach for Iris
% Image-Quality Measure (by Craig Belcher and Yingzi Du) nomenclature.

%% Variables initialization
zeta = 10e-6;
gama = 25;

%% Computing the dilation
% the dilation percentage
D = (pupilRadius/irisRadius)*100;

%% Computing the measure normalization
dilMeasure = zeta*exp(-gama*D);

end

