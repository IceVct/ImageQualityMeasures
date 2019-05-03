#!/bin/bash

echo "Jenadeleh paper"
python ../Scripts/Python/metric_histogram.py ./ noDistortion.txt overExposure_paper.txt Over_Exposure false
python ../Scripts/Python/metric_histogram.py ./ noDistortion.txt gaussian_paper.txt Gaussian false
python ../Scripts/Python/metric_histogram.py ./ noDistortion.txt jpeg2000_paper.txt JPEG2000 false
python ../Scripts/Python/metric_histogram.py ./ noDistortion.txt impulseNoise_paper.txt Impulse_Noise false
python ../Scripts/Python/metric_histogram.py ./ noDistortion.txt motionBlur_paper.txt Motion_Blur false
python ../Scripts/Python/metric_histogram.py ./ noDistortion.txt wgn_paper.txt WGN false

echo "Mine version"
python ../Scripts/Python/metric_histogram.py ./ noDistortion.txt overExposure.txt Over_Exposure false
python ../Scripts/Python/metric_histogram.py ./ noDistortion.txt gaussian.txt Gaussian false
python ../Scripts/Python/metric_histogram.py ./ noDistortion.txt jpeg2000.txt JPEG2000 false
python ../Scripts/Python/metric_histogram.py ./ noDistortion.txt impulseNoise.txt Impulse_Noise false
python ../Scripts/Python/metric_histogram.py ./ noDistortion.txt motionBlur.txt Motion_Blur false
python ../Scripts/Python/metric_histogram.py ./ noDistortion.txt wgn.txt WGN false