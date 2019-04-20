from os import listdir
from os.path import isfile, join
import numpy as np
import sys
import math as mth
from subprocess import check_output

# Since when the OSIRIS algorithm runs on the Warsaw database the image filename results
# doesnt contain the subject information, a mapping must be done

# The output file format will be, such as a hash map:
#FILENAME->subject

# Accessing the inputs from the terminal
input_folder = sys.argv[1]
input_file = sys.argv[2] 
output_file = sys.argv[3]
database = sys.argv[4]

# reading the input file
with open("%s%s" % (input_folder, input_file), "r") as f:
    input_content = f.read().splitlines()

#example warsaw 0001left/session1/IMG_0094.jpg
#example ubirisv1 Sessao{i}/subject/IMG_xxxx.jpg
# Creating a tuple for each subject and image file name 
if database.lower() == 'warsaw':
    subject_map = [(line.split('/')[-1].split('.')[0], line.split('/')[0]) for line in input_content]
elif database.lower() == 'ubirisv1':
    subject_map = [(line.split('/')[-1].split('.')[0], line.split('/')[1]) for line in input_content]

# Saving the output file
with open("%s%s" % (input_folder, output_file), "w") as f:
    [f.writelines([subject[0], '->', subject[1], '\n']) for subject in subject_map]

