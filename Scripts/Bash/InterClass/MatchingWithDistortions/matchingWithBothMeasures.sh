#!/bin/bash

# Script for running all necessary commands in order to perform 
# alliris recognition from OSIRISv4.1 using both DSMI and FCE quality measures

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
