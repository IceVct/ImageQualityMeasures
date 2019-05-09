#!/bin/bash
# python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compute_dsmi_measures.py ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_train.txt ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_train_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/MICHE/SelectedSubjects/

# python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compute_dsmi_measures.py ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_train.txt ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_train_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/

# python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compute_dsmi_measures.py ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_train.txt ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_train_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/

# python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/compute_dsmi_measures.py ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_train.txt ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_train_dsmi_stats.txt /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/

cat ~/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/miche_train_dsmi_stats.txt  | grep "Mean" > ~/UnB/TCC/IrisDatabases/train_dsmi.txt
cat ~/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/ubirisv1_train_dsmi_stats.txt | grep "Mean" >> ~/UnB/TCC/IrisDatabases/train_dsmi.txt
cat ~/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/ubirisv2_train_dsmi_stats.txt | grep "Mean" >> ~/UnB/TCC/IrisDatabases/train_dsmi.txt
cat ~/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/warsaw_train_dsmi_stats.txt | grep "Mean" >> ~/UnB/TCC/IrisDatabases/train_dsmi.txt

# python /home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/Scripts/Python/dsmi_threshold.py ~/UnB/TCC/IrisDatabases/train_dsmi.txt