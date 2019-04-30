#!/bin/bash

# Script for running all necessary commands in order to perform 
# alliris recognition from OSIRISv4.1 using the DSMI quality measure

################################GENERATING FILES################################################################# 
#Generating files with all the files that has a DSMI value higher than the computed threshold = 0.75897357 (0.75)

# warsaw
python ../Python/compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_distortions_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_distortions_dsmi.txt 0.75

# miche
python ../Python/compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_distortions_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_distortions_dsmi.txt 0.75

# ubirisv1
python ../Python/compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_distortions_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_distortions_dsmi.txt 0.75

# ubirisv2
python ../Python/compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_distortions_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_distortions_dsmi.txt 0.75

##################################################################################################################

################################COMBINING ORIGINAL IMAGES WITH DISTORTIONS########################################
#warsaw
cat /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test_dsmi.txt > /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_all_dsmi.txt
cat /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_distortions_dsmi.txt >> /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_all_dsmi.txt

# miche
cat /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test_dsmi.txt > /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_all_dsmi.txt
cat /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_distortions_dsmi.txt >> /home/vavieira/UnB/TCC/IrisDatabases/DistortionFiles/MICHE/miche_test_all_dsmi.txt

# ubirisv1
cat /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test_dsmi.txt > /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_all_dsmi.txt
cat /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_distortions_dsmi.txt >> /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_all_dsmi.txt

# ubirisv2
cat /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test_dsmi.txt > /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_all_dsmi.txt
cat /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_distortions_dsmi.txt >> /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_all_dsmi.txt

##################################################################################################################

################################FILTERING AT LEAST TWO SUBJECTS ##################################################
# Warsaw
python ../Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/ warsaw_test_all_dsmi.txt warsaw

# MICHE
python ../Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/ miche_test_all_dsmi.txt miche

# UBIRISv1
python ../Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ ubirisv1_test_all_dsmi.txt ubirisv1_dsmi

# UBIRISv2
python ../Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ ubirisv2_test_all_dsmi.txt ubirisv2


##################################################################################################################

################################GENERATING MATCHING FILES#########################################################
#Generating files with all the files that has a DSMI value higher than the computed threshold in order
# to perform matching

# warsaw
python ../Python/generate_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_matching_test_all_dsmi_filtered.txt

# miche
python ../Python/generate_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_matching_test_all_dsmi_filtered.txt

# ubirisv1
python ../Python/generate_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_matching_test_all_dsmi_filtered.txt

# ubirisv2
python ../Python/generate_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_matching_test_all_dsmi_filtered.txt

##################################################################################################################

################################PERFORMING MATCHING#########################################################
#Performing matching in every database

# Changing to the proper folder
cd /home/vavieira/UnB/TCC/IrisDatabases/Test-Osiris/

# warsaw
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./Warsaw/Matching_DSMI_Distortions/

# miche
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./MICHE/Matching_DSMI_Distortions/

# ubirisv1
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv1/Matching_DSMI_Distortions/

# ubirisv2
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv2/Matching_DSMI_Distortions/

##################################################################################################################