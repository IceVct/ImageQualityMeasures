#!/bin/bash

# Script for running all necessary commands in order to perform 
# iris recognition from OSIRISv4.1 using all the images from the database with no filter

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