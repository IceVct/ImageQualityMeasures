#!/bin/bash

python ../Python/compute_fcm_measure.py ~/UnB/TCC/IrisDatabases/Test-Osiris/MICHE/norm_images.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/MICHE/norm_masks.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/MICHE/circle_params.txt ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test_fce_stats.txt miche

python ../Python/compute_fcm_measure.py ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv1/norm_images.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv1/norm_masks.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv1/circle_params.txt ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test_fce_stats.txt ubirisv1 ubirisv1_subject_map

python ../Python/compute_fcm_measure.py ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv2/norm_images.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv2/norm_masks.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv2/circle_params.txt ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test_fce_stats.txt ubirisv2

python ../Python/compute_fcm_measure.py ~/UnB/TCC/IrisDatabases/Test-Osiris/Warsaw/norm_images.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/Warsaw/norm_masks.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/Warsaw/circle_params.txt ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test_fce_stats.txt warsaw warsaw_subject_map
