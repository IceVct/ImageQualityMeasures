#!/bin/bash

# Script for generating the txt files with the segmentation parameters, in order to perform FCE
# The input argument should be the desired database folder
# Example: ./generateParamsOsirisTxt.sh ~/UnB/TCC/IrisDatabases/Test-Osiris/Warsaw

echo "$@"
ls "$@"/Output/CircleParameters/ | grep gaussian >> "$@"/circle_params_distortions.txt
ls "$@"/Output/CircleParameters/ | grep jpeg2000 >> "$@"/circle_params_distortions.txt
ls "$@"/Output/CircleParameters/ | grep impulse >> "$@"/circle_params_distortions.txt
ls "$@"/Output/CircleParameters/ | grep over >> "$@"/circle_params_distortions.txt
ls "$@"/Output/CircleParameters/ | grep wgn >> "$@"/circle_params_distortions.txt
ls "$@"/Output/CircleParameters/ | grep motion >> "$@"/circle_params_distortions.txt

ls "$@"/Output/NormalizedImages/ | grep gaussian >> "$@"/norm_images_distortions.txt
ls "$@"/Output/NormalizedImages/ | grep jpeg2000 >> "$@"/norm_images_distortions.txt
ls "$@"/Output/NormalizedImages/ | grep impulse >> "$@"/norm_images_distortions.txt
ls "$@"/Output/NormalizedImages/ | grep over >> "$@"/norm_images_distortions.txt
ls "$@"/Output/NormalizedImages/ | grep wgn >> "$@"/norm_images_distortions.txt
ls "$@"/Output/NormalizedImages/ | grep motion >> "$@"/norm_images_distortions.txt

ls "$@"/Output/NormalizedMasks/ | grep gaussian >> "$@"/norm_masks_distortions.txt
ls "$@"/Output/NormalizedMasks/ | grep jpeg2000 >> "$@"/norm_masks_distortions.txt
ls "$@"/Output/NormalizedMasks/ | grep impulse >> "$@"/norm_masks_distortions.txt
ls "$@"/Output/NormalizedMasks/ | grep over >> "$@"/norm_masks_distortions.txt
ls "$@"/Output/NormalizedMasks/ | grep wgn >> "$@"/norm_masks_distortions.txt
ls "$@"/Output/NormalizedMasks/ | grep motion >> "$@"/norm_masks_distortions.txt