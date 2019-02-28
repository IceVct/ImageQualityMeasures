from os import listdir
from os.path import isfile, join, isdir
import sys
import numpy as np
import random

# Script for splitting the input iris dataset into train and test
# Options:
    # 1. MICHE;
    # 2. UBIRISv1;
    # 3. UBIRISv2;
    # 4. Warsaw;
    # else: general implementation for a dataset
# OBS: INSTEAD OF THE INPUT FOLDER AS THE OTHERS, THE UBIRISV2 DATASET MUST RECEIVE AN INPUT FILE NAMED UBIRISv2ValidImages.txt

# Function that separates the MICHE dataset into train and test.
# For each subject, there's 5 images, then 2 will be used for training
# and 3 for testing
def miche(input_folder):
    file_extension = 'jpg'

    image_filenames = [join(input_folder, f) for f in listdir(input_folder) if isfile(join(input_folder, f)) and file_extension in f]
    image_filenames.sort()
    return image_filenames

# Function that separates the UBIRISv1 dataset into train and test.
# For each subject, there's 5 images and two sessions
# The subjects will be selected by the sessions. 20 for each
# From the 5 images of each subject, 2 will be used for training
# and 3 for testing

# For each subject, will be given a index, in order to divide
# the sessions equaly. Even session 1 and odd session 2
def ubiris_v1(input_folder, selected_subjects):
    image_filenames = []
    file_extension = 'jpg'

    session = ''
    for i in range(0, len(selected_subjects)):
        # sesion 1
        if i % 2 == 0:
            session = 'Sessao_1/'
        else:
            session = 'Sessao_2/'

        filename = ''.join([input_folder, session, selected_subjects[i], '/'])
        # since in the session 2 there's a few subjects that doesnt exist
        # in order to avoid errors, check if the directory exists
        if not isdir(filename):
            filename = ''.join([input_folder, 'Sessao_1/', selected_subjects[i], '/'])

        for f in listdir(filename):
            if isfile(join(filename, f)) and file_extension in f:
                image_filenames.append(join(filename, f))

    return image_filenames

# Function that separates the Warsaw dataset into train and test.
#  There's 5 images for both left and right eyes divided 
# in two sessions for each subject
# The subjects will be selected by their eyes and sessions. 20 for each
# From the 5 images of each subject, 2 will be used for training
# and 3 for testing
# For each subject, will be given a index, in order to divide
# the eyes equaly. Since there's subjects that has no images in the session 2
# then the session 1 will be used for both eyes
def warsaw(input_folder, selected_subjects):
    file_extension = 'jpg'

    image_filenames = []
    subject_folder = ''
    for i in range(0, len(selected_subjects)):
        subject_filenames = []
        # sesion 1
        if i % 2 == 0:
            subject_folder = ''.join([selected_subjects[i], 'left/'])
        else:
            subject_folder = ''.join([selected_subjects[i], 'right/'])

        filename = ''.join([input_folder, subject_folder, 'session1/'])

        for f in listdir(filename):
            if isfile(join(filename, f)) and file_extension in f:
                subject_filenames.append(join(filename, f))
        
        image_filenames.extend(random.sample(subject_filenames, 5))

    return image_filenames

# Function that separates the UBIRISv2 dataset into train and test.
#  There's 15 images for each subject divided in 2 sessions
# The subjects will be selected by sessions. 20 for each
# Since the images are organized by the distance of the camera to the subject
# only the closest ones will be choosen, therefore 10 to 15
# From the 5 images of each subject, 2 will be used for training
# and 3 for testing
def ubiris_v2(input_file, selected_subjects):
    file_extension = 'tiff'
    
    with open(input_file, 'r') as f:
        images = f.read().splitlines()
    
    images.sort()
    image_filenames = []
    
    for subject in selected_subjects:
        subject_images = []
        subject_images = [img for img in images if subject in img]
        print subject, subject_images
        image_filenames.extend(subject_images)

    return image_filenames

def main():
    amount_arguments = len(sys.argv)
    # checking if the amount of valid arguments is being passed
    if amount_arguments < 2:
        raise ValueError('At least 2 arguments must be passed!')

    selected_dataset = int(sys.argv[1])
    
    num_train = 2

    image_filenames = []

    # parsing the options
    if selected_dataset == 1:
        if amount_arguments == 5:
            input_folder = sys.argv[2]
            output_train_file = sys.argv[3]
            output_test_file = sys.argv[4]

            image_filenames = miche(input_folder)
        else:
            raise ValueError('Amount of arguments passed for the MICHE dataset invalid! Must be 4')
        
    elif selected_dataset == 2:
        if amount_arguments == 6:
            input_folder = sys.argv[2]
            selected_subjects_file = sys.argv[3]
            output_train_file = sys.argv[4]
            output_test_file = sys.argv[5]
            
            # reading the selected subjects file
            selected_subjects = []
            with open(selected_subjects_file, 'r') as f:
                selected_subjects = f.read().splitlines()

            image_filenames = ubiris_v1(input_folder, selected_subjects)
                
        else:
            raise ValueError('Amount of arguments passed for the UBIRISv1 dataset invalid! Must be 5')

    elif selected_dataset == 3:
        if amount_arguments == 6:
            input_folder = sys.argv[2]
            selected_subjects_file = sys.argv[3]
            output_train_file = sys.argv[4]
            output_test_file = sys.argv[5]
            
            # reading the selected subjects file
            selected_subjects = []
            with open(selected_subjects_file, 'r') as f:
                selected_subjects = f.read().splitlines()

            image_filenames = warsaw(input_folder, selected_subjects)
                
        else:
            raise ValueError('Amount of arguments passed for the Warsaw dataset invalid! Must be 5')

    elif selected_dataset == 4:
        if amount_arguments == 6:
            input_file = sys.argv[2]
            selected_subjects_file = sys.argv[3]
            output_train_file = sys.argv[4]
            output_test_file = sys.argv[5]
            
            # reading the selected subjects file
            selected_subjects = []
            with open(selected_subjects_file, 'r') as f:
                selected_subjects = f.read().splitlines()

            image_filenames = ubiris_v2(input_file, selected_subjects)
            print len(image_filenames)
                
        else:
            raise ValueError('Amount of arguments passed for the UBIRISv2 dataset invalid! Must be 5')
    else:
        raise ValueError('Invalid option for database!')
    
    image_filenames.sort()
    image_filenames = np.array(image_filenames)

    # Creating the input and output file strings
    fid_output_train = open(output_train_file, "w")
    fid_output_test = open(output_test_file, "w")

    train_images = []
    test_images = []
    
    # separating the train and test list of images for each subject
    for i in xrange(0, len(image_filenames), 5):
        range_index = range(i, i + 5)
        train_idx = np.array(random.sample(range_index, num_train))
        test_idx = np.delete(range_index, train_idx - i)

        train_images.extend(image_filenames[train_idx])
        test_images.extend(image_filenames[test_idx])
        
    # writing the train and test files
    for image in train_images:
        fid_output_train.write(image + '\n') # concatenating the file_name to the end of line character

    for image in test_images:
        fid_output_test.write(image + '\n') # concatenating the file_name to the end of line character


    fid_output_train.close()
    fid_output_test.close()


if __name__ == "__main__":
    main()