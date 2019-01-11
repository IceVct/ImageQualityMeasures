function [outputSignal] = oneDLogGaborFilter(inputSignal, wavelength, sigma)
%oneDLogGaborFilter Function that computes the 1D log gabor filter
%   Inputs: inputSignal - signal to be filtered,
%           wavelength - wavelength of the smallest scale filter - 3
%           sigma - used to control the filter bandwidth - 0.65
%   Outputs: outputSignal - filtered signal

[rows cols] = size(inputSignal);					
    
% Pre-compute some stuff to speed up filter construction
% Set up X and Y matrices with ranges normalised to +/- 0.5
% The following code adjusts things appropriately for odd and even values
% of rows and columns.
if mod(cols,2)
    x = [-(cols-1)/2:(cols-1)/2]/(cols-1);
else
    x = [-cols/2:(cols/2-1)]/cols; 
end

omega = sqrt(x.^2 + x.^2);       % Matrix values contain *normalised* radius from centre.
omega = ifftshift(omega);       % Quadrant shift radius and theta so that filters
omega(1, 1) = 1;

% Filters are constructed in terms of two components.
% 1) The radial component, which controls the frequency band that the filter
%    responds to
% 2) The angular component, which controls the orientation that the filter
%    responds to.
% The two components are multiplied together to construct the overall filter.

% Construct the radial filter components...
% First construct a low-pass filter that is as large as possible, yet falls
% away to zero at the boundaries.  All log Gabor filters are multiplied by
% this to ensure no extra frequencies at the 'corners' of the FFT are
% incorporated. This keeps the overall norm of each filter not too dissimilar.
lp = lowpassfilter([rows,cols],.45,15);   % Radius .45, 'sharpness' 15


fourierInputSignal = fft(inputSignal);

wavelength = wavelength*4.9130;

fo = 1.0/wavelength; % centre frequency

logGaborFilter = exp((-(log(omega/fo)).^2) / (2 * log(sigma)^2));
logGaborFilter = logGaborFilter.*lp; % applying low pass filter
logGaborFilter(1, 1) = 0; % Set the value at the 0
                          % frequency point of the filter 
                          % back to zero (undo the radius fudge).

filteredSignal = fourierInputSignal .* logGaborFilter;                          
outputSignal = ifft(filteredSignal);

end

