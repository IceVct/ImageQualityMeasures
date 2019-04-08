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
input_file_circle_params = sys.argv[3]
output_file = sys.argv[4]

# reading files and inserting class of images into three lists
with open(input_file_normalized_images, "r") as f:
    content_normalized_images = f.readlines()
content_normalized_images = [x.strip() for x in content_normalized_images] 

with open(input_file_normalized_masks, "r") as f:
    content_normalized_masks = f.readlines()
content_normalized_masks = [x.strip() for x in content_normalized_masks] 

with open(input_file_circle_params, "r") as f:
    content_circle_params = f.readlines()
content_circle_params = [x.strip() for x in content_circle_params] 

content_normalized_images.sort()
content_normalized_masks.sort()
content_circle_params.sort()

# Looping all the image filenames, in order to call the python feature correlation computation executable
qualities = []
max_value = 0.
min_value = 1.

with open(output_file, "w") as f:

    for i in range(0, len(content_normalized_images)):
        image_file = content_normalized_images[i].split('/')[-1].split('_imno')[0]
        executable = ['python', '/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/FeatureCorrelation/main.py', content_normalized_images[i], content_normalized_masks[i], content_circle_params[i]]
        quality = check_output(executable)

        print image_file, quality

        f.writelines([image_file, ' ', quality])
        qualities.append(float(quality))

        if float(quality) > max_value:
            max_value = float(quality)

        if float(quality) < min_value:
            min_value = float(quality)

    mean = np.mean(qualities)
    variance = np.var(qualities)
    std_deviation = mth.sqrt(variance)

    f.writelines(['Mean ', str(mean), ', variance ', str(variance), ', std_deviation ', 
	str(std_deviation), ', max ', str(max_value), ', min ', str(min_value)])


