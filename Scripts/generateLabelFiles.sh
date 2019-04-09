#!/bin/bash

# Script for generating files with the correct labels for each matching comparation
# 0 for ACCEPT
# 1 for REJECT

# MICHE
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/ miche_matching_test.txt miche_labels.txt MICHE
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/ miche_matching_test_dsmi.txt miche_dsmi_labels.txt MICHE
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/ miche_matching_test_fce.txt miche_fce_labels.txt MICHE
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/ miche_matching_test_dsmi_fce.txt miche_dsmi_fce_labels.txt MICHE

# Warsaw
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/ warsaw_matching_test.txt warsaw_labels.txt Warsaw
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/ warsaw_matching_test_dsmi.txt warsaw_dsmi_labels.txt Warsaw
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/ warsaw_matching_test_fce.txt warsaw_fce_labels.txt Warsaw
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/ warsaw_matching_test_dsmi_fce.txt warsaw_dsmi_fce_labels.txt Warsaw

# UBIRISv1
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ ubirisv1_matching_test.txt ubirisv1_labels.txt UBIRISv1
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ ubirisv1_matching_test_dsmi.txt ubirisv1_dsmi_labels.txt UBIRISv1
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ ubirisv1_matching_test_fce.txt ubirisv1_fce_labels.txt UBIRISv1_FCE
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ ubirisv1_matching_test_dsmi_fce.txt ubirisv1_dsmi_fce_labels.txt UBIRISv1_FCE

# UBIRISv2
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ ubirisv2_matching_test.txt ubirisv2_labels.txt UBIRISv2
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ ubirisv2_matching_test_dsmi.txt ubirisv2_dsmi_labels.txt UBIRISv2
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ ubirisv2_matching_test_fce.txt ubirisv2_fce_labels.txt UBIRISv2
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ ubirisv2_matching_test_dsmi_fce.txt ubirisv2_dsmi_fce_labels.txt UBIRISv2