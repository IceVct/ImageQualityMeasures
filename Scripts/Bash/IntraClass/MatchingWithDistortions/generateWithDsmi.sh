#!/bin/bash

################################GENERATING MATCHING FILES#########################################################
#Generating files with all the files that has a DSMI value higher than the computed threshold in order
# to perform matching

# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_intra_matching_test_all_dsmi_filtered.txt warsaw

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_intra_matching_test_all_dsmi_filtered.txt miche

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_intra_matching_test_all_dsmi_filtered.txt ubirisv1

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_intra_matching_test_all_dsmi_filtered.txt ubirisv2

##################################################################################################################