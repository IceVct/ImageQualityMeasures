#!/bin/bash

################################GENERATING MATCHING FILES#########################################################="$@"

# warsaw
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_test.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/Inter/warsaw_matching_test.txt

# miche
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_test.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/Inter/miche_matching_test.txt

# ubirisv1
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_test.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/Inter/ubirisv1_matching_test.txt

# ubirisv2
python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/generate_interclass_matching_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_test.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/Inter/ubirisv2_matching_test.txt

##################################################################################################################