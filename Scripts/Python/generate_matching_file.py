from os import listdir
from os.path import isfile, join, isdir
import sys
import numpy as np
from itertools import product
from subprocess import check_output

# python generate_matchinf_file <input_filename> <output_filename>
def main():
    amount_arguments = len(sys.argv)
    # checking if the amount of valid arguments is being passed
    if amount_arguments < 3 or amount_arguments > 3:
        raise ValueError('Only 2 arguments must be passed!')

    # reading the files
    with open(sys.argv[1], 'r') as f:
        images = f.read().splitlines()

    # each image will be compared with all the others, therefore, it will be inter-class
    
    inter_class = product(images, images)

    with open(sys.argv[2], 'w') as f:
        [f.write(im1 + ' ' + im2 + '\n') for im1 in images for im2 in images if im1 != im2]


if __name__ == "__main__":
    main()