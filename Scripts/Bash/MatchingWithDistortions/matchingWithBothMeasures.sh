#!/bin/bash

# Script for running all necessary commands in order to perform 
# alliris recognition from OSIRISv4.1 using both DSMI and FCE quality measures

################################GENERATING FILES################################################################# 
echo "Comparing DSMI and FCE files in order to generate the selected subject files"
# warsaw
python ../../Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/ warsaw_test_all_dsmi.txt warsaw_test_all_fce.txt warsaw_test_all_dsmi_fce.txt warsaw

# miche
python ../../Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/ miche_test_all_dsmi.txt miche_test_all_fce.txt miche_test_all_dsmi_fce.txt

# ubirisv1
python ../../Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ ubirisv1_test_all_dsmi.txt ubirisv1_test_all_fce.txt ubirisv1_test_all_dsmi_fce.txt

# ubirisv2
python ../../Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ ubirisv2_test_all_dsmi.txt ubirisv2_test_all_fce.txt ubirisv2_test_all_dsmi_fce.txt

##################################################################################################################

################################FILTERING AT LEAST TWO SUBJECTS ##################################################
echo "Filtering images that only has subjects with at least 2 images"
# Warsaw
python ../../Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/ warsaw_test_all_dsmi_fce.txt warsaw

# MICHE
python ../../Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/ miche_test_all_dsmi_fce.txt miche

# UBIRISv1
python ../../Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ ubirisv1_test_all_dsmi_fce.txt ubirisv1

# UBIRISv2
python ../../Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ ubirisv2_test_all_dsmi_fce.txt ubirisv2


##################################################################################################################

################################GENERATING MATCHING FILES#########################################################
#Generating files with all the files that has a fce value higher than the computed threshold in order
# to perform matching
echo "Generating matching files"
# warsaw
python ../../Python/generate_matching_file.py ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_all_dsmi_fce.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_matching_test_all_dsmi_fce.txt

# miche
python ../../Python/generate_matching_file.py ~/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_all_dsmi_fce.txt ~/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_matching_test_all_dsmi_fce.txt

# ubirisv1
python ../../Python/generate_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_all_dsmi_fce.txt ~/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_matching_test_all_dsmi_fce.txt

# ubirisv2
python ../../Python/generate_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_all_dsmi_fce.txt ~/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_matching_test_all_dsmi_fce.txt

##################################################################################################################

################################PERFORMING MATCHING#########################################################
#Performing matching in every database
echo "Performing matching"
# Changing to the proper folder
cd ~/UnB/TCC/IrisDatabases/Test-Osiris/

# warsaw
~/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./Warsaw/Matching_Both_Distortions/

# miche
~/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./MICHE/Matching_Both_Distortions/

# ubirisv1
~/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv1/Matching_Both_Distortions/

# ubirisv2
~/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv2/Matching_Both_Distortions/

##################################################################################################################
