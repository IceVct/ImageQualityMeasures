function [fimMeasure] = featureInformationMeasure(logGaborNormImage, normMaskImage, L, N)
%featureInformationMeasure Function that computes the feature information
%measures based on the iris normalized segmeneted image

% Most of the variables names are following the paper A Selective Feature Information Approach for Iris
% Image-Quality Measure (by Craig Belcher and Yingzi Du) nomenclature.

%% Variables initialization
[rows, cols] = size(logGaborNormImage);

% information distance weighting variables
k = 1/33;
l = 0.1;
Beta = 0.04;
alpha = 1/Beta;
sumConsecNonOcclud = zeros(rows, 1);
r = zeros(rows, 1);
p = zeros(rows, 1);
q = zeros(rows, 1);
wJ = zeros(rows, 1);
Tmax = 1;
Tmean = 1;

%% Computing the measure

% computing the sum of consecutive nonoccluded in every row of the image
for i = 1:rows
    sumConsecNonOcclud(i, 1) = max( diff( [0 (find( ~ (normMaskImage(i, :) > 0) ) ) numel(normMaskImage(i, :)) + 1] ) - 1);
end

% looping through the image rows and computing the information measures
for i = 1:rows
    for win = 1:L:cols
        % computing the row maximum value and mean
        maxValue = max(logGaborNormImage(i, :));
        meanValue = mean(logGaborNormImage(i, :));
        
        % if the consecutive nonoccluded in a row is less than the parameter L, then the information
        % distance for the row is set to 0
        if(sumConsecNonOcclud(i) >= L)
            r = double(logGaborNormImage(i, win:(win + L - 1)));
            p = r/norm(r, 2); % computing the probability mass function of the vector r
            q(:) = 1/L; % computing the uniform distribution of the vector
            
            % information measure
            J = relativeEntropy(p, q) + relativeEntropy(q, p); 
            wJ(i) = (1 - k*exp(l*i))*J; % weighting the clarity of iris patterns in the inner circles
        else
            wJ(i) = 0;
        end
        
    end
end

%% Computing the measure normalization

end

