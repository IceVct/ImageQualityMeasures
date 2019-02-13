% Script for calling the sfi measure

image = imread('/home/vavieira/UnB/TCC/Codigos/JPEG2000/OsirisOutput/NormalizedImages/IMG_3417_25_imno.bmp');
mask = imread('/home/vavieira/UnB/TCC/Codigos/JPEG2000/OsirisOutput/NormalizedMasks/IMG_3417_25_mano.bmp');
Q = fcMeasure(image, mask, 37, 135);

image = imread('/home/vavieira/UnB/TCC/Codigos/JPEG2000/OsirisOutput/NormalizedImages/IMG_3417_50_imno.bmp');
mask = imread('/home/vavieira/UnB/TCC/Codigos/JPEG2000/OsirisOutput/NormalizedMasks/IMG_3417_50_mano.bmp');
Q = fcMeasure(image, mask, 37, 135);

image = imread('/home/vavieira/UnB/TCC/Codigos/JPEG2000/OsirisOutput/NormalizedImages/IMG_3417_75_imno.bmp');
mask = imread('/home/vavieira/UnB/TCC/Codigos/JPEG2000/OsirisOutput/NormalizedMasks/IMG_3417_75_mano.bmp');
Q = fcMeasure(image, mask, 37, 135);

image = imread('/home/vavieira/UnB/TCC/Codigos/JPEG2000/OsirisOutput/NormalizedImages/IMG_3417_100_imno.bmp');
mask = imread('/home/vavieira/UnB/TCC/Codigos/JPEG2000/OsirisOutput/NormalizedMasks/IMG_3417_100_mano.bmp');
Q = fcMeasure(image, mask, 37, 135);

% image = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedImages/IMG_0132_imno.bmp');
% mask = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedMasks/IMG_0132_mano.bmp');
% Q = fcMeasure(image, mask, 37, 135);
% 
% image = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedImages/IMG_0135_imno.bmp');
% mask = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedMasks/IMG_0135_mano.bmp');
% Q = fcMeasure(image, mask, 37, 135);
% 
% image = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedImages/IMG_0136_imno.bmp');
% mask = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedMasks/IMG_0136_mano.bmp');
% Q = fcMeasure(image, mask, 37, 135);
% 
% image = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedImages/IMG_0397_imno.bmp');
% mask = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedMasks/IMG_0397_mano.bmp');
% Q = fcMeasure(image, mask, 37, 135);

% image = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedImages/IMG_0412_imno.bmp');
% mask = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedMasks/IMG_0412_mano.bmp');
% Q = fcMeasure(image, mask, 37, 135);
% 
% image = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedImages/IMG_1308_imno.bmp');
% mask = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedMasks/IMG_1308_mano.bmp');
% Q = fcMeasure(image, mask, 37, 135);
% 
% image = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedImages/IMG_2325_imno.bmp');
% mask = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedMasks/IMG_2325_mano.bmp');
% Q = fcMeasure(image, mask, 37, 135);
% 
% image = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedImages/IMG_3417_imno.bmp');
% mask = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedMasks/IMG_3417_mano.bmp');
% Q = fcMeasure(image, mask, 37, 135);
% 
% image = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedImages/IMG_3621_imno.bmp');
% mask = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedMasks/IMG_3621_mano.bmp');
% Q = fcMeasure(image, mask, 37, 135);
% 
% image = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedImages/IMG_3624_imno.bmp');
% mask = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedMasks/IMG_3624_mano.bmp');
% Q = fcMeasure(image, mask, 37, 135);
% 
% image = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedImages/IMG_4559_imno.bmp');
% mask = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedMasks/IMG_4559_mano.bmp');
% Q = fcMeasure(image, mask, 37, 135);