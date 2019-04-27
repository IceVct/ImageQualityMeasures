from os import listdir
from os.path import isfile, join
import numpy as np
import sys
import math as mth
from subprocess import check_output

# Script for computing the DSMI quality measures of images from a given input txt file
# As output, it creates a .txt file with the DSMI measure average, variance and standard 
# deviation and all the image names with its dsmi measure value

# Accessing the inputs from the terminal
input_file = sys.argv[1] # the input .txt file
output_file = sys.argv[2] # the output .txt file
extra_input = sys.argv[3] if len(sys.argv) > 3 else 'x' # in the case that a string must be attached to the filename string

fid_input_file = open(input_file, "r")
fid_output_file = open(output_file, "w")

# Looping all the image filenames, in order to call the C++ DSMI computation executable
average = 0
variance = 0
std_deviation = 0
qualities = []
max_value = 0
min_value = 1
for line in fid_input_file:
    # if there are more than 3 inputs, it means that a string must be concatenated
    if len(sys.argv) > 3:
        executable = ['/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/DSMI/dsmi_quality', "%s%s" % (extra_input, line.rstrip()), '0.8']
    else:
        executable = ['/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/DSMI/dsmi_quality', line.rstrip(), '0.8']

    dsmi_quality = check_output(executable)
    fid_output_file.writelines([line.rstrip(), ' ', dsmi_quality, '\n'])
    if(float(dsmi_quality) > max_value):
    	max_value = float(dsmi_quality)
    if(float(dsmi_quality) < min_value):
    	min_value = float(dsmi_quality)
    qualities.append(float(dsmi_quality))

mean = np.mean(qualities)
variance = np.var(qualities)
std_deviation = mth.sqrt(variance)

fid_output_file.writelines(['Mean ', str(mean), ', variance ', str(variance), ', std_deviation ', 
	str(std_deviation), ', max ', str(max_value), ', min ', str(min_value), '\n'])


fid_input_file.close()
fid_output_file.close()