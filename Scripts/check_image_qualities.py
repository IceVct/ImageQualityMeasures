from os import listdir
import os
from os.path import isfile, join
import sys

# Script for checking which iris image is good enough for being segmented by the Osiris segmentation algorithm
# A output file will be generated, only with the selected images

# Accessing the inputs from the terminal
input_file = sys.argv[1] 
output_file_good_images = sys.argv[2]
output_file_bad_images = sys.argv[3]

threshold_computed = 0.54 # this threshol was computed using Otsu's method

# reading the files and opening the output file
with open(input_file) as f1:
	image_qualities = f1.readlines()

fid_output_file_good_images = open(output_file_good_images, "w")
fid_output_file_bad_images = open(output_file_bad_images, "w")

# comparing each of the files
for line in image_qualities[:-1]:
    split_line = line.split(' ')
    dsmi = float(split_line[-1].rstrip()) # the quality is always the last element
    # comparing the quality measured with the computed threshold
    if dsmi >= threshold_computed:
        fid_output_file_good_images.write(split_line[0] + '\n')
    else:
        fid_output_file_bad_images.write(split_line[0] + '\n')


fid_output_file_good_images.close()
fid_output_file_bad_images.close()