# roc curve and auc
from sklearn.datasets import make_classification
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import roc_curve, roc_auc_score, accuracy_score
from matplotlib import pyplot
import numpy as np
import math as mth
import sys

# Script for performing ROC and AUC, EER and d' for a given database
# Arguments for running the script:
#   <input_folder> <database/NoDistortionFiles|DistortionFiles/Inter|Intra>
#   <all_label_file> <dsmi_label_file> <fce_label_file> <both_label_file>
#   <all_result_file> <dsmi_result_file> <fce_result_file> <both_result_file>
#   <output_image_folder> <output_image_file> <should_plot>

# Function that computs class variances depending on the type parameter
# type: 0 or 1, where 0 is intraclass and 1 interclass
def compute_class_variance(hd, labels, type_class, kind_of_test, output_dir):
    class_hd = [hd[index] for index, label in enumerate(labels) if label == type_class]

    mean = np.mean(class_hd)
    std_deviation = np.std(class_hd)
    variance = np.var(class_hd)
    dof = np.round((mean*(1 - mean))/variance)

    if type_class == 1:
        fig, ax = pyplot.subplots()
        textstr = '\n'.join((
        r'$\mu=%f$' % (mean, ),
        r'$\sigma=%f$' % (std_deviation, ),
        'GDL=%d' % (dof, )))

        ax.hist(class_hd, bins='auto')
        # these are matplotlib.patch.Patch properties
        props = dict(boxstyle='round', facecolor='wheat', alpha=0.5)

        # place a text box in upper left in axes coords
        ax.text(0.05, 0.95, textstr, transform=ax.transAxes, fontsize=14,
        verticalalignment='top', bbox=props)
        plot_title = "Comparacoes Interclasse"
        pyplot.title(plot_title)
        pyplot.ylabel('Frequencia')
        pyplot.xlabel('Distancia Hamming')
        fig.savefig('%s_%s_inter.png' % (output_dir, kind_of_test))
        # pyplot.show()
        pyplot.clf()

    return mean, variance, std_deviation, dof

def compute_daugman_index(hamming_distance_values, threshold, output, kind_of_test):

    thresholds = [0.2, 0.25, 0.3, 0.35, 0.4, threshold]

    with open("%s_%s_daugman_mean_variance.txt" % (output, kind_of_test), "w") as f:
        print kind_of_test.upper()
        for t in thresholds:
            matching = [hd for hd in hamming_distance_values if hd <= t]
            non_matching = [hd for hd in hamming_distance_values if hd > t]

            if len(matching) < 1:
                matching = 0.0
            if len(non_matching) < 1:
                non_matching = 0.0

            mean_matching = np.mean(matching)
            mean_non_matching = np.mean(non_matching)

            variance_matching = np.var(matching)
            variance_non_matching = np.var(non_matching)

            daugman_decidability = np.abs(mean_matching - mean_non_matching) / np.sqrt(0.5 * (variance_matching + variance_non_matching))

            f.write("Threshold = %f\n" % t)
            f.write("N mean matching = %d\n" % len(matching))
            f.write("N mean non_matching = %d\n" % len(non_matching))
            f.write("Mean matching = %f\n" % mean_matching)
            f.write("Mean non_matching = %f\n" % mean_non_matching)
            f.write("Variance matching = %f\n" % variance_matching)
            f.write("Variance non_matching = %f\n" % variance_non_matching)
            f.write("d'=%f\n" % daugman_decidability)
            f.write("-----------------------------\n")

            matching = []
            non_matching = []

def main():

    amount_arguments = len(sys.argv)
    if amount_arguments < 13 and amount_arguments > 13:
        raise ValueError('Invalid amount of arguments! 13 must be passed')

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

    print database_lower, len(labels), len(hd_results)
    print database_lower, len(dsmi_labels), len(dsmi_hd_results)
    print database_lower, len(fce_labels), len(fce_hd_results)
    print database_lower, len(both_labels), len(both_hd_results)

    # Computing the AUC for each set of test
    try:
        auc = roc_auc_score(labels, hd_results)
    except ValueError:
        auc = accuracy_score(labels, np.rint(hd_results))
    try:
        dsmi_auc = roc_auc_score(dsmi_labels, dsmi_hd_results)
    except ValueError:
        dsmi_auc = accuracy_score(dsmi_labels, np.rint(dsmi_hd_results))
    try:
        fce_auc = roc_auc_score(fce_labels, fce_hd_results)
    except ValueError:
        fce_auc = accuracy_score(fce_labels, np.rint(fce_hd_results))
    try:
        both_auc = roc_auc_score(both_labels, both_hd_results)
    except ValueError:
        both_auc = accuracy_score(both_labels, np.rint(both_hd_results))
    
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

    output = '%s%s' % (output_image_folder, output_image_file)

    # Computing the daugman index
    compute_daugman_index(hd_results, eer_threshold, output, 'all')
    compute_daugman_index(dsmi_hd_results, dsmi_eer_threshold, output, 'dsmi')
    compute_daugman_index(fce_hd_results, fce_eer_threshold, output, 'fce')
    compute_daugman_index(both_hd_results, both_eer_threshold, output, 'both')

    # print 'All d\' = ', d_all
    # print 'DSMI d\' = ', d_dsmi
    # print 'FCE d\' = ', d_fce
    # print 'Both d\' = ', d_both

    # Computing inter and intraclass mean, variance and std_deviation

    # all_intra_mean, all_intra_var, all_intra_std, all_intra_dof = compute_class_variance(hd_results, labels, 0, 'all', output)
    # all_inter_mean, all_inter_var, all_inter_std, all_inter_dof = compute_class_variance(hd_results, labels, 1, 'all', output)

    # dsmi_intra_mean, dsmi_intra_var, dsmi_intra_std, dsmi_intra_dof = compute_class_variance(dsmi_hd_results, dsmi_labels, 0, 'dsmi', output)
    # dsmi_inter_mean, dsmi_inter_var, dsmi_inter_std, dsmi_inter_dof = compute_class_variance(dsmi_hd_results, dsmi_labels, 1, 'dsmi', output)

    # fce_intra_mean, fce_intra_var, fce_intra_std, fce_intra_dof = compute_class_variance(fce_hd_results, fce_labels, 0, 'fce', output)
    # fce_inter_mean, fce_inter_var, fce_inter_std, fce_inter_dof = compute_class_variance(fce_hd_results, fce_labels, 1, 'fce', output)

    # both_intra_mean, both_intra_var, both_intra_std, both_intra_dof  = compute_class_variance(both_hd_results, both_labels, 0, 'both', output)
    # both_inter_mean, both_inter_var, both_inter_std, both_inter_dof = compute_class_variance(both_hd_results, both_labels, 1, 'both', output)

    # print 'All intra mean = %f | var = %f | std = %f | dof = %f' % (all_intra_mean, all_intra_var, all_intra_std, all_intra_dof)
    # print 'All inter mean = %f | var = %f | std = %f | dof = %f' % (all_inter_mean, all_inter_var, all_inter_std, all_inter_dof)
    # print 'DSMI intra mean = %f | var = %f | std = %f | dof = %f' % (dsmi_intra_mean, dsmi_intra_var, dsmi_intra_std, dsmi_intra_dof)
    # print 'DSMI inter mean = %f | var = %f | std = %f | dof = %f' % (dsmi_inter_mean, dsmi_inter_var, dsmi_inter_std, dsmi_inter_dof)
    # print 'FCE intra mean = %f | var = %f | std = %f | dof = %f' % (fce_intra_mean, fce_intra_var, fce_intra_std, fce_intra_dof)
    # print 'FCE inter mean = %f | var = %f | std = %f | dof = %f' % (fce_inter_mean, fce_inter_var, fce_inter_std, fce_inter_dof)
    # print 'Both intra mean = %f | var = %f | std = %f | dof = %f' % (both_intra_mean, both_intra_var, both_intra_std, both_intra_dof)
    # print 'Both inter mean = %f | var = %f | std = %f | dof = %f' % (both_inter_mean, both_inter_var, both_inter_std, both_inter_dof)

    # with open('%s%s.txt' % (output_image_folder, output_image_file), 'w') as f:
    #     f.write('AUC: %.3f\n' % auc)
    #     f.write('DSMI AUC: %.3f\n' % dsmi_auc)
    #     f.write('FCE AUC: %.3f\n' % fce_auc)
    #     f.write('BOTH AUC: %.3f\n' % both_auc)
    #     f.write('all EER = %.3f\n' % eer)
    #     f.write('dsmi EER = %.3f\n' % dsmi_eer)
    #     f.write('fce EER = %.3f\n' % fce_eer)
    #     f.write('both EER = %.3f\n' % both_eer)
    #     # f.write('All d\' = %.3f\n' % d_all)
    #     # f.write('DSMI d\' = %.3f\n' % d_dsmi)
    #     # f.write('FCE d\' = %.3f\n' % d_fce)
    #     # f.write('Both d\' = %.3f\n' % d_both)
    #     f.write('All intra mean = %f | var = %f | std = %f | dof = %f\n' % (all_intra_mean, all_intra_var, all_intra_std, all_intra_dof))
    #     f.write('All inter mean = %f | var = %f | std = %f | dof = %f\n' % (all_inter_mean, all_inter_var, all_inter_std, all_inter_dof))
    #     f.write('DSMI intra mean = %f | var = %f | std = %f | dof = %f\n' % (dsmi_intra_mean, dsmi_intra_var, dsmi_intra_std, dsmi_intra_dof))
    #     f.write('DSMI inter mean = %f | var = %f | std = %f | dof = %f\n' % (dsmi_inter_mean, dsmi_inter_var, dsmi_inter_std, dsmi_inter_dof))
    #     f.write('FCE intra mean = %f | var = %f | std = %f | dof = %f\n' % (fce_intra_mean, fce_intra_var, fce_intra_std, fce_intra_dof))
    #     f.write('FCE inter mean = %f | var = %f | std = %f | dof = %f\n' % (fce_inter_mean, fce_inter_var, fce_inter_std, fce_inter_dof))
    #     f.write('Both intra mean = %f | var = %f | std = %f | dof = %f\n' % (both_intra_mean, both_intra_var, both_intra_std, both_intra_dof))
    #     f.write('Both inter mean = %f | var = %f | std = %f | dof = %f\n' % (both_inter_mean, both_inter_var, both_inter_std, both_inter_dof))


    # pyplot.plot(thresholds[1:], fnr[1:], marker=',')
    # pyplot.plot(thresholds[1:], fpr[1:], marker=',')
    # pyplot.plot(eer_threshold, eer, marker='o', color='r')
    # pyplot.title('Sem nenhuma metrica')
    # # TA INVERTIDO PORQUE SKLEARN CALCULA FPR E TPR PARA SIMILARIDADE
    # # ENQUANTO EU USO DISTANCIA, AI SAO INVERTIDOS
    # pyplot.legend(['FPR', 'FNR', 'EER=%.3f' % eer], loc='center right')
    # pyplot.ylabel('Taxa de Erro')
    # pyplot.xlabel('Limiar')
    # pyplot.savefig('%s_all_eer.png' % output)
    # if should_plot:
    #     pyplot.show()
    # pyplot.clf()

    # pyplot.plot(dsmi_thresholds[1:], dsmi_fnr[1:], marker=',')
    # pyplot.plot(dsmi_thresholds[1:], dsmi_fpr[1:], marker=',')
    # pyplot.plot(dsmi_eer_threshold, dsmi_eer, marker='o', color='r')
    # pyplot.title('Somente DSMI')
    # pyplot.legend(['FPR', 'FNR', 'EER=%.3f' % dsmi_eer], loc='center right')
    # pyplot.ylabel('Taxa de Erro')
    # pyplot.xlabel('Limiar')
    # pyplot.savefig('%s_dsmi_eer.png' % output)
    # if should_plot:
    #     pyplot.show()
    # pyplot.clf()

    # pyplot.plot(fce_thresholds[1:], fce_fnr[1:], marker=',')
    # pyplot.plot(fce_thresholds[1:], fce_fpr[1:], marker=',')
    # pyplot.plot(fce_eer_threshold, fce_eer, marker='o', color='r')
    # pyplot.title('Somente FCE')
    # pyplot.legend(['FPR', 'FNR', 'EER=%.3f' % fce_eer], loc='center right')
    # pyplot.ylabel('Taxa de Erro')
    # pyplot.xlabel('Limiar')
    # pyplot.savefig('%s_fce_eer.png' % output)
    # if should_plot:
    #     pyplot.show()
    # pyplot.clf()

    # pyplot.plot(both_thresholds[1:], both_fnr[1:], marker=',')
    # pyplot.plot(both_thresholds[1:], both_fpr[1:], marker=',')
    # pyplot.plot(both_eer_threshold, both_eer, marker='o', color='r')
    # pyplot.title('DSMI e FCE')
    # pyplot.legend(['FPR', 'FNR', 'EER=%.3f' % both_eer], loc='center right')
    # pyplot.ylabel('Taxa de Erro')
    # pyplot.xlabel('Limiar')
    # pyplot.savefig('%s_both_eer.png' % output)
    # if should_plot:
    #     pyplot.show()
    # pyplot.clf()

    # pyplot.plot(fpr, tpr, marker=',')
    # pyplot.plot(dsmi_fpr, dsmi_tpr, marker=',')
    # pyplot.plot(fce_fpr, fce_tpr, marker=',')
    # pyplot.plot(both_fpr, both_tpr, marker=',')
    # pyplot.legend(['Sem,AUC=%.3f' % auc, 'DSMI,AUC=%.3f' % dsmi_auc, 'FCE,AUC=%.3f' % fce_auc, 'Ambas,AUC=%.3f' % both_auc], loc='lower right')
    # pyplot.ylabel('TPR')
    # pyplot.xlabel('FPR')
    # pyplot.savefig('%s_auc.png' % output)
    # if should_plot:
    #     pyplot.show()
    # pyplot.clf()

if __name__ == "__main__":
    main()