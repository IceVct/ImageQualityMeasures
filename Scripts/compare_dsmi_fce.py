from os import listdir
from os.path import isfile, join
import numpy as np
import sys
import math as mth
from subprocess import check_output

# Script for comparing both dsmi and fce files, in order to only get the intersection between them

# Accessing the inputs from the terminal
input_folder = sys.argv[1] 
dsmi_file = sys.argv[2] 
fce_file = sys.argv[3]
output_file = sys.argv[4]
database = sys.argv[5] if len(sys.argv) == 6 else '.'

# reading files and inserting class of images into three lists
with open("%s%s" % (input_folder, dsmi_file), "r") as f:
    content_dsmi_file = f.read().splitlines()

if database.lower() != 'warsaw':
    content_dsmi_file = [f.split('/')[-1].split('.')[0] for f in content_dsmi_file]

with open("%s%s" % (input_folder, fce_file), "r") as f:
    content_fce_file = f.read().splitlines()

with open("%s%s" % (input_folder, output_file), "w") as f:
    common_images = list(set(content_dsmi_file).intersection(set(content_fce_file)))
    [f.writelines([image, '\n']) for image in common_images]
