#!/usr/bin/env python
import numpy as np
from sklearn.externals import joblib
from sklearn.feature_extraction import DictVectorizer
from sklearn.model_selection import train_test_split
from sklearn import preprocessing
from sklearn.impute import SimpleImputer

##---------load data from files
print('load files...')
labled_data = np.load('labled_data.npy').item()
print('files loaded')

##---------vectorize data
vec = DictVectorizer()
vec_data = vec.fit_transform(labled_data['features']).toarray()
feature_names = vec.get_feature_names()
vec_lables = vec.fit_transform(labled_data['lables']).toarray().ravel()
print('data vectorized')

##---------standartize data
scaler = preprocessing.StandardScaler().fit(vec_data)
scaled_data = scaler.transform(vec_data)
joblib.dump(scaler, 'scaler.joblib')

print'data scaled: parameter: \nmean:\n',scaler.mean_,'\nvariance:\n',scaler.var_

imp = SimpleImputer(missing_values=np.nan, strategy = 'constant', fill_value=0, copy=False, verbose = True)
#imp = SimpleImputer(missing_values=np.nan, strategy = 'mean', copy=False, verbose = 1)
imp.fit(scaled_data)
scaled_data = imp.transform(scaled_data)
joblib.dump(imp, 'imputer.joblib')
print('imputation completed: ',imp.get_params())


scaled_train_data, scaled_test_data, vec_train_lables, vec_test_lables = train_test_split(scaled_data, vec_lables, test_size=0.3, random_state=0)


labled_data['feature_names'] = feature_names;
labled_data['train_data'] = scaled_train_data;
labled_data['test_data'] = scaled_test_data;
labled_data['train_lables'] = vec_train_lables;
labled_data['test_lables'] = vec_test_lables;

np.save('labled_data.npy',labled_data);

print('preprocessing done')

#norm_data = preprocessing.normalize(vec_data)
