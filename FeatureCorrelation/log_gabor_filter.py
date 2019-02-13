import numpy as np


# Function that receives an image row, computes the 1D DFT (using FFT) of this vector
# and filters using the Log Gabor Filter (https://www.peterkovesi.com/matlabfns/PhaseCongruency/Docs/convexpl.html)
# Input: image_row (numpy array), log_gabor_filter (numpy array)
# Output: filtered_row (numpy array)
def one_dim_log_gabor_filter(image_row, log_gabor_filter):
    # computing the 1D DFT using the FFT algorithm
    fourier_image_row = np.fft.fft(image_row)

    # filtering the image row and computing its inverse fourier transform
    filtered_row = fourier_image_row*log_gabor_filter

    return np.fft.ifft(filtered_row)

# Function that receives an image and filters each row with the log gabor filter
# Input: image (numpy array), wavelength (float), sigma(float), mult(float), n_scales(float)
# Output: filtered_image (numpy array)
def image_log_gabor_filter(image, wavelength, sigma):
    # getting image parameters
    rows, cols = image.shape

    ndata = cols
    # checking if the amount of columns in the image is odd, if it is, discard the last element
    if cols % 2 == 1:
        ndata = ndata - 1

    log_gabor_filter = np.zeros((1, ndata))

    # creating an array with the frequencies that are going to be used
    omega = np.linspace(0, 0.5, ndata/2 + 1)
    omega[0] = 1.

    # computing the centre frequency, based on the wavelength
    fo = 1./wavelength

    # ignoring the log divide by 0 warning
    np.seterr(divide = 'ignore')

    # Generating the log gabor 1D kernel
    log_gabor_filter[0, 0:((ndata/2) + 1)] = np.exp((-(np.log(omega/fo))**2.) / (2. * np.log(sigma)**2))

    # setting numpy divide warnings back
    np.seterr(divide = 'warn')

    # creating the array that will receive the filtered image
    filtered_image = np.zeros((rows, cols), dtype=complex)

    # filtering each image row with the log gabor filter
    for i in range(0, rows):
        filtered_image[i, :] = one_dim_log_gabor_filter(image[i, :], log_gabor_filter)

    return filtered_image