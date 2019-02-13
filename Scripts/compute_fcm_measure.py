from os import listdir
from os.path import isfile, join
import numpy as np
import sys
import math as mth
from subprocess import check_output

# Script for computing the feature correlation segmentation quality measures of images from a given input txt file
# As output, it prints the results

# Accessing the inputs from the terminal
input_file_normalized_images = sys.argv[1] 
input_file_normalized_masks = sys.argv[2] 

# reading both files and inserting both class of images into two lists
with open(input_file_normalized_images, "r") as f:
    content_normalized_images = f.readlines()
content_normalized_images = [x.strip() for x in content_normalized_images] 

with open(input_file_normalized_masks, "r") as f:
    content_normalized_masks = f.readlines()
content_normalized_masks = [x.strip() for x in content_normalized_masks] 

content_normalized_images.sort()
content_normalized_masks.sort()

# Looping all the image filenames, in order to call the python feature correlation computation executable
for i in range(0, len(content_normalized_images)):
    executable = ['python', '/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/FeatureCorrelation/main.py', content_normalized_images[i], content_normalized_masks[i]]
    print check_output(executable)
    # feature_correlation_measure = check_output(executable)
    # print feature_correlation_measure


