import numpy as np
from relative_entropy import relative_entropy
from math import exp
import scipy.stats as stats

# Function that computes a iris segmentation feature correlation quality measure
# The normalized mask log_gabor_norm_image is thhe magnitude of an image filtered by a 1D log gabor filter
# The normalized mask image is a binary image. White pixels are valid iris area and black invalid
# Input: log_gabor_norm_image (numpy array), norm_iris_mask_image (numpy array)
# Output: (Float)
def feature_correlation_measure(log_gabor_norm_image, norm_iris_mask_image):
    # Getting the image shape parameters
    n_rows = log_gabor_norm_image.shape[0]
    n_cols = log_gabor_norm_image.shape[1]

    # Parameters for normalize, according to the reference paper (MORE INFO IN THE MAIN FUNCTION)
    # beta = 0.005
    beta = 0.294
    alpha = 1/beta

     # in case that there are only masked pixels in the row, which means that 
     # are no helpful to the measure computation
    invalid_rows = []

    ### Starting the measure computation ###

    # in order to eliminate the effects of noise (occlusions), the mean value of valid pixels of each 
    # log gabor filtered image row are assigned to the pixels that are invalid in the same row
    for i in range(0, n_rows):
        # getting both noise and normal iris positions
        noise_positions = np.where(norm_iris_mask_image[i, :] == 0)
        normal_iris_positions = np.where(norm_iris_mask_image[i, :] == 255)

        # computing the mean of the normal iris positions
        # checking if there's any normal iris position, in order to avoid errors
        if normal_iris_positions[0].size > 0:
            normal_iris_mean = np.mean(log_gabor_norm_image[i, normal_iris_positions[0]])

            # replacing the noise positions with the mean values computed
            log_gabor_norm_image[i, noise_positions[0]] = normal_iris_mean
        else:
            invalid_rows.append(i)
            # epsilon = 0.00001
            # normal_iris_mean = epsilon # avoiding NaN values

        # replacing the noise positions with the mean values computed
        # log_gabor_norm_image[i, noise_positions[0]] = normal_iris_mean     

    # removing the invalid rows from the filtered image
    if len(invalid_rows) > 0:
        log_gabor_norm_image = np.delete(log_gabor_norm_image, invalid_rows, axis=0)
        # Getting the image shape parameters again, because invalid rows were deleted 
        # from the image
        n_rows = log_gabor_norm_image.shape[0]
        n_cols = log_gabor_norm_image.shape[1]
    
    # it means that the whole normalized mask was occlusion, so the segmentation 
    # has a 0 score
    if n_rows < 1:
        print 0.
        return 0.

    # pre initializing arrays that will be used, in order to save some processing time
    r = np.zeros((1, n_cols), dtype=float)
    s = np.zeros((1, n_cols), dtype=float)
    p = np.zeros((1, n_cols), dtype=float)
    q = np.zeros((1, n_cols), dtype=float)
    j = np.zeros((1, n_rows - 1), dtype=float)   

    # computing the correlation measure between the filtered image rows
    for i in range(1, n_rows):
        r = log_gabor_norm_image[i - 1, :]
        s = log_gabor_norm_image[i, :]

        # computing the probability mass function of both row vectors
        p = r/np.sum(r, axis=0)
        q = s/np.sum(s, axis=0)

        # computing the information distance J
        j[0, i - 1] = relative_entropy(p, q) + relative_entropy(q, p)

    ### Ending the measure computation ###
    
    # computing the fcm measure
    fcm = np.mean(j)
    # print 'FCM = ' + str(fcm)
    print str(fcm)

    # computing the measure normalization
    if 0 <= fcm and fcm <= beta:
        return alpha*fcm
    else:
        return 1.

