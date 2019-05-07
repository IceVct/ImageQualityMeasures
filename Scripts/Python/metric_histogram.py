from os import listdir
from os.path import isfile, join, isdir
import sys
import numpy as np
import matplotlib.pyplot as plt
from itertools import product
from subprocess import check_output

# python metric_histogram <input_folder> <input_file_no_distortion> <input_file_with_distortion> <distortion_name>

# http://blog.datadive.net/histogram-intersection-for-change-detection/
def histogram_intersection(h1, h2, bins):
   bins = np.diff(bins)
   sm = 0
   for i in range(len(bins)):
       sm += min(bins[i]*h1[i], bins[i]*h2[i])
   return sm

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
    show_plot = sys.argv[5]

    choosen_distortion = distortion_name.replace('_', ' ', 1) if '_' in distortion_name else distortion_name
    output_img_filename = '%s%s.png' % (input_folder, distortion_name) if not 'paper' in input_file_with_distortion else '%s%s_paper.png' % (input_folder, distortion_name)

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

    hist_intersection = histogram_intersection(distorted_norm_hist, no_distorted_norm_hist, bins)
    print hist_intersection

    plt.plot(bins[:-1], distorted_norm_hist, marker=',')
    plt.plot(bins[:-1], no_distorted_norm_hist, marker=',')
    plt.legend([choosen_distortion, 'Original'], loc='upper left')
    plt.ylabel('Density')
    plt.xlabel('DSMI')
    plt.ylim(0, 0.3)
    plt.savefig(output_img_filename)

    if show_plot.lower() == 'true':
        plt.show()


if __name__ == "__main__":
    main()