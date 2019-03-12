# Function that receives the filename that contains both pupil 
# and iris radius data from the input image
# Input: input_file (string)
# Output: pupil radius (Float), iris radius (Float)
def pupil_iris_radius(input_file):
    with open(input_file, 'r') as f:
        file_lines = f.read().splitlines()
    
    # pupil
    pupil_line = file_lines[0].split(' ')
    pupil_radius = float(pupil_line[-1])

    # iris
    iris_line = file_lines[1].split(' ')
    iris_radius = float(iris_line[-1])

    return pupil_radius, iris_radius