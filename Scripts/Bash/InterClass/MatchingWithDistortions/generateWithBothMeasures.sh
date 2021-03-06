#!/bin/bash

################################GENERATING FILES################################################################# 
echo "Comparing DSMI and FCE files in order to generate the selected subject files"
# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/ warsaw_test_all_dsmi.txt warsaw_test_all_fce.txt warsaw_test_all_dsmi_fce.txt warsaw

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/ miche_test_all_dsmi.txt miche_test_all_fce.txt miche_test_all_dsmi_fce.txt

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ ubirisv1_test_all_dsmi.txt ubirisv1_test_all_fce.txt ubirisv1_test_all_dsmi_fce.txt

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_dsmi_fce.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ ubirisv2_test_all_dsmi.txt ubirisv2_test_all_fce.txt ubirisv2_test_all_dsmi_fce.txt

##################################################################################################################

################################FILTERING AT LEAST TWO IMAGES FROM SUBJECT ##################################################
echo "Filtering images that only has subjects with at least 2 images"
# Warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/ warsaw_test_all_dsmi_fce.txt warsaw

# MICHE
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/ miche_test_all_dsmi_fce.txt miche

# UBIRISv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ ubirisv1_test_all_dsmi_fce.txt ubirisv1

# UBIRISv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ ubirisv2_test_all_dsmi_fce.txt ubirisv2


##################################################################################################################

################################GENERATING MATCHING FILES#########################################################
#Generating files with all the files that has a fce value higher than the computed threshold in order
# to perform matching
echo "Generating matching files"
# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_all_dsmi_fce_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/Inter/warsaw_matching_test_all_dsmi_fce.txt

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_all_dsmi_fce_filtered.txt ~/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/Inter/miche_matching_test_all_dsmi_fce.txt

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_all_dsmi_fce_filtered.txt ~/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/Inter/ubirisv1_matching_test_all_dsmi_fce.txt

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_all_dsmi_fce_filtered.txt ~/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/Inter/ubirisv2_matching_test_all_dsmi_fce.txt

##################################################################################################################
