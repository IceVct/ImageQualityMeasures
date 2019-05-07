#!/bin/bash

# Script for running all necessary commands in order to perform 
# iris recognition from OSIRISv4.1 using all the images from the database with no filter

################################GENERATING MATCHING FILES#########################################################="$@"

# warsaw
python ../../Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_intra_matching_test.txt

# miche
python ../../Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_intra_matching_test.txt

# ubirisv1
python ../../Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_intra_matching_test.txt

# ubirisv2
python ../../Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_intra_matching_test.txt

##################################################################################################################

################################PERFORMING MATCHING#########################################################
#Performing matching in every database

# Changing to the proper folder
cd /home/vavieira/UnB/TCC/IrisDatabases/Test-Osiris/

# warsaw
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./Warsaw/Matching_Intra/

# miche
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./MICHE/Matching_Intra/

# ubirisv1
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv1/Matching_Intra/

# ubirisv2
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv2/Matching_Intra/

##################################################################################################################