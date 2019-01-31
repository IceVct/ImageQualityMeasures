import numpy as np
from math import exp

# Function that computes a iris segmentation dilation quality measure
# Input: pupil_radius (Float), iris_radius (Float)
# Output: (Float)
def dilation_measure(pupil_radius, iris_radius):
    # Parameters for normalize, according to the reference paper (MORE INFO IN THE MAIN FUNCTION)
    zeta = 0.6
    gama = 40.0

    # Computing the dilation, which is the relation between the pupil radius with the iris radius
    d = pupil_radius/iris_radius

    # Computing the quality measure normalization
    # the normalization is only computed when the dlation is above 60%, which are not very usual
    if d <= 0.6:
        return 1.0
    else:
        return exp(-gama*(d - zeta))
