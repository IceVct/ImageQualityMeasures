function [outputSignal] = oneDLogGaborFilter(inputSignal, wavelength, sigma, mult, doPLot)
%oneDLogGaborFilter Function that computes the 1D log gabor filter
%   Inputs: inputSignal - signal to be filtered,
%           wavelength - wavelength of the smallest scale filter - 3
%           sigma - used to control the filter bandwidth - 0.65
%   Outputs: outputSignal - filtered signal

% Sigma - 0.45
% mult - 2
[rows cols] = size(inputSignal);					

omega = linspace(0, 0.5, cols);

fourierInputSignal = fft(inputSignal);

if(doPLot)
    plot(abs(fftshift(fourierInputSignal)));pause;
end

wavelength = wavelength*mult^(3); 

fo = 1.0/wavelength; % centre frequency

logGaborFilter = exp((-(log(omega/fo)).^2) / (2 * log(sigma)^2));
% logGaborFilter = logGaborFilter.*lp; % applying low pass filter
% logGaborFilter(1, 1) = 0; % Set the value at the 0
                          % frequency point of the filter 
                          % back to zero (undo the radius fudge).

                          
if(doPLot)
    plot(omega, logGaborFilter);pause;
end

filteredSignal = fourierInputSignal .* logGaborFilter;

if(doPLot)
    plot(abs(filteredSignal));pause;
end

outputSignal = ifft(filteredSignal);
if(doPLot)
    plot(abs(outputSignal));pause;
    close all;
end

end

