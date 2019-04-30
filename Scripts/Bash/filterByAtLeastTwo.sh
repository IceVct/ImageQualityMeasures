#!/bin/bash

# Script that generates files for at least two ocurrences for all databases

# MICHE
python check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/ miche_test_dsmi.txt miche
python check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/ miche_test_fce.txt miche
python check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/MICHE/ miche_test_dsmi_fce.txt miche

# Warsaw
python check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/ warsaw_test_dsmi.txt warsaw
python check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/ warsaw_test_fce.txt warsaw
python check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/Warsaw-BioBase-Smartphone-Iris-v1.0/ warsaw_test_dsmi_fce.txt warsaw

# UBIRISv1
python check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ ubirisv1_test_dsmi.txt ubirisv1_dsmi
python check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ ubirisv1_test_fce.txt ubirisv1
python check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv1/ ubirisv1_test_dsmi_fce.txt ubirisv1

# UBIRISv2
python check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ ubirisv2_test_dsmi.txt ubirisv2
python check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ ubirisv2_test_fce.txt ubirisv2
python check_for_two_ocurrences.py /home/vavieira/UnB/TCC/IrisDatabases/UBIRISv2/ ubirisv2_test_dsmi_fce.txt ubirisv2