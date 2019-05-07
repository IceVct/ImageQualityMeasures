#!/bin/bash

# Script for running all necessary commands in order to perform 
# alliris recognition from OSIRISv4.1 using the FCE quality measure

################################GENERATING FILES################################################################# 

# warsaw
python ../../Python/compare_file_measures.py ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test_fce_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test_fce.txt 0.71

# miche
python ../../Python/compare_file_measures.py ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test_fce_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test_fce.txt 0.71

# ubirisv1
python ../../Python/compare_file_measures.py ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test_fce_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test_fce.txt 0.71

# ubirisv2
python ../../Python/compare_file_measures.py ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test_fce_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test_fce.txt 0.71

##################################################################################################################

################################GENERATING MATCHING FILES#########################################################
#Generating files with all the files that has a fce value higher than the computed threshold in order
# to perform matching

# warsaw
python ../../Python/generate_intraclass_matching_file.py ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test_fce.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_intra_matching_test_fce.txt

# miche
python ../../Python/generate_intraclass_matching_file.py ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test_fce.txt ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_intra_matching_test_fce.txt

# ubirisv1
python ../../Python/generate_intraclass_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test_fce.txt ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_intra_matching_test_fce.txt

# ubirisv2
python ../../Python/generate_intraclass_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test_fce.txt ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_intra_matching_test_fce.txt

##################################################################################################################

################################PERFORMING MATCHING#########################################################
#Performing matching in every database

# Changing to the proper folder
cd ~/UnB/TCC/IrisDatabases/Test-Osiris/

# warsaw
~/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./Warsaw/Matching_Intra_FCE/

# miche
~/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./MICHE/Matching_Intra_FCE/

# ubirisv1
~/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv1/Matching_Intra_FCE/

# ubirisv2
~/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv2/Matching_Intra_FCE/

##################################################################################################################