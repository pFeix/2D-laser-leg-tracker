##---------cross validate classifier
import numpy as np
import itertools
import time
import matplotlib.pyplot as plt
import os.path
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
scaler = joblib.load('scaler.joblib')
imp = joblib.load('imputer.joblib')


classifier = 'RandomForest'
n_estimators = 50
weights= 'uniform' 
tree_depth = None


print('loading files...')
labled_data = np.load('labled_data.npy').item()
train_data = labled_data['train_data']
train_lables = labled_data['train_lables']
test_data = labled_data['test_data']
test_lables = labled_data['test_lables']
feature_names = labled_data['feature_names']
print('files loaded, train_size:',len(train_data), ', num_features:',len(feature_names))

feature_count = len(feature_names)

classifiers_dict={'AdaBoost_real':AdaBoostClassifier(DecisionTreeClassifier(max_depth=1),algorithm="SAMME.R",n_estimators=50),
									'AdaBoost_discrete':AdaBoostClassifier(DecisionTreeClassifier(max_depth=1),algorithm="SAMME",n_estimators=50),
									'GradientTree':GradientBoostingClassifier(n_estimators=50, learning_rate=1.0,max_depth=1, random_state=0,verbose=1),
									'RandomForest':RandomForestClassifier(n_estimators=50,max_depth=None,verbose=1,n_jobs=-1,class_weight={0:5,1:1},max_features= 0.5),
									'Neighbors':neighbors.KNeighborsClassifier(50, weights=weights ,n_jobs=-1),
									'linearSVC':svm.LinearSVC(verbose = True),
									'NB':GaussianNB(),
									'Neural':MLPClassifier(verbose=True),
									'Gauss':GaussianProcessClassifier(1.0 * RBF(1.0),n_jobs=-1), #memory error
									'QDA':QuadraticDiscriminantAnalysis(),
									'DecissionTree':DecisionTreeClassifier(max_depth=1)							
									}

clf = classifiers_dict[classifier]

clf_path = os.path.join(ws_path,'Classifiers/'+str(feature_count)+'_'+str(len(train_data))+'/'+classifier+'/')

if(classifier == 'GradientTree' or classifier == 'AdaBoost_real' or classifier == 'AdaBoost_discrete'):
	clf_path = os.path.join(clf_path+str(clf.n_estimators)+'_'+str(max_depth)+'/')
elif(classifier == 'RandomForest'):
	clf_path = os.path.join(clf_path+str(clf.n_estimators)+'_'+str(clf.max_depth)+'_'+str(clf.class_weight)+'_'+str(clf.max_features)+'/')
elif(classifier == 'DecissionTree'):
	clf_path = os.path.join(clf_path+str(tree_depth)+'/')
elif(classifier == 'Neighbors'):
	clf_path = os.path.join(clf_path+str(clf.max_depth)+'_'+clf.weights+'/')

if not os.path.isdir(clf_path):
    os.makedirs (clf_path)


print('learning...')
									
clf = clf.fit(train_data, train_lables)

print('classifier trained')
joblib.dump(clf, 'classifier.joblib') 
print('classifier saved')

pip = Pipeline([('scale_data',scaler),('impute_data',imp),('classifiy_data',clf)])
joblib.dump(pip, 'pipeline.joblib')
joblib.dump(pip, os.path.join(clf_path,'pipeline.joblib'))
print('pipeline saved')

end_time = time.clock()

print('time needed: ',end_time-start_time)
