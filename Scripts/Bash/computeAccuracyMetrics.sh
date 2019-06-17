#!/bin/bash

# Script for running accuracy metrics for all databases
echo "---------------------------------------------------"
echo "MICHE"

echo "Inter"
echo "NoDistortionFiles"
python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ MICHE/NoDistortionFiles/Inter/ inter_labels inter_dsmi_labels inter_fce_labels inter_dsmi_fce_labels result_matching_test result_matching_test_dsmi result_matching_test_fce result_matching_test_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ miche_inter_nodistortion False

echo "DistortionFiles"
python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ MICHE/DistortionFiles/Inter/ inter_all_labels inter_all_dsmi_labels inter_all_fce_labels inter_all_dsmi_fce_labels result_matching_test_all result_matching_test_all_dsmi result_matching_test_all_fce result_matching_test_all_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ miche_inter_distortion False

# echo "Intra"
# echo "NoDistortionFiles"
# python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ MICHE/NoDistortionFiles/Intra/ intra_labels intra_dsmi_labels intra_fce_labels intra_dsmi_fce_labels result_intra_matching_test result_intra_matching_test_dsmi result_intra_matching_test_fce result_intra_matching_test_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ miche_intra_nodistortion False

# echo "DistortionFiles"
# python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ MICHE/DistortionFiles/Intra/ intra_all_labels intra_all_dsmi_labels intra_all_fce_labels intra_all_dsmi_fce_labels result_intra_matching_test_all result_intra_matching_test_all_dsmi result_intra_matching_test_all_fce result_intra_matching_test_all_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ miche_intra_distortion False

echo "---------------------------------------------------"

echo "Warsaw"

echo "Inter"
echo "NoDistortionFiles"
python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/Inter/ inter_labels inter_dsmi_labels inter_fce_labels inter_dsmi_fce_labels result_matching_test result_matching_test_dsmi result_matching_test_fce result_matching_test_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ warsaw_inter_nodistortion False

echo "DistortionFiles"
python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/Inter/ inter_all_labels inter_all_dsmi_labels inter_all_fce_labels inter_all_dsmi_fce_labels result_matching_test_all result_matching_test_all_dsmi result_matching_test_all_fce result_matching_test_all_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ warsaw_inter_distortion False

# echo "Intra"
# echo "NoDistortionFiles"
# python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ Warsaw-BioBase-Smartphone-Iris-v1.0/NoDistortionFiles/Intra/ intra_labels intra_dsmi_labels intra_fce_labels intra_dsmi_fce_labels result_intra_matching_test result_intra_matching_test_dsmi result_intra_matching_test_fce result_intra_matching_test_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ warsaw_intra_nodistortion False

# echo "DistortionFiles"
# python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ Warsaw-BioBase-Smartphone-Iris-v1.0/DistortionFiles/Intra/ intra_all_labels intra_all_dsmi_labels intra_all_fce_labels intra_all_dsmi_fce_labels result_intra_matching_test_all result_intra_matching_test_all_dsmi result_intra_matching_test_all_fce result_intra_matching_test_all_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ warsaw_intra_distortion False

echo "---------------------------------------------------"

echo "UBIRISv1"

echo "Inter"
echo "NoDistortionFiles"
python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ UBIRISv1/NoDistortionFiles/Inter/ inter_labels inter_dsmi_labels inter_fce_labels inter_dsmi_fce_labels result_matching_test result_matching_test_dsmi result_matching_test_fce result_matching_test_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ ubirisv1_inter_nodistortion False

echo "DistortionFiles"
python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ UBIRISv1/DistortionFiles/Inter/ inter_all_labels inter_all_dsmi_labels inter_all_fce_labels inter_all_dsmi_fce_labels result_matching_test_all result_matching_test_all_dsmi result_matching_test_all_fce result_matching_test_all_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ ubirisv1_inter_distortion False

# echo "Intra"
# echo "NoDistortionFiles"
# python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ UBIRISv1/NoDistortionFiles/Intra/ intra_labels intra_dsmi_labels intra_fce_labels intra_dsmi_fce_labels result_intra_matching_test result_intra_matching_test_dsmi result_intra_matching_test_fce result_intra_matching_test_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ ubirisv1_intra_nodistortion False

# echo "DistortionFiles"
# python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ UBIRISv1/DistortionFiles/Intra/ intra_all_labels intra_all_dsmi_labels intra_all_fce_labels intra_all_dsmi_fce_labels result_intra_matching_test_all result_intra_matching_test_all_dsmi result_intra_matching_test_all_fce result_intra_matching_test_all_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ ubirisv1_intra_distortion False

echo "---------------------------------------------------"

echo "UBIRISv2"

echo "Inter"
echo "NoDistortionFiles"
python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ UBIRISv2/NoDistortionFiles/Inter/ inter_labels inter_dsmi_labels inter_fce_labels inter_dsmi_fce_labels result_matching_test result_matching_test_dsmi result_matching_test_fce result_matching_test_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ ubirisv2_inter_nodistortion False

echo "DistortionFiles"
python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ UBIRISv2/DistortionFiles/Inter/ inter_all_labels inter_all_dsmi_labels inter_all_fce_labels inter_all_dsmi_fce_labels result_matching_test_all result_matching_test_all_dsmi result_matching_test_all_fce result_matching_test_all_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ ubirisv2_inter_distortion False

# echo "Intra"
# echo "NoDistortionFiles"
# python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ UBIRISv2/NoDistortionFiles/Intra/ intra_labels intra_dsmi_labels intra_fce_labels intra_dsmi_fce_labels result_intra_matching_test result_intra_matching_test_dsmi result_intra_matching_test_fce result_intra_matching_test_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ ubirisv2_intra_nodistortion False

# echo "DistortionFiles"
# python ../Python/compute_accuracy_metrics.py /home/vavieira/UnB/TCC/IrisDatabases/ UBIRISv2/DistortionFiles/Intra/ intra_all_labels intra_all_dsmi_labels intra_all_fce_labels intra_all_dsmi_fce_labels result_intra_matching_test_all result_intra_matching_test_all_dsmi result_intra_matching_test_all_fce result_intra_matching_test_all_dsmi_fce /home/vavieira/UnB/TCC/Monografia/img/Resultados/ ubirisv2_intra_distortion False