import numpy as np
from relative_entropy import relative_entropy
from math import exp

# Function that computes a iris segmentation feature correlation quality measure
# The normalized mask log_gabor_norm_image is thhe magnitude of an image filtered by a 1D log gabor filter
# The normalized mask image is a binary image. White pixels are valid iris area and black invalid
# Input: log_gabor_norm_image (numpy array), norm_iris_mask_image (numpy array)
# Output: (Float)
def feature_correlation_measure(log_gabor_norm_image, norm_iris_mask_image):
    # Getting the image shape parameters
    n_rows = log_gabor_norm_image.shape[0]
    n_cols = log_gabor_norm_image.shape[1]

    # pre initializing arrays that will be used, in order to save some processing time
    r = np.zeros((1, n_cols), dtype=float)
    s = np.zeros((1, n_cols), dtype=float)
    p = np.zeros((1, n_cols), dtype=float)
    q = np.zeros((1, n_cols), dtype=float)
    j = np.zeros((1, n_rows - 1), dtype=float)

    # Parameters for normalize, according to the reference paper (MORE INFO IN THE MAIN FUNCTION)
    beta = 0.005
    alpha = 1/beta

    ### Starting the measure computation ###

    # in order to eliminate the effects of noise (occlusions), the mean value of valid pixels of each 
    # log gabor filtered image row are assigned to the pixels that are invalid in the same row
    for i in range(0, n_rows):
        # getting both noise and normal iris positions
        noise_positions = np.where(norm_iris_mask_image[i, :] == 0)
        normal_iris_positions = np.where(norm_iris_mask_image[i, :] == 255)
        # TESTAR DEPOIS E VER QUAL EH MAIS RAPIDO
        # normal_iris_positions = np.arange(0, n_cols)
        # normal_iris_positions = np.setdiff1d(normal_iris_positions, noise_positions)

        # computing the mean of the normal iris positions
        # checking if there's any normal iris position, in order to avoid errors
        if normal_iris_positions[0].size > 0:
            normal_iris_mean = np.mean(log_gabor_norm_image[i, normal_iris_positions[0]])

            # replacing the noise positions with the mean values computed
            log_gabor_norm_image[i, noise_positions[0]] = normal_iris_mean
        # else:
        #     normal_iris_mean = 0

        # replacing the noise positions with the mean values computed
        # log_gabor_norm_image[i, noise_positions[0]] = normal_iris_mean        

    # computing the correlation measure between the filtered image rows
    for i in range(1, n_rows):
        r = log_gabor_norm_image[i - 1, :]
        s = log_gabor_norm_image[i, :]

        # computing the probability mass function of both row vectors
        p = r/np.sum(r)
        q = s/np.sum(s)

        # computing the information distance J
        j[0, i - 1] = relative_entropy(p, q) + relative_entropy(q, p)

    # checking if any NaN ocurred, in order to avoid errors
    find_nan = np.where(np.isnan(j))
    j[find_nan] = 0

    ### Ending the measure computation ###
    # computing the fcm measure
    fcm = np.mean(j)
    print 'FCM = ' + str(fcm)

    # computing the measure normalization
    if 0 <= fcm and fcm <= beta:
        return alpha*fcm
    else:
        return 1.

