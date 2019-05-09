#!/bin/bash

################################GENERATING FILES################################################################# 
#Generating files with all the files that has a DSMI value higher than the computed threshold = 0.75897357 (0.75)

# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_distortions_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_distortions_dsmi.txt 0.51

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_distortions_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_distortions_dsmi.txt 0.75

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_distortions_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_distortions_dsmi.txt 0.83

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_distortions_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_distortions_dsmi.txt 0.69

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

################################FILTERING AT LEAST TWO IMAGES FROM SUBJECT ##################################################
# Warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/ warsaw_test_all_dsmi.txt warsaw

# MICHE
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/ miche_test_all_dsmi.txt miche

# UBIRISv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ ubirisv1_test_all_dsmi.txt ubirisv1_dsmi

# UBIRISv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ ubirisv2_test_all_dsmi.txt ubirisv2


##################################################################################################################

################################GENERATING MATCHING FILES#########################################################
#Generating files with all the files that has a DSMI value higher than the computed threshold in order
# to perform matching

# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/Inter/warsaw_matching_test_all_dsmi_filtered.txt

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/Inter/miche_matching_test_all_dsmi_filtered.txt

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/Inter/ubirisv1_matching_test_all_dsmi_filtered.txt

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/Inter/ubirisv2_matching_test_all_dsmi_filtered.txt

##################################################################################################################