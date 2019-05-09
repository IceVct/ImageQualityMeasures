from os import listdir
from os.path import isfile, join, isdir
import sys
import numpy as np
from itertools import product
from subprocess import check_output

# python generate_matchinf_file <input_filename> <output_filename> <database>
def main():
    amount_arguments = len(sys.argv)
    # checking if the amount of valid arguments is being passed
    if amount_arguments < 4 or amount_arguments > 4:
        raise ValueError('Only 3 arguments must be passed!')
    
    selected_database = sys.argv[3].lower()

    print selected_database
    
    # reading the files
    with open(sys.argv[1], 'r') as f:
        images = f.read().splitlines()

    # each subject image will be compared with all images from the same subject
    # S means subject
    # MICHE pattern: SSS_...
    # UBIRISv1 pattern: Img_SSS_...
    # UBIRISv1_DSMI pattern: Sessao_X/SSS/...
    # UBIRISv2 pattern: CSS_...
    # Warsaw pattern: 00SSleft(right)/...
    with open(sys.argv[2], 'w') as f:
        if selected_database == 'miche' or selected_database == 'ubirisv2':
            [f.write(im1 + ' ' + im2 + '\n') for im1 in images for im2 in images if im1 != im2 and im1.split('_')[0] in im2]
        elif selected_database == 'ubirisv1':
            [f.write(im1 + ' ' + im2 + '\n') for im1 in images for im2 in images if im1 != im2 and im1.split('_')[1] == im2.split('_')[1]]
        elif selected_database == 'ubirisv1_dsmi':
            [f.write(im1 + ' ' + im2 + '\n') for im1 in images for im2 in images if im1 != im2 and im1.split('/')[1] == im2.split('/')[1]]
        elif selected_database == 'warsaw':
            [f.write(im1 + ' ' + im2 + '\n') for im1 in images for im2 in images if im1 != im2 and im1.split('/')[0] in im2]


if __name__ == "__main__":
    main()