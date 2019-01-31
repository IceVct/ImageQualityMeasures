import numpy as np

# Function that computes the relative entropy of two vectors
# Input: input_vector1 (numpy array), input_vector2 (numpy array)
# Output: rel_entropy (Float)
def relative_entropy(input_vector1, input_vector2):
    rel_entropy = 0.0

    # Computing all the log2 and multiplications element wise, before the sum
    rel_entropy = input_vector1*np.log2(input_vector1/input_vector2)

    # computing the sum
    rel_entropy = sum(rel_entropy)

    return rel_entropy
