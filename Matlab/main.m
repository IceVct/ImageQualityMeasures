% Script for calling the sfi measure

image = imread('/home/victor/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedImages/IMG_3417_imno.bmp');
mask = imread('/home/victor/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedMasks/IMG_3417_mano.bmp');

Q = sfiMeasure(image, mask, 37, 135);