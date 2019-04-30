from os import listdir
from os.path import isfile, join, isdir
import sys
import numpy as np
from itertools import product
from subprocess import check_output

# python metric_histogram <input_folder> <input_file_no_distortion> <input_file_with_distortion>

def compute_histogram(input_vector):
    histogram = []

    return histogram, bins

def main():
    input_folder = sys.argv[1]
    input_file_no_distortion = sys.argv[2]
    input_file_with_distortion = sys.argv[3]

    # reading the files
    with open("%s%s" % (input_folder, input_file_no_distortion), 'r') as f:
        no_distortion = f.read().splitlines()
    no_distorted_images = [line.split(' ')[-1] for line in no_distortion]
    
    with open("%s%s" % (input_folder, input_file_with_distortion), 'r') as f:
        distortion = f.read().splitlines()
    distorted_images = [line.split(' ')[-1] for line in distortion]


if __name__ == "__main__":
    main()