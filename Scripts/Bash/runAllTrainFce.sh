#!/bin/bash

python ../Python/compute_fcm_measure.py /media/vavieira/HD-Victor/Ubuntu/UnB/TCC/IrisDatabases/FCM-Train-Osiris/MICHE/normalized.txt /media/vavieira/HD-Victor/Ubuntu/UnB/TCC/IrisDatabases/FCM-Train-Osiris/MICHE/masks.txt /media/vavieira/HD-Victor/Ubuntu/UnB/TCC/IrisDatabases/FCM-Train-Osiris/MICHE/circle_params.txt ~/UnB/TCC/IrisDatabases/MICHE/miche_train_fce_stats.txt

python ../Python/compute_fcm_measure.py /media/vavieira/HD-Victor/Ubuntu/UnB/TCC/IrisDatabases/FCM-Train-Osiris/UBIRISv1/normalized.txt /media/vavieira/HD-Victor/Ubuntu/UnB/TCC/IrisDatabases/FCM-Train-Osiris/UBIRISv1/masks.txt /media/vavieira/HD-Victor/Ubuntu/UnB/TCC/IrisDatabases/FCM-Train-Osiris/UBIRISv1/circle_params.txt ~/UnB/TCC/IrisDatabases/UBIRISv1/ubirisv1_train_fce_stats.txt

python ../Python/compute_fcm_measure.py /media/vavieira/HD-Victor/Ubuntu/UnB/TCC/IrisDatabases/FCM-Train-Osiris/UBIRISv2/normalized.txt /media/vavieira/HD-Victor/Ubuntu/UnB/TCC/IrisDatabases/FCM-Train-Osiris/UBIRISv2/masks.txt /media/vavieira/HD-Victor/Ubuntu/UnB/TCC/IrisDatabases/FCM-Train-Osiris/UBIRISv2/circle_params.txt ~/UnB/TCC/IrisDatabases/UBIRISv2/ubirisv2_train_fce_stats.txt

python ../Python/compute_fcm_measure.py /media/vavieira/HD-Victor/Ubuntu/UnB/TCC/IrisDatabases/FCM-Train-Osiris/Warsaw/normalized.txt /media/vavieira/HD-Victor/Ubuntu/UnB/TCC/IrisDatabases/FCM-Train-Osiris/Warsaw/masks.txt /media/vavieira/HD-Victor/Ubuntu/UnB/TCC/IrisDatabases/FCM-Train-Osiris/Warsaw/circle_params.txt ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/warsaw_train_fce_stats.txt

