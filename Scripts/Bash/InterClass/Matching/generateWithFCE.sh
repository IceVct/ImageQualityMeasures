#!/bin/bash

################################GENERATING FILES################################################################# 

# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test_fce_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test_fce.txt 0.9

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test_fce_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test_fce.txt 0.54

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test_fce_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test_fce.txt 0.85

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test_fce_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test_fce.txt 0.54

##################################################################################################################

################################GENERATING MATCHING FILES#########################################################
#Generating files with all the files that has a fce value higher than the computed threshold in order
# to perform matching

# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test_fce.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_matching_test_fce.txt

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test_fce.txt ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_matching_test_fce.txt

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test_fce.txt ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_matching_test_fce.txt

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test_fce.txt ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_matching_test_fce.txt

##################################################################################################################