from os import listdir
from os.path import isfile, join
import sys
import numpy as np
import random

# Script that separates the MICHE dataset into train and test.
# For each subject, there's 5 imagens, then 2 will be used for training
# and 3 for testing

input_folder = sys.argv[1]
output_train_file = sys.argv[2]
output_test_file = sys.argv[3]
file_extension = 'jpg'

num_train = 2

# Creating the input and output file strings

fid_output_train = open(output_train_file, "w")
fid_output_test = open(output_test_file, "w")

image_filenames = []
train_images = []
test_images = []

# Looping through the input folder files and adding them to the image_filenames list
image_filenames = [join(input_folder, f) for f in listdir(input_folder) if isfile(join(input_folder, f)) and file_extension in f]
image_filenames.sort()
image_filenames = np.array(image_filenames)

# separating the train and test list of images for each subject
for i in xrange(0, len(image_filenames), 5):
    range_index = range(i, i + 5)
    train_idx = random.sample(range_index, num_train)
    test_idx = np.delete(range_index, train_idx)

    train_images.extend(image_filenames[train_idx])
    test_images.extend(image_filenames[test_idx])
    
# writing the train and test files
for image in train_images:
    fid_output_train.write(image + '\n') # concatenating the file_name to the end of line character

for image in test_images:
    fid_output_test.write(image + '\n') # concatenating the file_name to the end of line character


fid_output_train.close()
fid_output_test.close()