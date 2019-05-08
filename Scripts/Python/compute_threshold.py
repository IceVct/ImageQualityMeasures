from os import listdir
from os.path import isfile, join, isdir
import sys
import numpy as np
from subprocess import check_output

# Script for computing both DSMI/FCE metric threshold, using the databases training set
# Should receive a file with the pattern: "<image_file_name> <score>"

# CODE ADAPTATED FROM A STACK OVERFLOW ONE
# https://stackoverflow.com/questions/48213278/implementing-otsu-binarization-from-scratch-python
def otsu(array, nbins):
    n_array = len(array)
    mean_weigth = 1.0/n_array
    his, bins = np.histogram(array, nbins)
    final_thresh = -1
    final_value = -1
    for t, bin in enumerate(bins[1:-1]): # This goes from 1 to 254 uint8 range (Pretty sure wont be those values)
        Wb = np.sum(his[:t]) * mean_weigth
        Wf = np.sum(his[t:]) * mean_weigth

        mub = np.mean(his[:t])
        muf = np.mean(his[t:])

        value = Wb * Wf * (mub - muf) ** 2

        # print("Wb", Wb, "Wf", Wf)
        # print("t", t, "value", value)

        if value > final_value:
            final_thresh = bin
            final_value = value
    
    return final_thresh

def main():
    amount_arguments = len(sys.argv)
    # checking if the amount of valid arguments is being passed
    if amount_arguments < 2 or amount_arguments > 2:
        raise ValueError('Only 1 argument must be passed!')

    # reading the file
    with open(sys.argv[1], 'r') as f:
        dsmi_values = f.read().splitlines()

    dsmi_values = [float(dsmi.split(' ')[-1]) for dsmi in dsmi_values]

    threshold = otsu(dsmi_values, 100)
    print str(threshold)
    threshold = np.mean(dsmi_values)
    print threshold


if __name__ == "__main__":
    main()