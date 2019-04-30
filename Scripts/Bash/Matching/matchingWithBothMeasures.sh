#!/bin/bash

# Script for running all necessary commands in order to perform 
# alliris recognition from OSIRISv4.1 using both DSMI and FCE quality measures

################################GENERATING FILES################################################################# 
#Generating files with all the files that has DSMI value higher than 0.75 and 
# a FCE value higher than 0.71

# warsaw
python ../Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/ warsaw_test_dsmi.txt warsaw_test_fce.txt warsaw_test_dsmi_fce.txt warsaw

# miche
python ../Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/ miche_test_dsmi.txt miche_test_fce.txt miche_test_dsmi_fce.txt

# ubirisv1
python ../Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ ubirisv1_test_dsmi.txt ubirisv1_test_fce.txt ubirisv1_test_dsmi_fce.txt

# ubirisv2
python ../Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ ubirisv2_test_dsmi.txt ubirisv2_test_fce.txt ubirisv2_test_dsmi_fce.txt

##################################################################################################################

################################GENERATING MATCHING FILES#########################################################
#Generating files with all the files that has a fce value higher than the computed threshold in order
# to perform matching

# warsaw
python ../Python/generate_matching_file.py ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test_dsmi_fce.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_matching_test_dsmi_fce.txt

# miche
python ../Python/generate_matching_file.py ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test_dsmi_fce.txt ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_matching_test_dsmi_fce.txt

# ubirisv1
python ../Python/generate_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test_dsmi_fce.txt ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_matching_test_dsmi_fce.txt

# ubirisv2
python ../Python/generate_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test_dsmi_fce.txt ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_matching_test_dsmi_fce.txt

##################################################################################################################

################################PERFORMING MATCHING#########################################################
#Performing matching in every database

# Changing to the proper folder
cd ~/UnB/TCC/IrisDatabases/Test-Osiris/

# warsaw
~/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./Warsaw/Matching_Both/

# miche
~/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./MICHE/Matching_Both/

# ubirisv1
~/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv1/Matching_Both/

# ubirisv2
~/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv2/Matching_Both/

##################################################################################################################