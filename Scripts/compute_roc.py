# roc curve and auc
from sklearn.datasets import make_classification
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import roc_curve
from sklearn.metrics import roc_auc_score
from matplotlib import pyplot
import sys

# Script for performing ROC and AUC for a given database

input_folder = sys.argv[1]
database = sys.argv[2]

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

print len(thresholds)
print thresholds

# Plotting the ROC curves
pyplot.plot(fpr, tpr, marker=',')
pyplot.plot(dsmi_fpr, dsmi_tpr, marker=',')
pyplot.plot(fce_fpr, fce_tpr, marker=',')
pyplot.plot(both_fpr, both_tpr, marker=',')

pyplot.legend(['Todas,AUC=%.3f' % auc, 'DSMI, AUC=%.3F' % dsmi_auc, 'FCE,AUC=%.3f' % fce_auc, 'Ambas,AUC=%.3f' % both_auc], loc='lower right')
pyplot.ylabel('True Positive Rate')
pyplot.xlabel('False Positive Rate')
pyplot.show()
