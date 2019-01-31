import numpy as np
from math import exp

# Function that computes a iris segmentation occlusion quality measure
# The normalized mask image is a binary image. White pixels are valid iris area and black invalid
# Input: norm_iris_mask_image (numpy array)
# Output: (Float)
def occlusion_measure(norm_iris_mask_image):
    # Parameters for normalize, according to the reference paper (MORE INFO IN THE MAIN FUNCTION)
    kappa = 0.9179
    lmbda = 2.5

    # total amount of pixels in the image
    img_n_pixels = float(norm_iris_mask_image.size)

    # Computing the occlusion, which is the relation between the area of invalid 
    # pixels (occlusion of the iris) witch the total amount of pixels in the image
    invalid_area = sum(sum(norm_iris_mask_image == 0))
    o = invalid_area/img_n_pixels

    # Computing the quality measure normalization
    return (1 - exp(-lmbda*(1 - o)))/kappa
