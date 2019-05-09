#!/bin/bash

################################GENERATING FILES################################################################# 
#Generating files with all the files that has DSMI value higher than 0.75 and 
# a FCE value higher than 0.71

# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/ warsaw_test_dsmi.txt warsaw_test_fce.txt warsaw_test_dsmi_fce.txt warsaw

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/ miche_test_dsmi.txt miche_test_fce.txt miche_test_dsmi_fce.txt

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ ubirisv1_test_dsmi.txt ubirisv1_test_fce.txt ubirisv1_test_dsmi_fce.txt

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ ubirisv2_test_dsmi.txt ubirisv2_test_fce.txt ubirisv2_test_dsmi_fce.txt

##################################################################################################################

################################FILTERING AT LEAST TWO IMAGES FROM SUBJECT ##################################################
echo "Filtering images that only has subjects with at least 2 images"
# Warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/ warsaw_test_dsmi_fce.txt warsaw

# MICHE
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/ miche_test_dsmi_fce.txt miche

# UBIRISv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ ubirisv1_test_dsmi_fce.txt ubirisv1

# UBIRISv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ ubirisv2_test_dsmi_fce.txt ubirisv2


##################################################################################################################

################################GENERATING MATCHING FILES#########################################################
#Generating files with all the files that has a fce value higher than the computed threshold in order
# to perform matching

# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test_dsmi_fce_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/Inter/warsaw_matching_test_dsmi_fce.txt

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test_dsmi_fce_filtered.txt ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/Inter/miche_matching_test_dsmi_fce.txt

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test_dsmi_fce_filtered.txt ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/Inter/ubirisv1_matching_test_dsmi_fce.txt

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test_dsmi_fce_filtered.txt ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/Inter/ubirisv2_matching_test_dsmi_fce.txt

##################################################################################################################