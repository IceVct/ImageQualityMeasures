#!/bin/bash

# Script for generating files with the correct labels for each matching comparation
# 0 for ACCEPT
# 1 for REJECT

# MICHE
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/ miche_matching_test_two.txt miche_labels_two.txt MICHE
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/ miche_matching_test_dsmi_two.txt miche_dsmi_labels_two.txt MICHE
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/ miche_matching_test_fce_two.txt miche_fce_labels_two.txt MICHE
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/ miche_matching_test_dsmi_fce_two.txt miche_dsmi_fce_labels_two.txt MICHE

# Warsaw
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/ warsaw_matching_test_two.txt warsaw_labels_two.txt Warsaw
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/ warsaw_matching_test_dsmi_two.txt warsaw_dsmi_labels_two.txt Warsaw
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/ warsaw_matching_test_fce_two.txt warsaw_fce_labels_two.txt Warsaw
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/ warsaw_matching_test_dsmi_fce_two.txt warsaw_dsmi_fce_labels_two.txt Warsaw

# UBIRISv1
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ ubirisv1_matching_test_two.txt ubirisv1_labels_two.txt UBIRISv1
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ ubirisv1_matching_test_dsmi_two.txt ubirisv1_dsmi_labels_two.txt UBIRISv1
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ ubirisv1_matching_test_fce_two.txt ubirisv1_fce_labels_two.txt UBIRISv1_FCE
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ ubirisv1_matching_test_dsmi_fce_two.txt ubirisv1_dsmi_fce_labels_two.txt UBIRISv1_FCE

# UBIRISv2
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ ubirisv2_matching_test_two.txt ubirisv2_labels_two.txt UBIRISv2
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ ubirisv2_matching_test_dsmi_two.txt ubirisv2_dsmi_labels_two.txt UBIRISv2
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ ubirisv2_matching_test_fce_two.txt ubirisv2_fce_labels_two.txt UBIRISv2
python generate_matching_labels_file.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ ubirisv2_matching_test_dsmi_fce_two.txt ubirisv2_dsmi_fce_labels_two.txt UBIRISv2