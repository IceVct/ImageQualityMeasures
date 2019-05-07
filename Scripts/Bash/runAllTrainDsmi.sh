#!/bin/bash

python ../Python/compute_dsmi_measures.py ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_train.txt ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_train_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/SelectedSubjects/

python ../Python/compute_dsmi_measures.py ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_train.txt ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_train_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/

python ../Python/compute_dsmi_measures.py ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_train.txt ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_train_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/

python ../Python/compute_dsmi_measures.py ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_train.txt ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_train_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/
