[rows cols] = size(im3);
filteredImage = zeros(rows, cols);
for i = 1:rows
    % 0.45, 2
    filteredImage(i, :) = oneDLogGaborFilter(im3(i, :), 3, 0.65, 1.7, 0);
end
filteredImage = abs(filteredImage);
% imshow(filteredImage, []);