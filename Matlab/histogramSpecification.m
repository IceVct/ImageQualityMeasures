function [Iout] = histogramSpecification(Iin, nBins)
%HISTOGRAMSPECIFICATION Function that computes the histogram specification
%for a given image

[rows, cols, c] = size(Iin);
if c > 1
   Iout = zeros(rows, cols, c);
   Igrayscale = zeros(rows, cols, 1);
   Iycbcr = rgb2ycbcr(Iin);
   Igrayscale = Iycbcr(:, :, 1);
else
   Iout = zeros(rows, cols, 1);
end

%% Intializing variables
histogram = zeros(256, 1);
nPixelsPerBin = 256/nBins;
rangeStart = nPixelsPerBin
rangeEnd = 256 - nPixelsPerBin
range = rangeStart:1:(rangeEnd - 1);
nRange = length(range);untitled

%% Computing the histogram for specification
[counts, ~] = imhist(Igrayscale);

% value to be placed in the y axis of the histogram
countValue = sum(counts)/nRange;
histogram(range) = countValue;

plot(histogram);

%% Performing the histogram specification
if c > 1
    Iycbcr(:, :, 1) = histeq(Igrayscale, histogram);
    Iout = uint8(ycbcr2rgb(Iycbcr));
else
    Iout = histeq(Iin, histogram);    
end

end

