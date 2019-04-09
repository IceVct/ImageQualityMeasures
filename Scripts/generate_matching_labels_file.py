from os import listdir
from os.path import isfile, join
import numpy as np
import sys
import math as mth
from subprocess import check_output

# Script for comparing both matching files, check if both belongs to the same person
# and then set a correspondent label 0 if it is and 1 if its not

# Accessing the inputs from the terminal
input_folder = sys.argv[1] 
matching_file = sys.argv[2] 
output_file = sys.argv[3]
database = sys.argv[4]

# reading files and inserting class of images into three lists
with open("%s%s" % (input_folder, dsmi_file), "r") as f:
    content_matching_file = f.read().splitlines()

# TODO
if database == 'MICHE':
    content_matching_file = [f.split('/')[-1].split('.')[0] for f in content_dsmi_file]
elif database == 'UBIRISv1':
    content_matching_file = [f.split('/')[-1].split('.')[0] for f in content_dsmi_file]
elif database == 'UBIRISv2':
    content_matching_file = [f.split('/')[-1].split('.')[0] for f in content_dsmi_file]
else:
    content_matching_file = [f.split('/')[-1].split('.')[0] for f in content_dsmi_file]


with open("%s%s" % (input_folder, output_file), "w") as f:
    common_images = list(set(content_dsmi_file).intersection(set(content_fce_file)))
    [f.writelines([image, '\n']) for image in common_images]
