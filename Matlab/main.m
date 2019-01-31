% Script for calling the sfi measure

image = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedImages/IMG_3417_imno.bmp');
mask = imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedMasks/IMG_3417_mano.bmp');

Q = fcMeasure(image, mask, 37, 135);