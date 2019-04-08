#!/bin/bash

# Script for running all necessary commands in order to perform 
# alliris recognition from OSIRISv4.1 using the DSMI quality measure

################################GENERATING FILES################################################################# 
#Generating files with all the files that has a DSMI value higher than the computed threshold = 0.75897357 (0.75)

# warsaw
python compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/warsaw_test_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/warsaw_test_dsmi.txt 0.75

# miche
python compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/miche_test_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/miche_test_dsmi.txt 0.75

# ubirisv1
python compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ubirisv1_test_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ubirisv1_test_dsmi.txt 0.75

# ubirisv2
python compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ubirisv2_test_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ubirisv2_test_dsmi.txt 0.75

##################################################################################################################

################################GENERATING MATCHING FILES#########################################################
#Generating files with all the files that has a DSMI value higher than the computed threshold in order
# to perform matching

# warsaw
python generate_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/warsaw_test_dsmi.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/warsaw_matching_test_dsmi.txt

# miche
python generate_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/miche_test_dsmi.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/miche_matching_test_dsmi.txt

# ubirisv1
python generate_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ubirisv1_test_dsmi.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ubirisv1_matching_test_dsmi.txt

# ubirisv2
python generate_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ubirisv2_test_dsmi.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ubirisv2_matching_test_dsmi.txt

##################################################################################################################

################################PERFORMING MATCHING#########################################################
#Performing matching in every database

# Changing to the proper folder
cd /home/vavieira/UnB/TCC/IrisDatabases/Test-Osiris/

# warsaw
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./Warsaw/Matching_DSMI/

# miche
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./MICHE/Matching_DSMI/

# ubirisv1
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv1/Matching_DSMI/

# ubirisv2
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv2/Matching_DSMI/

##################################################################################################################