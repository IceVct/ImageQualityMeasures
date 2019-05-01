from os import listdir
from os.path import isfile, join, isdir
import sys
import numpy as np
import matplotlib.pyplot as plt
from itertools import product
from subprocess import check_output

# python metric_histogram <input_folder> <input_file_no_distortion> <input_file_with_distortion> <distortion_name>

def compute_histogram(input_vector, bins):
    hist = []
    normalized_hist = []

    hist, out_bins = np.histogram(input_vector, bins)
    sum = np.sum(input_vector)
    normalized_hist = hist/sum

    return normalized_hist, out_bins

def main():
    input_folder = sys.argv[1]
    input_file_no_distortion = sys.argv[2]
    input_file_with_distortion = sys.argv[3]
    distortion_name = sys.argv[4]

    # reading the files
    with open("%s%s" % (input_folder, input_file_no_distortion), 'r') as f:
        no_distortion = f.read().splitlines()
    no_distorted_images = [float(line.split(' ')[-1]) for line in no_distortion]
    
    with open("%s%s" % (input_folder, input_file_with_distortion), 'r') as f:
        distortion = f.read().splitlines()
    distorted_images = [float(line.split(' ')[-1]) for line in distortion]

    bins = np.linspace(0., 1., 100)

    distorted_norm_hist, distorted_bins = compute_histogram(distorted_images, bins)
    no_distorted_norm_hist, no_distorted_bins = compute_histogram(no_distorted_images, bins)

    plt.plot(bins[:-1], distorted_norm_hist, marker=',')
    plt.plot(bins[:-1], no_distorted_norm_hist, marker=',')
    plt.title(distortion_name)
    plt.legend([distortion_name, 'Original'], loc='center right')
    plt.ylabel('Density')
    plt.xlabel('DSMI')
    plt.show()


if __name__ == "__main__":
    main()