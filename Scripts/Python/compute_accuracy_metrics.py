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
# Arguments for running the script:
#   <input_folder> <database/NoDistortionFiles|DistortionFiles/Inter|Intra>
#   <all_label_file> <dsmi_label_file> <fce_label_file> <both_label_file>
#   <all_result_file> <dsmi_result_file> <fce_result_file> <both_result_file>
#   <output_image_folder> <should_plot>

def compute_daugman_index(hamming_distance_values, threshold):
    matching = [hd <= threshold for hd in hamming_distance_values]
    non_matching = [hd > threshold for hd in hamming_distance_values]

    mean_matching = np.mean(matching)
    mean_non_matching = np.mean(non_matching)
    
    std_dev_matching = np.var(matching)
    std_dev_non_matching = np.var(non_matching)

    return abs(mean_matching - mean_non_matching) / mth.sqrt(0.5 * (std_dev_matching + std_dev_non_matching))


def main():

    amount_arguments = len(sys.argv)
    if amount_arguments < 13 and amount_arguments > 13:
        raise ValueError('Invalid amount of arguments! 12 must be passed')

    input_folder = sys.argv[1]
    database = sys.argv[2]
    all_label_file = sys.argv[3]
    dsmi_label_file = sys.argv[4]
    fce_label_file = sys.argv[5]
    both_label_file = sys.argv[6]
    all_matching_result_file = sys.argv[7]
    dsmi_matching_result_file = sys.argv[8]
    fce_matching_result_file = sys.argv[9]
    both_matching_result_file = sys.argv[10]
    output_image_folder = sys.argv[11]
    output_image_file = sys.argv[12]
    should_plot = sys.argv[13].capitalize() == 'True'

    database_lower = database.split('/')[0].lower()
    if 'Warsaw' in database:
        database_lower = 'warsaw'

    print 'PROCESSING DATABASE %s' % database


    # # Reading the label files
    with open("%s%s/%s_%s.txt" % (input_folder, database, database_lower, all_label_file), "r") as f:
        labels = f.read().splitlines()
    labels = [int(line) for line in labels]

    with open("%s%s/%s_%s.txt" % (input_folder, database, database_lower, dsmi_label_file), "r") as f:
        dsmi_labels = f.read().splitlines()
    dsmi_labels = [int(line) for line in dsmi_labels]

    with open("%s%s/%s_%s.txt" % (input_folder, database, database_lower, fce_label_file), "r") as f:
        fce_labels = f.read().splitlines()
    fce_labels = [int(line) for line in fce_labels]

    with open("%s%s/%s_%s.txt" % (input_folder, database, database_lower, both_label_file), "r") as f:
        both_labels = f.read().splitlines()
    both_labels = [int(line) for line in both_labels]

    # Reading the fractional Hamming Distances files
    with open("%s%s/%s_%s.txt" % (input_folder, database, database_lower, all_matching_result_file), "r") as f:
        hd_results_file = f.read().splitlines()

    hd_results = [float(line.split(' ')[-1]) for line in hd_results_file]

    with open("%s%s/%s_%s.txt" % (input_folder, database, database_lower, dsmi_matching_result_file), "r") as f:
        dsmi_hd_results_file = f.read().splitlines()

    dsmi_hd_results = [float(line.split(' ')[-1]) for line in dsmi_hd_results_file]

    with open("%s%s/%s_%s.txt" % (input_folder, database, database_lower, fce_matching_result_file), "r") as f:
        fce_hd_results_file = f.read().splitlines()

    fce_hd_results = [float(line.split(' ')[-1]) for line in fce_hd_results_file]

    with open("%s%s/%s_%s.txt" % (input_folder, database, database_lower, both_matching_result_file), "r") as f:
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
    eer = fpr[np.nanargmin(np.absolute((fnr - fpr)))]
    print 'all EER = ', eer

    dsmi_fnr = 1 - dsmi_tpr
    dsmi_eer_threshold = dsmi_thresholds[np.nanargmin(np.absolute((dsmi_fnr - dsmi_fpr)))]
    dsmi_eer = dsmi_fpr[np.nanargmin(np.absolute((dsmi_fnr - dsmi_fpr)))]
    print 'dsmi EER = ', dsmi_eer

    fce_fnr = 1 - fce_tpr
    fce_eer_threshold = fce_thresholds[np.nanargmin(np.absolute((fce_fnr - fce_fpr)))]
    fce_eer = fce_fpr[np.nanargmin(np.absolute((fce_fnr - fce_fpr)))]
    print 'fce EER = ', fce_eer

    both_fnr = 1 - both_tpr
    both_eer_threshold = both_thresholds[np.nanargmin(np.absolute((both_fnr - both_fpr)))]
    both_eer = both_fpr[np.nanargmin(np.absolute((both_fnr - both_fpr)))]
    print 'both EER = ', both_eer

    # Computing the daugman index
    print 'All d\' = ', compute_daugman_index(hd_results, eer_threshold)
    print 'DSMI d\' = ', compute_daugman_index(dsmi_hd_results, dsmi_eer_threshold)
    print 'FCE d\' = ', compute_daugman_index(fce_hd_results, fce_eer_threshold)
    print 'Both d\' = ', compute_daugman_index(both_hd_results, both_eer_threshold)

    pyplot.plot(thresholds, fnr, marker=',')
    pyplot.plot(thresholds, fpr, marker=',')
    pyplot.plot(eer_threshold, eer, marker='o', color='r')
    pyplot.title('All')
    pyplot.legend(['FNR', 'FPR', 'EER=%.3f' % eer], loc='center right')
    pyplot.ylabel('Error Rate')
    pyplot.xlabel('Thresholds')
    plt.savefig('%s%s_all.png') % (output_image_folder, output_image_file)
    if should_plot:
        pyplot.show()

    pyplot.plot(dsmi_thresholds, dsmi_fnr, marker=',')
    pyplot.plot(dsmi_thresholds, dsmi_fpr, marker=',')
    pyplot.plot(dsmi_eer_threshold, dsmi_eer, marker='o', color='r')
    pyplot.title('DSMI')
    pyplot.legend(['FNR', 'FPR', 'EER=%.3f' % dsmi_eer], loc='center right')
    pyplot.ylabel('Error Rate')
    pyplot.xlabel('Thresholds')
    plt.savefig('%s%s_dsmi.png') % (output_image_folder, output_image_file)
    if should_plot:
        pyplot.show()

    pyplot.plot(fce_thresholds, fce_fnr, marker=',')
    pyplot.plot(fce_thresholds, fce_fpr, marker=',')
    pyplot.plot(fce_eer_threshold, fce_eer, marker='o', color='r')
    pyplot.title('FCE')
    pyplot.legend(['FNR', 'FPR', 'EER=%.3f' % fce_eer], loc='center right')
    pyplot.ylabel('Error Rate')
    pyplot.xlabel('Thresholds')
    plt.savefig('%s%s_fce.png') % (output_image_folder, output_image_file)
    if should_plot:
        pyplot.show()

    pyplot.plot(both_thresholds, both_fnr, marker=',')
    pyplot.plot(both_thresholds, both_fpr, marker=',')
    pyplot.plot(both_eer_threshold, both_eer, marker='o', color='r')
    pyplot.title('Both')
    pyplot.legend(['FNR', 'FPR', 'EER=%.3f' % both_eer], loc='center right')
    pyplot.ylabel('Error Rate')
    pyplot.xlabel('Thresholds')
    plt.savefig('%s%s_both.png') % (output_image_folder, output_image_file)
    if should_plot:
        pyplot.show()

    pyplot.plot(fpr, tpr, marker=',')
    pyplot.plot(dsmi_fpr, dsmi_tpr, marker=',')
    pyplot.plot(fce_fpr, fce_tpr, marker=',')
    pyplot.plot(both_fpr, both_tpr, marker=',')
    pyplot.legend(['Todas,AUC=%.3f' % auc, 'DSMI, AUC=%.3F' % dsmi_auc, 'FCE,AUC=%.3f' % fce_auc, 'Ambas,AUC=%.3f' % both_auc], loc='lower right')
    pyplot.ylabel('True Positive Rate')
    pyplot.xlabel('False Positive Rate')
    plt.savefig('%s%s_eer.png') % (output_image_folder, output_image_file)
    if should_plot:
        pyplot.show()


if __name__ == "__main__":
    main()