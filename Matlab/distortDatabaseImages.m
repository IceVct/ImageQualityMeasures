function distortDatabaseImages(folder, extraFolder, database, inputFile, outputFile)

%% Reading images to be distorted
inputFile = fullfile(folder, database, inputFile);
outFilename = [folder database outputFile];
fidOut = fopen(outFilename, 'w');

% Distortions parameters
gaussian = linspace(0.5, 5, 4);
impulseNoise = linspace(0.05, 0.5, 4);
overExposure = linspace(10, 100, 4);
motionBlur = linspace(10, 60, 4);
wgn = linspace(0.002, 0.02, 4);
jpeg2000 = [25, 50, 75, 100];

images = readtable(inputFile, 'Delimiter', '\n', 'ReadVariableNames', false);
images = images.Var1;

%% For each image, generating the distortions
amountImages = length(images);
for i = 1:amountImages
   splitImagename = strsplit(images{i}, '.');
   imagename = splitImagename{1};
   extension = splitImagename(2);
   imageFilename = [folder database extraFolder images{i}];
   outputFilename = [folder database extraFolder imagename];
   im = imread(imageFilename); 
   % Generating the distortions and saving the image
   for j = 1:4
       s = strcat(outputFilename, '_gaussian', num2str(gaussian(j)), '.', extension);
       fprintf(fidOut, '%s\n', s{1});
       imwrite(imgaussfilt(im, gaussian(j)), s{1});
       
       s = strcat(outputFilename, '_impulse', num2str(impulseNoise(j)), '.', extension);
       fprintf(fidOut, '%s\n', s{1});
       imwrite(imnoise(im, 'salt & pepper', impulseNoise(j)), s{1});
       
       s = strcat(outputFilename, '_over_exposure', num2str(overExposure(j)), '.', extension);
       fprintf(fidOut, '%s\n', s{1});
       imwrite(im + overExposure(j), s{1});
       
       s = strcat(outputFilename, '_motion_blur', num2str(motionBlur(j)), '.', extension);
       fprintf(fidOut, '%s\n', s{1});
       H = fspecial('motion', motionBlur(j), motionBlur(j));
       imwrite(imfilter(im, H, 'replicate'), s{1});
       
       s = strcat(outputFilename, '_wgn', num2str(wgn(j)), '.', extension);
       fprintf(fidOut, '%s\n', s{1});
       imwrite(imnoise(im, 'gaussian', 0, wgn(j)), s{1});
       
       s = strcat(outputFilename, '_jpeg2000_', num2str(jpeg2000(j)), '.jp2');
       fprintf(fidOut, '%s\n', s);
       imwrite(im, s, 'jp2', 'CompressionRatio', jpeg2000(j));
   end
end

fclose(fidOut);

end

