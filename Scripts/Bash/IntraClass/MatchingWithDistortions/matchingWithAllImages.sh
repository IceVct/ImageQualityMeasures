#!/bin/bash

# Script for running all necessary commands in order to perform 
# iris recognition from OSIRISv4.1 using all the images from the database with no filter

################################PERFORMING MATCHING#########################################################
#Performing matching in every database
echo "Performing matching"

# Changing to the proper folder
cd /home/vavieira/UnB/TCC/IrisDatabases/Test-Osiris/

# warsaw
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./Warsaw/Matching_Intra_Distortions/

# miche
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./MICHE/Matching_Intra_Distortions/

# ubirisv1
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv1/Matching_Intra_Distortions/

# ubirisv2
/home/vavieira/UnB/TCC/Codigos/Iris_Osiris/src/osiris ./UBIRISv2/Matching_Intra_Distortions/

##################################################################################################################