from feature_correlation_measure import feature_correlation_measure
from dilation_measure import dilation_measure
from occlusion_measure import occlusion_measure
from log_gabor_filter import image_log_gabor_filter
from pupil_iris_radius import pupil_iris_radius
import matplotlib.pyplot as plt
import matplotlib.cm as cm
import cv2
import numpy as np
import sys
from timeit import default_timer as timer

# Most of the variables names are following the paper Feature correlation evaluation approach for iris feature
# quality measure (by Craig Belcher, Yingzi Du, Zhi Zhou and Robert Ives) nomenclature.

def main():
    # first command line argument is the iris normalized image
    # second command line argument is the iris normalized mask image
    if(len(sys.argv) < 4 or len(sys.argv) > 4):
        raise ValueError('Only three arguments must be passed! Example: python main.py <iris_norm_img_path> <iris_norm_mask_img_path> <pupil_iris_radius_file_path>')
        
    image = cv2.imread(sys.argv[1], 0)
    image_mask = cv2.imread(sys.argv[2], 0)
    pupil_iris_filename = sys.argv[3]

    # reading the pupil and iris radius parameters
    pupil_radius, iris_radius = pupil_iris_radius(pupil_iris_filename)

    # printing the image being processed
    split_input_image_path = sys.argv[1].split('/')
    split_input_image_extension = split_input_image_path[-1].split('.')
    # print 'Image being processed: ' + split_input_image_extension[0]

    # filtering the image
    filtered_image = image_log_gabor_filter(image, 22, 0.5)
    filtered_image = np.absolute(filtered_image)

    # computing the fcm measure
    fcm = feature_correlation_measure(filtered_image, image_mask)
    # print 'fcm_final = ' + str(fcm)

    # computing the dilation measure
    d = dilation_measure(pupil_radius, iris_radius)
    # print 'd = ' + str(d)

    # computing the occlusion measure
    o = occlusion_measure(image_mask)
    # print 'o = ' + str(o)

    # final measure
    image_quality = fcm*d*o
    # print 'image quality = ' + str(image_quality)
    print str(image_quality)


if __name__ == "__main__":
    main()