#!/bin/bash

################################GENERATING MATCHING FILES#########################################################
#Generating files with all the files that has a DSMI value higher than the computed threshold in order
# to perform matching

# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/warsaw_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/Intra/warsaw_intra_matching_test_all_dsmi.txt warsaw

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/miche_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/Intra/miche_intra_matching_test_all_dsmi.txt miche

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/ubirisv1_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/Intra/ubirisv1_intra_matching_test_all_dsmi.txt ubirisv1_dsmi

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_intraclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/ubirisv2_test_all_dsmi_filtered.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/Intra/ubirisv2_intra_matching_test_all_dsmi.txt ubirisv2

##################################################################################################################