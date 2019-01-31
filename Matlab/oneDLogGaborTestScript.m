[rows cols] = size(image);
filteredImage = zeros(rows, cols);
for i = 1:rows
    % 0.45, 2
    filteredImage(i, :) = oneDLogGaborFilter(image(i, :), 3, 0.65, 1.7, 0);
end
filteredImage = abs(filteredImage);
% imshow(filteredImage, []);