#!/bin/bash

# Script for running all necessary commands in order to perform 
# iris recognition from OSIRISv4.1 using all the images from the database with no filter

################################COMBINING ORIGINAL IMAGES WITH DISTORTIONS########################################
echo "Combining files"
#warsaw
cat /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test.txt > /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_all.txt
cat /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_distortions.txt >> /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_all.txt

# miche
cat /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test.txt > /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_all.txt
cat /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_distortions.txt >> /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_all.txt

# ubirisv1
cat /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test.txt > /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_all.txt
cat /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_distortions.txt >> /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_all.txt

# ubirisv2
cat /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test.txt > /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_all.txt
cat /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_distortions.txt >> /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_all.txt

##################################################################################################################

################################GENERATING MATCHING FILES#########################################################
echo "Generating matching files"
# warsaw
python ../../Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_all.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_intra_test_matching_all.txt

# miche
python ../../Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_all.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_intra_test_matching_all.txt

# ubirisv1
python ../../Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_all.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_intra_test_matching_all.txt

# ubirisv2
python ../../Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_all.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_intra_test_matching_all.txt

##################################################################################################################

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