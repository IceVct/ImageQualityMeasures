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
with open("%s%s" % (input_folder, matching_file), "r") as f:
    content_matching_file = f.read().splitlines()

# Depending on the database, 
labels = []
print matching_file, database
if database == 'MICHE' or database == 'UBIRISv2':
    labels = ["0" if line.split('_')[0] in line.split(' ')[-1] else "1" for line in content_matching_file]
elif database == 'UBIRISv1':
    labels = ["0" if line.split('/')[1] in line.split(' ')[-1] else "1" for line in content_matching_file]
elif database == 'UBIRISv1_FCE':
    labels = ["0" if line.split('_')[1] in line.split(' ')[-1] else "1" for line in content_matching_file]
else:
    labels = ["0" if line.split('/')[0] in line.split(' ')[-1] else "1" for line in content_matching_file]


with open("%s%s" % (input_folder, output_file), "w") as f:
    [f.writelines([label, '\n']) for label in labels]
