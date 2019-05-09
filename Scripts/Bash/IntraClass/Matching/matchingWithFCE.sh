#!/bin/bash

# Script for running all necessary commands in order to perform 
# alliris recognition from OSIRISv4.1 using the FCE quality measure

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