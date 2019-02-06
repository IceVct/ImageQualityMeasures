function [I_filtered] = twoDLogGaborFilter(I, wavelength, sigma)
    [rows, cols] = size(I);

    % FFT mesh
    [ux, uy] = meshgrid(([1:cols]-(fix(cols/2)+1))/(cols-mod(cols,2)), ...
        ([1:rows]-(fix(rows/2)+1))/(rows-mod(rows,2)));
    ux = ifftshift(ux);   % Quadrant shift to put 0 frequency at the corners
    uy = ifftshift(uy);

    % Convert to polar coordinates
    th = atan2(uy,ux);
    r = sqrt(ux.^2 + uy.^2);

    % Create spectrum
    fo = 1.0/wavelength*4.9130;
    filterFFT = exp((-(log(r/fo)).^2) / (2 * log(sigma)^2));
    filterFFT(1,1) = 0;
    
    % Filter image
    I_filtered = real(ifft2(fft2(I) .* filterFFT)); 
end

