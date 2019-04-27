#!/bin/bash

# Script for running all necessary commands in order to perform 
# iris recognition from OSIRISv4.1 using all the images from the database with no filter

################################GENERATING MATCHING FILES#########################################################

# warsaw
python generate_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/warsaw_test.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/warsaw_matching_test.txt

# miche
python generate_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/miche_test.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/miche_test_matching.txt

# ubirisv1
python generate_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ubirisv1_test.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ubirisv1_matching_test.txt

# ubirisv2
python generate_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ubirisv2_test.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ubirisv2_matching_test.txt

##################################################################################################################

################################PERFORMING MATCHING#########################################################
#Performing matching in every database

# Changing to the proper folder
cd /home/vavieira/UnB/TCC/IrisDatabases/Test-Osiris/

# warsaw
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./Warsaw/Matching/

# miche
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./MICHE/Matching/

# ubirisv1
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv1/Matching/

# ubirisv2
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv2/Matching/

##################################################################################################################