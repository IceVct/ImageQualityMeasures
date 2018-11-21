from os import listdir
import os
from os.path import isfile, join
import sys


# Accessing the inputs from the terminal
input_file = sys.argv[1] 
output_file = sys.argv[2]

with open(input_file) as f:
	lines = f.readlines()
fid_output_file = open(output_file, "w")

for line in lines[:-1]:
	split_string = line.split(' ')
	measure = split_string[1]
	fid_output_file.write(measure)


fid_output_file.close()