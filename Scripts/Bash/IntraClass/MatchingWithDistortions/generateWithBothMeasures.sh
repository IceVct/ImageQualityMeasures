#!/bin/bash

################################GENERATING MATCHING FILES#########################################################
#Generating files with all the files that has a fce value higher than the computed threshold in order
# to perform matching
echo "Generating matching files"
# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_all_dsmi_fce.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_intra_matching_test_all_dsmi_fce.txt warsaw

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py ~/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_all_dsmi_fce.txt ~/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_intra_matching_test_all_dsmi_fce.txt miche

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_all_dsmi_fce.txt ~/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_intra_matching_test_all_dsmi_fce.txt ubirisv1

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_all_dsmi_fce.txt ~/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_intra_matching_test_all_dsmi_fce.txt ubirisv2

##################################################################################################################