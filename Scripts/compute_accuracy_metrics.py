# roc curve and auc
from sklearn.datasets import make_classification
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import roc_curve
from sklearn.metrics import roc_auc_score
from matplotlib import pyplot
import numpy as np
import math as mth
import sys

# Script for performing ROC and AUC, EER and d' for a given database

def compute_daugman_index(hamming_distance_values, threshold):
    matching = [hd <= threshold for hd in hamming_distance_values]
    non_matching = [hd > threshold for hd in hamming_distance_values]

    mean_matching = np.mean(matching)
    mean_non_matching = np.mean(non_matching)
    
    std_dev_matching = np.var(matching)
    std_dev_non_matching = np.var(non_matching)

    return abs(mean_matching - mean_non_matching) / mth.sqrt(0.5 * (std_dev_matching + std_dev_non_matching))


def main():

    input_folder = sys.argv[1]
    database = sys.argv[2]
    should_plot = sys.argv[3].capitalize() == 'True'

    database_lower = database.lower()
    if 'Warsaw' in database:
        database_lower = 'warsaw'

    print 'PROCESSING DATABASE %s' % database


    # # Reading the label files
    with open("%s%s/%s_labels.txt" % (input_folder, database, database_lower), "r") as f:
        labels = f.read().splitlines()
    labels = [int(line) for line in labels]

    with open("%s%s/%s_dsmi_labels.txt" % (input_folder, database, database_lower), "r") as f:
        dsmi_labels = f.read().splitlines()
    dsmi_labels = [int(line) for line in dsmi_labels]

    with open("%s%s/%s_fce_labels.txt" % (input_folder, database, database_lower), "r") as f:
        fce_labels = f.read().splitlines()
    fce_labels = [int(line) for line in fce_labels]

    with open("%s%s/%s_dsmi_fce_labels.txt" % (input_folder, database, database_lower), "r") as f:
        both_labels = f.read().splitlines()
    both_labels = [int(line) for line in both_labels]

    # Reading the fractional Hamming Distances files
    with open("%s%s/%s_result_matching_test.txt" % (input_folder, database, database_lower), "r") as f:
        hd_results_file = f.read().splitlines()

    hd_results = [float(line.split(' ')[-1]) for line in hd_results_file]

    with open("%s%s/%s_result_matching_test_dsmi.txt" % (input_folder, database, database_lower), "r") as f:
        dsmi_hd_results_file = f.read().splitlines()

    dsmi_hd_results = [float(line.split(' ')[-1]) for line in dsmi_hd_results_file]

    with open("%s%s/%s_result_matching_test_fce.txt" % (input_folder, database, database_lower), "r") as f:
        fce_hd_results_file = f.read().splitlines()

    fce_hd_results = [float(line.split(' ')[-1]) for line in fce_hd_results_file]

    with open("%s%s/%s_result_matching_test_dsmi_fce.txt" % (input_folder, database, database_lower), "r") as f:
        both_hd_results_file = f.read().splitlines()

    both_hd_results = [float(line.split(' ')[-1]) for line in both_hd_results_file]

    # Computing the AUC for each set of test
    auc = roc_auc_score(labels, hd_results)
    dsmi_auc = roc_auc_score(dsmi_labels, dsmi_hd_results)
    fce_auc = roc_auc_score(fce_labels, fce_hd_results)
    both_auc = roc_auc_score(both_labels, both_hd_results)

    print('AUC: %.3f' % auc)
    print('DSMI AUC: %.3f' % dsmi_auc)
    print('FCE AUC: %.3f' % fce_auc)
    print('BOTH AUC: %.3f' % both_auc)


    # # generate 2 class dataset
    # X, y = make_classification(n_samples=1000, n_classes=2, weights=[1,1], random_state=1)
    # # split into train/test sets
    # trainX, testX, trainy, testy = train_test_split(X, y, test_size=0.5, random_state=2)
    # print type(testy[0])
    # print testy


    # Computing ROC for each set of test
    fpr, tpr, thresholds = roc_curve(labels, hd_results)
    dsmi_fpr, dsmi_tpr, dsmi_thresholds = roc_curve(dsmi_labels, dsmi_hd_results)
    fce_fpr, fce_tpr, fce_thresholds = roc_curve(fce_labels, fce_hd_results)
    both_fpr, both_tpr, both_thresholds = roc_curve(both_labels, both_hd_results)

    # Computing FNR in order to compute EER
    fnr = 1 - tpr
    eer_threshold = thresholds[np.nanargmin(np.absolute((fnr - fpr)))]
    print 'all ', eer_threshold
    eer = fpr[np.nanargmin(np.absolute((fnr - fpr)))]

    dsmi_fnr = 1 - dsmi_tpr
    dsmi_eer_threshold = dsmi_thresholds[np.nanargmin(np.absolute((dsmi_fnr - dsmi_fpr)))]
    print 'dsmi ', dsmi_eer_threshold
    dsmi_eer = dsmi_fpr[np.nanargmin(np.absolute((dsmi_fnr - dsmi_fpr)))]

    fce_fnr = 1 - fce_tpr
    fce_eer_threshold = fce_thresholds[np.nanargmin(np.absolute((fce_fnr - fce_fpr)))]
    print 'fce ', fce_eer_threshold
    fce_eer = fce_fpr[np.nanargmin(np.absolute((fce_fnr - fce_fpr)))]

    both_fnr = 1 - both_tpr
    both_eer_threshold = both_thresholds[np.nanargmin(np.absolute((both_fnr - both_fpr)))]
    print 'both ', both_eer_threshold
    both_eer = both_fpr[np.nanargmin(np.absolute((both_fnr - both_fpr)))]

    # Computing the daugman index
    print 'All d\' = ', compute_daugman_index(hd_results, eer_threshold)
    print 'DSMI d\' = ', compute_daugman_index(dsmi_hd_results, dsmi_eer_threshold)
    print 'FCE d\' = ', compute_daugman_index(fce_hd_results, fce_eer_threshold)
    print 'Both d\' = ', compute_daugman_index(both_hd_results, both_eer_threshold)

    if should_plot:
        pyplot.plot(thresholds, fnr, marker=',')
        pyplot.plot(thresholds, fpr, marker=',')
        pyplot.plot(eer_threshold, eer, marker='o', color='r')
        pyplot.title('All')
        pyplot.legend(['FNR', 'FPR', 'EER=%.3f' % eer], loc='center right')
        pyplot.ylabel('Error Rate')
        pyplot.xlabel('Thresholds')
        pyplot.show()

        pyplot.plot(dsmi_thresholds, dsmi_fnr, marker=',')
        pyplot.plot(dsmi_thresholds, dsmi_fpr, marker=',')
        pyplot.plot(dsmi_eer_threshold, dsmi_eer, marker='o', color='r')
        pyplot.title('DSMI')
        pyplot.legend(['FNR', 'FPR', 'EER=%.3f' % dsmi_eer], loc='center right')
        pyplot.ylabel('Error Rate')
        pyplot.xlabel('Thresholds')
        pyplot.show()

        pyplot.plot(fce_thresholds, fce_fnr, marker=',')
        pyplot.plot(fce_thresholds, fce_fpr, marker=',')
        pyplot.plot(fce_eer_threshold, fce_eer, marker='o', color='r')
        pyplot.title('FCE')
        pyplot.legend(['FNR', 'FPR', 'EER=%.3f' % fce_eer], loc='center right')
        pyplot.ylabel('Error Rate')
        pyplot.xlabel('Thresholds')
        pyplot.show()

        pyplot.plot(both_thresholds, both_fnr, marker=',')
        pyplot.plot(both_thresholds, both_fpr, marker=',')
        pyplot.plot(both_eer_threshold, both_eer, marker='o', color='r')
        pyplot.title('Both')
        pyplot.legend(['FNR', 'FPR', 'EER=%.3f' % both_eer], loc='center right')
        pyplot.ylabel('Error Rate')
        pyplot.xlabel('Thresholds')
        pyplot.show()

        # Plotting the ROC curves
        pyplot.plot(fpr, tpr, marker=',')
        pyplot.plot(dsmi_fpr, dsmi_tpr, marker=',')
        pyplot.plot(fce_fpr, fce_tpr, marker=',')
        pyplot.plot(both_fpr, both_tpr, marker=',')

        pyplot.legend(['Todas,AUC=%.3f' % auc, 'DSMI, AUC=%.3F' % dsmi_auc, 'FCE,AUC=%.3f' % fce_auc, 'Ambas,AUC=%.3f' % both_auc], loc='lower right')
        pyplot.ylabel('True Positive Rate')
        pyplot.xlabel('False Positive Rate')
        pyplot.show()


if __name__ == "__main__":
    main()