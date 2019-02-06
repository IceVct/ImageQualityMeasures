[rows cols] = size(im);
filteredImage = zeros(rows, cols);
for i = 1:rows
    % 0.65, 1.7
    % 0.45, 2
    % 0.38, 2.4
    % USADO PELOS AUTORES DO PAPER sigma = 0.2, wavelength = 40/s e s =
    % numero de pixels por linha do arco
%     wavelength = 40/cols
    filteredImage(i, :) = oneDLogGaborFilter(im(i, :), 3, 0.38, 2.4, 0);
end
filteredImage = abs(filteredImage);
% imshow(filteredImage, []);
