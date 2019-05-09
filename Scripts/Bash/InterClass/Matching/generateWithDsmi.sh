#!/bin/bash

################################GENERATING FILES################################################################# 
#Generating files with all the files that has a DSMI value higher than the computed threshold = 0.75897357 (0.75)

# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test_dsmi.txt 0.51

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test_dsmi.txt 0.75

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test_dsmi.txt 0.83

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compare_file_measures.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test_dsmi.txt 0.69

##################################################################################################################

################################GENERATING MATCHING FILES#########################################################
#Generating files with all the files that has a DSMI value higher than the computed threshold in order
# to perform matching

# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test_dsmi.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_matching_test_dsmi.txt

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test_dsmi.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_matching_test_dsmi.txt

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test_dsmi.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_matching_test_dsmi.txt

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test_dsmi.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_matching_test_dsmi.txt

##################################################################################################################