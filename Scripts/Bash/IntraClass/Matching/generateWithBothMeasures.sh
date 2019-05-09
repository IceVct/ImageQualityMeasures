#!/bin/bash

################################GENERATING MATCHING FILES#########################################################
#Generating files with all the files that has a fce value higher than the computed threshold in order
# to perform matching

# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test_dsmi_fce_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/Intra/warsaw_intra_matching_test_dsmi_fce_filtered.txt warsaw

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test_dsmi_fce_filtered.txt ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/Intra/miche_intra_matching_test_dsmi_fce_filtered.txt miche

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test_dsmi_fce_filtered.txt ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/Intra/ubirisv1_intra_matching_test_dsmi_fce_filtered.txt ubirisv1

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test_dsmi_fce_filtered.txt ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/Intra/ubirisv2_intra_matching_test_dsmi_fce_filtered.txt ubirisv2

##################################################################################################################