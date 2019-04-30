from os import listdir
from os.path import isfile, join
import sys
from collections import Counter

# Script that reads a file with filtered subjects by or DSMI or FCE metrics from a given database
# and checks if there's two ocurrences for each subject, in order to guarantee that at least two subjects 
# are used for matching

# Accessing the inputs from the terminal
input_folder = sys.argv[1] 
input_file = sys.argv[2] 
database = sys.argv[3]

output_file = input_file.split('.')[0]

# Database templates:
# MICHE     XXXX_
# Warsaw     XXXX/
# UBIRISv1     /XXXX[1]
# UBIRISv2     XXXX_

print database

# reading files and getting only the subjects, in order to compute the number of ocurrences
with open("%s%s" % (input_folder, input_file), "r") as f:
    file_content = f.read().splitlines()

subjects = []
if database.lower() == 'miche' or database.lower() == 'ubirisv2':
    subjects = [subject.split('_')[0] for subject in file_content]
elif database.lower() == 'warsaw':
    subjects = [subject.split('/')[0] for subject in file_content]
elif database.lower() == 'ubirisv1_dsmi':
    subjects = [subject.split('/')[1] for subject in file_content]
elif database.lower() == 'ubirisv1':
    subjects = [subject.split('_')[1] for subject in file_content]
else:
    raise ValueError('Invalid database!')

# Counting the amount of ocurrences for each subject
counter = {}
for i in subjects:
    counter[i] = counter.get(i, 0) + 1

print counter

# Saving only the subjects that has 2 ocurrences
with open("%s%s_filtered.txt" % (input_folder, output_file), "w") as f:
    subj = ''
    for line in file_content:
        if database.lower() == 'miche' or database.lower() == 'ubirisv2':
            subj = line.split('_')[0]
        elif database.lower() == 'warsaw':
            subj = line.split('/')[0]
        elif database.lower() == 'ubirisv1_dsmi':
            subj = line.split('/')[1]
        elif database.lower() == 'ubirisv1':
            subj = line.split('_')[1]
        
        if counter[subj] > 1:
            f.writelines([line, '\n'])
