from os import listdir
from os.path import isfile, join, isdir
import sys
import numpy as np
from subprocess import check_output

# Script for computing the DSMI metric threshold, using the databases training set

def main():
    amount_arguments = len(sys.argv)
    # checking if the amount of valid arguments is being passed
    if amount_arguments < 2 or amount_arguments > 4:
        raise ValueError('Only 3 arguments must be passed!')

    circle_params_file = sys.argv[1]
    mask_file = sys.argv[2]
    normalized_images_file = sys.argv[3]

    # reading the files
    with open(circle_params_file, 'r') as f:
        circle_params = f.read().splitlines()

    with open(mask_file, 'r') as f:
        masks = f.read().splitlines()
        
    with open(normalized_images_file, 'r') as f:
        norm_images = f.read().splitlines()

    computed_fcm = []
    for i in range(0, len(norm_images)):
        executable = ['python', '/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/FeatureCorrelation/main.py', norm_images[i], masks[i], circle_params[i]]
        fcm =  check_output(executable)
        computed_fcm.append(float(fcm.rstrip()))
    

    mean = np.mean(computed_fcm)
    print str(mean)


if __name__ == "__main__":
    main()