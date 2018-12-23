function [dilMeasure] = dilationMeasure(pupilRadius, irisRadius)
%dilationMeasure Function that computes the dilation measure, based on the
%dilation of the segmented iris

% Most of the variables names are following the paper Feature correlation evaluation approach for iris feature
% quality measure (by Craig Belcher, Yingzi Du, Zhi Zhou and Robert Ives) nomenclature.

%% Variables initialization
zeta = 0.6;
gama = 40;

%% Computing the dilation
% the dilation percentage
D = pupilRadius/irisRadius;

%% Computing the measure normalization
if(D <= 0.6)
    dilMeasure = 1;
else
    dilMeasure = exp(-gama*(D - zeta));
end

end

