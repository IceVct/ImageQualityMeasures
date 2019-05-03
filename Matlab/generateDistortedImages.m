clc
close all;

folder = '/home/vavieira/UnB/TCC/IrisDatabases/';

distortDatabaseImages(folder, 'SelectedSubjects/', 'MICHE/', 'miche_test.txt', 'miche_test_all_distortions.txt');
distortDatabaseImages(folder, '', 'UBIRISv1/', 'ubirisv1_test.txt', 'ubirisv1_test_all_distortions.txt');
distortDatabaseImages(folder, '', 'UBIRISv2/', 'ubirisv2_test.txt', 'ubirisv2_test_all_distortions.txt');
distortDatabaseImages(folder, '', 'Warsaw-BioBase-Smartphone-Iris-v1.0/', 'warsaw_test.txt', 'warsaw_test_all_distortions.txt');
