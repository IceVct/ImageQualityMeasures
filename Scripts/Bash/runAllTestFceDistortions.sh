#!/bin/bash

echo "Starting the FCE calculation for distorted images"
echo "MICHE"
python compute_fcm_measure.py ~/UnB/TCC/IrisDatabases/Test-Osiris/MICHE/norm_images_distortions.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/MICHE/norm_masks_distortions.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/MICHE/circle_params_distortions.txt ~/UnB/TCC/IrisDatabases/MICHE/miche_test_distortions_fce_stats.txt

echo "UBIRISv1"
python compute_fcm_measure.py ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv1/norm_images_distortions.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv1/norm_masks_distortions.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv1/circle_params_distortions.txt ~/UnB/TCC/IrisDatabases/UBIRISv1/ubirisv1_test_distortions_fce_stats.txt ubirisv1 ubirisv1_subject_map_distortions

echo "UBIRISv2"
python compute_fcm_measure.py ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv2/norm_images_distortions.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv2/norm_masks_distortions.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv2/circle_params_distortions.txt ~/UnB/TCC/IrisDatabases/UBIRISv2/ubirisv2_test_distortions_fce_stats.txt

echo "Warsaw"
python compute_fcm_measure.py ~/UnB/TCC/IrisDatabases/Test-Osiris/Warsaw/norm_images_distortions.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/Warsaw/norm_masks_distortions.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/Warsaw/circle_params_distortions.txt ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/warsaw_test_distortions_fce_stats.txt warsaw warsaw_subject_map_distortions
