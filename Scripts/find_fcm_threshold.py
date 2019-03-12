from os import listdir
from os.path import isfile, join, isdir
import sys
import numpy as np

def main():
    amount_arguments = len(sys.argv)
    # checking if the amount of valid arguments is being passed
    if amount_arguments < 2 or amount_arguments > 4:
        raise ValueError('Only 3 arguments must be passed!')


    with open(input_file, 'r') as f:
        images = f.read().splitlines()


if __name__ == "__main__":
    main()