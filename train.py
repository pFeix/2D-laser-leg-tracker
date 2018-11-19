##---------cross validate classifier
import numpy as np
import itertools
import time
import matplotlib.pyplot as plt
import os.path
import sys
from sklearn.externals import joblib
from sklearn.ensemble import AdaBoostClassifier
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.gaussian_process import GaussianProcessClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.discriminant_analysis import QuadraticDiscriminantAnalysis
from sklearn.neural_network import MLPClassifier
from sklearn.gaussian_process.kernels import RBF
from sklearn import svm
from sklearn import neighbors
from sklearn.metrics import confusion_matrix, precision_score, recall_score, accuracy_score
from sklearn.model_selection import cross_val_score
from sklearn.pipeline import Pipeline


ws_path = os.path.expanduser('~/robot_host_ws/')

start_time = time.clock()
#------ressources for pipeline building
imp = joblib.load('imputer.joblib')


classifier = 'AdaBoost_real'
rescaling = 'no_rescaling'

if(rescaling != 'no_rescaling' and rescaling != 'standardize'):
	print('invalid rescaling method!')
	exit()


print('loading files...')
data_path = ''

try:
	data_path = os.path.join(os.path.dirname(os.path.abspath(__file__)),sys.argv[1])
	print(data_path)
	labled_data = np.load(data_path).item()
	print('data loaded')
except:
	print(data_path)
	print('training data file not found exiting...')
	exit()
	

train_data = labled_data['train_data']
train_lables = labled_data['train_lables']
test_data = labled_data['test_data']
test_lables = labled_data['test_lables']
feature_names = labled_data['feature_names']
print('files loaded,name:',str(sys.argv[1]),' , train_size:',len(train_data), ', num_features:',len(feature_names))

if(rescaling=='standardize'):
	print('standardizing data...')
	##---------standartize data
	scaler = preprocessing.StandardScaler().fit(test_data)
	test_data = scaler.transform(test_data)
	print('data scaled: parameter: \nmean:\n',scaler.mean_,'\nvariance:\n',scaler.var_)


classifiers_dict={'AdaBoost_real':AdaBoostClassifier(DecisionTreeClassifier(max_depth=50),algorithm="SAMME.R",n_estimators=250),
									'AdaBoost_discrete':AdaBoostClassifier(DecisionTreeClassifier(max_depth=1),algorithm="SAMME",n_estimators=50),
									'GradientTree':GradientBoostingClassifier(n_estimators=50, learning_rate=1.0,max_depth=1, random_state=0,verbose=1),
									'RandomForest':RandomForestClassifier(n_estimators=100,max_depth=None,verbose=1,n_jobs=-1,class_weight=None,max_features= "auto"),
									'Neighbors':neighbors.KNeighborsClassifier(50, weights='uniform' ,n_jobs=-1),
									'linearSVC':svm.LinearSVC(verbose = True),
									'NB':GaussianNB(),
									'Neural':MLPClassifier(verbose=True),
									'Gauss':GaussianProcessClassifier(1.0 * RBF(1.0),n_jobs=-1), #memory error
									'QDA':QuadraticDiscriminantAnalysis(),
									'DecissionTree':DecisionTreeClassifier(max_depth=1)							
									}

clf = classifiers_dict[classifier]

clf_path = os.path.join(ws_path,'Classifiers/'+str(sys.argv[1]).split('.')[0]+'_'+str(len(feature_names))+'/'+classifier+'_'+rescaling+'/')


if hasattr(clf, 'n_estimators'):
	clf_path = os.path.join(clf_path+'n_estimators:'+str(clf.n_estimators)+'_')
if hasattr(clf, 'max_depth'):
	clf_path = os.path.join(clf_path+'max_depth:'+str(clf.max_depth)+'_')
elif hasattr(clf, 'base_estimator') and hasattr(clf.base_estimator, 'max_depth'):
	clf_path = os.path.join(clf_path+'max_depth:'+str(clf.base_estimator.max_depth)+'_')
if hasattr(clf, 'class_weight'):
	clf_path = os.path.join(clf_path+'class_weight:'+str(clf.class_weight)+'_')
if hasattr(clf, 'weights'):
	clf_path = os.path.join(clf_path+'weights:'+str(clf.weights)+'_')
if hasattr(clf, 'max_features'):
	clf_path = os.path.join(clf_path+'max_features:'+str(clf.max_features)+'_')

	
	
'''
if(classifier == 'GradientTree' or classifier == 'AdaBoost_real' or classifier == 'AdaBoost_discrete'):
	clf_path = os.path.join(clf_path+str(clf.n_estimators)+'_'+str(clf.base_estimator.max_depth)+'/')
elif(classifier == 'RandomForest'):
	clf_path = os.path.join(clf_path+str(clf.n_estimators)+'_'+str(clf.max_depth)+'_'+str(clf.class_weight)+'_'+str(clf.max_features)+'/')
elif(classifier == 'DecissionTree'):
	clf_path = os.path.join(clf_path+str(clf.max_depth)+'/')
elif(classifier == 'Neighbors'):
	clf_path = os.path.join(clf_path+str(clf.max_depth)+'_'+clf.weights+'/')
'''
if not os.path.isdir(clf_path):
    os.makedirs (clf_path)


print('learning...')
									
clf = clf.fit(train_data, train_lables)

print('classifier trained')
joblib.dump(clf, 'classifier.joblib') 
print('classifier saved')

if(rescaling=='standardize'):
	pip = Pipeline([('impute_data',imp),('scale_data',scaler),('classifiy_data',clf)])
else:
	pip = Pipeline([('impute_data',imp),('classifiy_data',clf)])

joblib.dump(pip, 'pipeline.joblib')
joblib.dump(pip, os.path.join(clf_path,'pipeline.joblib'))
print('pipeline saved')

end_time = time.clock()

print('time needed: ',end_time-start_time)
