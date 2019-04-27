from os import listdir
import os
from os.path import isfile, join
import sys

# Script for comparing previous measures(without the weight) and the new measures

# Accessing the inputs from the terminal
input_file_1 = sys.argv[1] 
input_file_2 = sys.argv[2] 
output_file = sys.argv[3]

# reading the files and opening the output file
with open(input_file_1) as f1:
	lines_1 = f1.readlines()
with open(input_file_2) as f2:
	lines_2 = f2.readlines()

fid_output_file = open(output_file, "w")

# comparing each of the files
n_lines = len(lines_1)
counter_of_changes = 0

for i in range(0, n_lines - 1):
	split_line_1 = lines_1[i].split(' ')
	split_line_2 = lines_2[i].split(' ')
	measure_1 = split_line_1[1]
	measure_2 = split_line_2[1]
	if float(measure_2) < float(measure_1):
		counter_of_changes = counter_of_changes + 1
		file_output_line = split_line_1[0] + ' ' + measure_1.rstrip() + ' -> ' + measure_2.rstrip() + '\n'
		fid_output_file.write(file_output_line)

# comparing the previous min,max with the new values computed
split_line_1 = lines_1[n_lines - 1].split(', ')
split_line_2 = lines_2[n_lines - 1].split(', ')

previous_max = split_line_1[3]
new_max = split_line_2[3]
previous_min = split_line_1[4].rstrip()
new_min = split_line_2[4].rstrip()

# writing the last line in the output file
fid_output_file.write('Min: ' + previous_min + ' -> ' + new_min + '\n')
fid_output_file.write('Max: ' + previous_max + ' -> ' + new_max + '\n')
fid_output_file.write(str(counter_of_changes) + '/' + str(n_lines - 1) + '\n')

fid_output_file.close()