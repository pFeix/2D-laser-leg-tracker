#!/usr/bin/env python
import numpy as np
import itertools
import matplotlib.pyplot as plt
import os.path
import sys
from sklearn.externals import joblib
from sklearn.metrics import confusion_matrix, precision_score, recall_score, accuracy_score, zero_one_loss
from sklearn.metrics import classification_report

path = os.path.expanduser('~/robot_host_ws/')


try:
	path = os.path.join(os.path.dirname(os.path.abspath(__file__)),sys.argv[1])
	print(path)
	pip = joblib.load(os.path.join(path,'pipeline.joblib'))
	print('pipeline loaded')
except:
	print('no pipeline found exiting...')
	exit()

	

print('loading files...')
test_data_path = ''
try:
    test_data_path = os.path.join(os.path.dirname(os.path.abspath(__file__)),sys.argv[2])
    path = os.path.join(path,sys.argv[2].split('/')[-1]+'/')
    if not os.path.isdir(path):
    	os.makedirs (path)
    print(test_data_path)
except:
    print('no test data found .... exiting!')
    exit()
    
labled_data = np.load(test_data_path).item()
test_data = labled_data['test_data']
test_lables = labled_data['test_lables']
feature_names = labled_data['feature_names']
print('files loaded')
feature_count = len(feature_names)

clf = pip.named_steps['classifiy_data']
clf_params = clf.get_params()

print(clf_params)

print('predicting...')
invert_op = getattr(clf, "staged_predict", None)
has_staged = callable(invert_op)

if has_staged:
	test_pred = np.array(list(pip.staged_predict(test_data)))
	last_test_pred = test_pred[-1]
else:
	last_test_pred = test_pred = pip.predict(test_data)
	
print('predicted')

report = classification_report(test_lables, last_test_pred.ravel(), target_names=['human','background'])
print(report)

accuracy = accuracy_score(test_lables, last_test_pred.ravel())
precision = precision_score(test_lables, last_test_pred.ravel())
recall = recall_score(test_lables, last_test_pred.ravel())

cnf_matrix = confusion_matrix(test_lables,last_test_pred)
np.set_printoptions(precision=2)
print('precision:',precision,' recall:',recall,' accuracy:',accuracy)





#----------visulization--------
def plot_confusion_matrix(cm, classes,
                          normalize=False,
                          title='Confusion matrix',
                          cmap=plt.cm.Blues):
    
	plt.figure(2,figsize=(10,10))
	"""
	This function prints and plots the confusion matrix.
	Normalization can be applied by setting `normalize=True`.
	"""
	if normalize:
		  cm = cm.astype('float') / cm.sum(axis=1)[:, np.newaxis]
		  print("Normalized confusion matrix")
	else:
		  print('Confusion matrix, without normalization')

	print(cm)

	plt.imshow(cm, interpolation='nearest', cmap=cmap)
	plt.title(title)
	plt.colorbar()
	tick_marks = np.arange(len(classes))
	plt.xticks(tick_marks, classes, rotation=45)
	plt.yticks(tick_marks, classes)

	fmt = '.2f' if normalize else 'd'
	thresh = cm.max() / 2.
	for i, j in itertools.product(range(cm.shape[0]), range(cm.shape[1])):
		  plt.text(j, i, format(cm[i, j], fmt),
		           horizontalalignment="center",
		           color="white" if cm[i, j] > thresh else "black")

	plt.ylabel('True label')
	plt.xlabel('Predicted label')
	classifier = '?'
	#plt.text(-1.5,2.05,'Algorithm: '+clf_params['algorithm']+'\nn_estimators:'+str(len(clf.estimators_,))+'\ntree_depth:'+str(clf_params['base_estimator__max_depth']))
	#plt.text(-1.5,2.05,'precision:'+str(precision)+'\nrecall:'+str(recall)+'\naccuracy:'+str(accuracy))
	plt.tight_layout()
	plt.savefig(os.path.join(path,'confusion_matrix.png'))
    
#-----------------func end-------------

def print_report():
  plt.figure(4)
  plt.text(0,0,report)
  plt.tight_layout()
  plt.savefig(os.path.join(path,'report.png'))

def plot_error_graph():
	ax = plt.figure(1).add_subplot(111)

	clf_err = np.zeros((len(clf.estimators_,)))
	for i, y_pred in enumerate(test_pred):
		clf_err[i] = 1. - accuracy_score(y_pred, test_lables)


	ax.plot(np.arange(len(clf.estimators_,)) + 1, clf_err,
    label='Test Error',
    color='red')


	ax.set_ylim((0.0, 0.05))
	ax.set_xlabel('n_estimators')
	ax.set_ylabel('error rate')

	leg = ax.legend(loc='upper right', fancybox=True)
	leg.get_frame().set_alpha(0.7)

	plt.savefig(os.path.join(path,'acc_plot.png'))
	plt.tight_layout()
#-----------------func end-------------

def plot_importances():
	importance_indices = np.argsort(clf.feature_importances_)[::-1]
	for index in range(len(feature_names)):
		print feature_names[importance_indices[index]] + ': ' + str(clf.feature_importances_[importance_indices[index]])

	plt.figure(3,figsize=(10,10))
	plt.title("Feature importances")
	plt.bar(range(len(feature_names)), clf.feature_importances_[importance_indices],
       color="r", align="center")
	sorted_feature_names = []
  
	for index in importance_indices:
		sorted_feature_names.append(feature_names[index])
  
 	plt.xticks(range(len(feature_names)), sorted_feature_names,rotation='vertical')
	#plt.xlim([-1, X.shape[1]])
	'''
	text = 'Importances \n'
	for index, name in enumerate(feature_names):
		text += (str(index) + ': ' + name + '\n')
	plt.text(31,-0.1,text)
	'''
	plt.tight_layout()
	plt.savefig(os.path.join(path,'feature_importances.png'))

if(has_staged):
	plot_error_graph()
	
if(hasattr(clf, 'feature_importances_')):
	plot_importances()
	
print_report()
	
plot_confusion_matrix(cnf_matrix, classes=['human','background'], title='Confusion matrix, without normalization')


plt.show()

