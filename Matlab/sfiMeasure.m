function [computedQuality] = sfiMeasure(normIrisSeg, normIrisSegMask, pupilRadius, irisRadius)
%SFI_measure Function that computes the iris segmentation quality, based on
% normalized segmented image

% Most of the variables names are following the paper Feature correlation evaluation approach for iris feature
% quality measure (by Craig Belcher, Yingzi Du, Zhi Zhou and Robert Ives) nomenclature.

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

%% Performing the Log Gabor Filter
[EO, BP] = loggaborconvolve(normIrisSeg, 4, 6, 3, 1.7, 0.65, 1.3, 0, 1);
logGaborImage = abs(EO{4, 1});

%% Feature Information Measure
% fimMeasure = featureInformationMeasure(logGaborImage, normIrisSegMask, L, N);
fcmMeasure = [];
for i = 1: 4
    for j = 1:6
        logGaborImage = abs(EO{i, j});
%         imshow(angle(EO{1, 1}), []);
%         pause;
        fcmMeasure = [fcmMeasure featureCorrelationMeasure(logGaborImage, normIrisSegMask)];
    end
end

%% Feature Region Measures

% Occlusion Measure
occMeasure = occlusionMeasure(normIrisSegMask);

% Dilation Measure
dilMeasure = dilationMeasure(pupilRadius, irisRadius);

%% Overall Measure
% computing the overall measure, that is the multiplication of all of the
% individual measures after the normalization
computedQuality = fcmMeasure.*occMeasure*dilMeasure;

end

