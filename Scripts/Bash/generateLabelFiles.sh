#!/bin/bash

# Script for generating files with the correct labels for each matching comparation
# 0 for ACCEPT
# 1 for REJECT

echo "MICHE"
# MICHE
echo "Inter"
# Inter
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/Inter/ miche_matching_test.txt miche_inter_labels.txt MICHE
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/Inter/ miche_matching_test_dsmi.txt miche_inter_dsmi_labels.txt MICHE
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/Inter/ miche_matching_test_fce.txt miche_inter_fce_labels.txt MICHE
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/Inter/ miche_matching_test_dsmi_fce.txt miche_inter_dsmi_fce_labels.txt MICHE

python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/Inter/ miche_matching_test_all.txt miche_inter_all_labels.txt MICHE
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/Inter/ miche_matching_test_all_dsmi.txt miche_inter_all_dsmi_labels.txt MICHE
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/Inter/ miche_matching_test_all_fce.txt miche_inter_all_fce_labels.txt MICHE
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/Inter/ miche_matching_test_all_dsmi_fce.txt miche_inter_all_dsmi_fce_labels.txt MICHE

echo "Intra"
#Intra
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/Intra/ miche_intra_matching_test.txt miche_intra_labels.txt MICHE
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/Intra/ miche_intra_matching_test_dsmi.txt miche_intra_dsmi_labels.txt MICHE
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/Intra/ miche_intra_matching_test_fce.txt miche_intra_fce_labels.txt MICHE
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/NoDistortionFiles/Intra/ miche_intra_matching_test_dsmi_fce.txt miche_intra_dsmi_fce_labels.txt MICHE

python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/Intra/ miche_intra_matching_test_all.txt miche_intra_all_labels.txt MICHE
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/Intra/ miche_intra_matching_test_all_dsmi.txt miche_intra_all_dsmi_labels.txt MICHE
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/Intra/ miche_intra_matching_test_all_fce.txt miche_intra_all_fce_labels.txt MICHE
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/DistortionFiles/Intra/ miche_intra_matching_test_all_dsmi_fce.txt miche_intra_all_dsmi_fce_labels.txt MICHE

echo "Warsaw"
# Warsaw
echo "Inter"
# Inter
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/Inter/ warsaw_matching_test.txt warsaw_inter_labels.txt Warsaw
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/Inter/ warsaw_matching_test_dsmi.txt warsaw_inter_dsmi_labels.txt Warsaw
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/Inter/ warsaw_matching_test_fce.txt warsaw_inter_fce_labels.txt Warsaw
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/Inter/ warsaw_matching_test_dsmi_fce.txt warsaw_inter_dsmi_fce_labels.txt Warsaw

python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/Inter/ warsaw_matching_test_all.txt warsaw_inter_all_labels.txt Warsaw
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/Inter/ warsaw_matching_test_all_dsmi.txt warsaw_inter_all_dsmi_labels.txt Warsaw
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/Inter/ warsaw_matching_test_all_fce.txt warsaw_inter_all_fce_labels.txt Warsaw
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/Inter/ warsaw_matching_test_all_dsmi_fce.txt warsaw_inter_all_dsmi_fce_labels.txt Warsaw

echo "Intra"
#Intra
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/Intra/ warsaw_intra_matching_test.txt warsaw_intra_labels.txt Warsaw
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/Intra/ warsaw_intra_matching_test_dsmi.txt warsaw_intra_dsmi_labels.txt Warsaw
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/Intra/ warsaw_intra_matching_test_fce.txt warsaw_intra_fce_labels.txt Warsaw
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/Intra/ warsaw_intra_matching_test_dsmi_fce.txt warsaw_intra_dsmi_fce_labels.txt Warsaw

python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/Intra/ warsaw_intra_matching_test_all.txt warsaw_intra_all_labels.txt Warsaw
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/Intra/ warsaw_intra_matching_test_all_dsmi.txt warsaw_intra_all_dsmi_labels.txt Warsaw
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/Intra/ warsaw_intra_matching_test_all_fce.txt warsaw_intra_all_fce_labels.txt Warsaw
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/Intra/ warsaw_intra_matching_test_all_dsmi_fce.txt warsaw_intra_all_dsmi_fce_labels.txt Warsaw


echo "UBIRISv1"
# UBIRISv1
echo "Inter"
# Inter
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/Inter/ ubirisv1_matching_test.txt ubirisv1_inter_labels.txt UBIRISv1
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/Inter/ ubirisv1_matching_test_dsmi.txt ubirisv1_inter_dsmi_labels.txt UBIRISv1
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/Inter/ ubirisv1_matching_test_fce.txt ubirisv1_inter_fce_labels.txt UBIRISv1
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/Inter/ ubirisv1_matching_test_dsmi_fce.txt ubirisv1_inter_dsmi_fce_labels.txt UBIRISv1

python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/Inter/ ubirisv1_matching_test_all.txt ubirisv1_inter_all_labels.txt UBIRISv1
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/Inter/ ubirisv1_matching_test_all_dsmi.txt ubirisv1_inter_all_dsmi_labels.txt UBIRISv1
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/Inter/ ubirisv1_matching_test_all_fce.txt ubirisv1_inter_all_fce_labels.txt UBIRISv1
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/Inter/ ubirisv1_matching_test_all_dsmi_fce.txt ubirisv1_inter_all_dsmi_fce_labels.txt UBIRISv1

echo "Intra"
#Intra
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/Intra/ ubirisv1_intra_matching_test.txt ubirisv1_intra_labels.txt UBIRISv1
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/Intra/ ubirisv1_intra_matching_test_dsmi.txt ubirisv1_intra_dsmi_labels.txt UBIRISv1
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/Intra/ ubirisv1_intra_matching_test_fce.txt ubirisv1_intra_fce_labels.txt UBIRISv1
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/NoDistortionFiles/Intra/ ubirisv1_intra_matching_test_dsmi_fce.txt ubirisv1_intra_dsmi_fce_labels.txt UBIRISv1

python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/Intra/ ubirisv1_intra_matching_test_all.txt ubirisv1_intra_all_labels.txt UBIRISv1
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/Intra/ ubirisv1_intra_matching_test_all_dsmi.txt ubirisv1_intra_all_dsmi_labels.txt UBIRISv1
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/Intra/ ubirisv1_intra_matching_test_all_fce.txt ubirisv1_intra_all_fce_labels.txt UBIRISv1
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/DistortionFiles/Intra/ ubirisv1_intra_matching_test_all_dsmi_fce.txt ubirisv1_intra_all_dsmi_fce_labels.txt UBIRISv1


echo "UBIRISv2"
# UBIRISv2
echo "Inter"
# Inter
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/Inter/ ubirisv2_matching_test.txt ubirisv2_inter_labels.txt UBIRISv2
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/Inter/ ubirisv2_matching_test_dsmi.txt ubirisv2_inter_dsmi_labels.txt UBIRISv2
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/Inter/ ubirisv2_matching_test_fce.txt ubirisv2_inter_fce_labels.txt UBIRISv2
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/Inter/ ubirisv2_matching_test_dsmi_fce.txt ubirisv2_inter_dsmi_fce_labels.txt UBIRISv2

python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/Inter/ ubirisv2_matching_test_all.txt ubirisv2_inter_all_labels.txt UBIRISv2
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/Inter/ ubirisv2_matching_test_all_dsmi.txt ubirisv2_inter_all_dsmi_labels.txt UBIRISv2
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/Inter/ ubirisv2_matching_test_all_fce.txt ubirisv2_inter_all_fce_labels.txt UBIRISv2
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/Inter/ ubirisv2_matching_test_all_dsmi_fce.txt ubirisv2_inter_all_dsmi_fce_labels.txt UBIRISv2

echo "Intra"
#Intra
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/Intra/ ubirisv2_intra_matching_test.txt ubirisv2_intra_labels.txt UBIRISv2
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/Intra/ ubirisv2_intra_matching_test_dsmi.txt ubirisv2_intra_dsmi_labels.txt UBIRISv2
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/Intra/ ubirisv2_intra_matching_test_fce.txt ubirisv2_intra_fce_labels.txt UBIRISv2
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/NoDistortionFiles/Intra/ ubirisv2_intra_matching_test_dsmi_fce.txt ubirisv2_intra_dsmi_fce_labels.txt UBIRISv2

python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/Intra/ ubirisv2_intra_matching_test_all.txt ubirisv2_intra_all_labels.txt UBIRISv2
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/Intra/ ubirisv2_intra_matching_test_all_dsmi.txt ubirisv2_intra_all_dsmi_labels.txt UBIRISv2
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/Intra/ ubirisv2_intra_matching_test_all_fce.txt ubirisv2_intra_all_fce_labels.txt UBIRISv2
python ../Python/generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/DistortionFiles/Intra/ ubirisv2_intra_matching_test_all_dsmi_fce.txt ubirisv2_intra_all_dsmi_fce_labels.txt UBIRISv2
