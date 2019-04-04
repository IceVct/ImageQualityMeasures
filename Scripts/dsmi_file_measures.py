from os import listdir
import os
from os.path import isfile, join
import sys


# Accessing the inputs from the terminal
input_file = sys.argv[1] 
output_file = sys.argv[2]

with open(input_file) as f:
	lines = f.readlines()

threshold = 0.75
with open(output_file, 'w') as f:
	for line in lines[:-1]:
		image, measure = line.split(' ')
		# checking if is higher than the threshold
		if float(measure) > threshold:
			f.write(image)
