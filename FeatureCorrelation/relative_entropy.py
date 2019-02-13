import numpy as np

# Function that computes the relative entropy of two vectors
# Input: input_vector1 (numpy array), input_vector2 (numpy array)
# Output: rel_entropy (Float)
def relative_entropy(input_vector1, input_vector2):
    rel_entropy = 0.0

    # Computing the Kullback-Leibler information distance
    rel_entropy = np.sum(input_vector1*np.log2(input_vector1/input_vector2), axis=0)

    return rel_entropy
