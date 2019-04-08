#!/bin/bash

python compute_fcm_measure.py ~/UnB/TCC/IrisDatabases/Test-Osiris/MICHE/norm_images.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/MICHE/norm_masks.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/MICHE/circle_params.txt ~/UnB/TCC/IrisDatabases/MICHE/miche_test_fce_stats.txt

python compute_fcm_measure.py ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv1/norm_images.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv1/norm_masks.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv1/circle_params.txt ~/UnB/TCC/IrisDatabases/UBIRISv1/ubirisv1_test_fce_stats.txt

python compute_fcm_measure.py ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv2/norm_images.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv2/norm_masks.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/UBIRISv2/circle_params.txt ~/UnB/TCC/IrisDatabases/UBIRISv2/ubirisv2_test_fce_stats.txt

python compute_fcm_measure.py ~/UnB/TCC/IrisDatabases/Test-Osiris/Warsaw/norm_images.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/Warsaw/norm_masks.txt ~/UnB/TCC/IrisDatabases/Test-Osiris/Warsaw/circle_params.txt ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/warsaw_test_fce_stats.txt
