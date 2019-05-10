#!/bin/bash

################################GENERATING FILES################################################################# 
#Generating files with all the files that has a FCE value higher than the computed threshold = 0.7158462545478076 (0.71)
echo "Generating files"
# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_distortions_fce_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_distortions_fce.txt 0.9

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py ~/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_distortions_fce_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_distortions_fce.txt 0.54

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py ~/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_distortions_fce_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_distortions_fce.txt 0.85

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py ~/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_distortions_fce_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_distortions_fce.txt 0.54

##################################################################################################################

################################COMBINING ORIGINAL IMAGES WITH DISTORTIONS########################################
echo "Combining original images with distortions"
#warsaw
cat /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test_fce.txt > /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_all_fce.txt
cat /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_distortions_fce.txt >> /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_all_fce.txt

# miche
cat /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test_fce.txt > /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_all_fce.txt
cat /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_distortions_fce.txt >> /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_all_fce.txt

# ubirisv1
cat /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test_fce.txt > /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_all_fce.txt
cat /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_distortions_fce.txt >> /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_all_fce.txt

# ubirisv2
cat /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test_fce.txt > /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_all_fce.txt
cat /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_distortions_fce.txt >> /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_all_fce.txt

##################################################################################################################

################################FILTERING AT LEAST TWO IMAGES FROM SUBJECT ##################################################
echo "Filtering images that only has subjects with at least 2 images"
# Warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/ warsaw_test_all_fce.txt warsaw

# MICHE
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/ miche_test_all_fce.txt miche

# UBIRISv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ ubirisv1_test_all_fce.txt ubirisv1

# UBIRISv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ ubirisv2_test_all_fce.txt ubirisv2


##################################################################################################################

################################GENERATING MATCHING FILES#########################################################
#Generating files with all the files that has a fce value higher than the computed threshold in order
# to perform matching
echo "Generating matching files"
# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_all_fce_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/Inter/warsaw_matching_test_all_fce.txt

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_all_fce_filtered.txt ~/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/Inter/miche_matching_test_all_fce.txt

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_all_fce_filtered.txt ~/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/Inter/ubirisv1_matching_test_all_fce.txt

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_all_fce_filtered.txt ~/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/Inter/ubirisv2_matching_test_all_fce.txt

##################################################################################################################