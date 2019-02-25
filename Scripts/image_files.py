from os import listdir
import os
from os.path import isfile, join
import sys

# Script for generating a txt file with the pathname of all images from a folder

# Accessing the inputs from the terminal
base_path = sys.argv[1] # the base folder path
input_folder = sys.argv[2] # the folder that contains the images
file_extension = sys.argv[3] # the image extension 
output_folder = sys.argv[4] # the folder to be written
output_file_name = sys.argv[5] # the .txt output file name
directory_flag = sys.argv[6] # flag for telling if it must iterate for all files of one directory or all files from all subdirectories

# Creating the input and output file strings
input_filename = base_path + input_folder
output_file = output_folder + output_file_name

fid_output_file = open(output_file, "w")

image_filenames = []
# Looping through the input folder files and adding them to the image_filenames list
if directory_flag == 'false':
	image_filenames = [f for f in listdir(input_filename) if isfile(join(input_filename, f)) and file_extension in f]
else:
	for subdir, dirs, files in os.walk(input_filename):
		for f in files:
			if isfile(join(subdir, f)) and file_extension in f:
				image_filenames.append(join(subdir, f))
		# image_filenames = [f for f in files if isfile(join(subdir, f)) and file_extension in f]

# writing the file_names to the txt file
print image_filenames
for image in image_filenames:
	print image
	if directory_flag == 'false':
		fid_output_file.write(input_filename + image + '\n') # concatenating the file_name to the end of line character
	else:
		fid_output_file.write(image + '\n') # concatenating the file_name to the end of line character


fid_output_file.close()