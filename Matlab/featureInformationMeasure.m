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
r = zeros(L, 1);
p = zeros(L, 1);
q = zeros(L, 1);
wJ = zeros(rows, 1);
Tmax = 1;
Tmean = 1;

%% Computing the measure

% computing the sum of consecutive nonoccluded in every row of the image
for i = 1:rows
    sumConsecNonOcclud(i, 1) = max( diff( [0 (find( ~ (normMaskImage(i, :) > 0) ) ) numel(normMaskImage(i, :)) + 1] ) - 1);
end

% looping through the image rows and computing the information measures
previousInfo = 0;
for i = 1:rows
    % computing the row maximum value and mean
    maxValue = max(logGaborNormImage(i, :));
    meanValue = mean(logGaborNormImage(i, :));
    
    if(maxValue < Tmax || meanValue < Tmean)
        wJ(i, 1) = 0;
    else
        for win = 1:L:cols
            % if the consecutive nonoccluded in a row is less than the parameter L, then the information
            % distance for the row is set to 0
            % OR if the maximum row value is smaller than the threshold Tmax
            % OR if the row mean values is smaller than the thresold Tmean
            if(sumConsecNonOcclud(i) >= L)
                r = double(logGaborNormImage(i, win:(win + L - 1)));
                r = r';
                p = r./norm(r, 2); % computing the probability mass function of the vector r
                q(:) = (1/L); % computing the uniform distribution of the vector
                
                % information distance
                J = relativeEntropy(p, q) + relativeEntropy(q, p);
                
                % in order to always keeping only the highest value computed in
                % the weighted information distance, saving the previous value
                % computed and comparing with the current one
                if(previousInfo > J)
                    J = previousInfo;
                end
                previousInfo = J;
            else
                J = 0;
            end
        end
        
        wJ(i, 1) = (1 - k*exp(l*i))*J; % weighting the clarity of iris patterns in the inner circles
        previousInfo = 0;
    end
end

% choosing the top N computed weighted information distances
wJ = sort(wJ, 'descend');
wJ = wJ(1:N);

% computing the FIM measure
FIM = sum(wJ)/N;

%% Computing the measure normalization
if(0 <= FIM && FIM <= Beta)
    fimMeasure = alpha*FIM;
elseif (FIM > Beta)
    fimMeasure = 1;
else
    fimMeasure = 0;
end

end

