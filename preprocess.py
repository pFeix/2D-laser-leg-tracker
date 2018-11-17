#!/usr/bin/env python
import numpy as np
from sklearn.externals import joblib
from sklearn.feature_extraction import DictVectorizer
from sklearn.model_selection import train_test_split
from sklearn import preprocessing
from sklearn.impute import SimpleImputer
import sys
import os

test_size = 0.99

##---------load data from files

path = ""

try:
  path = os.path.join(os.path.dirname(os.path.abspath(__file__)),sys.argv[1])
  print(path)
except:
  print("no path!")
  exit()

print('load files...')
labled_data = np.load(path).item()
print('files loaded')

features_array = []
features = labled_data['features']

for i in features:
		features_array.append	({#'distance_to_origin':i.distance_to_origin,
														'number_of_points':i.number_of_points, 
														'std_deviation':i.std_deviation,
														'mean_average_deviation_from_median':i.mean_average_deviation_from_median,
														'jump_distance_preceeding':i.jump_distance_preceeding,
														'jump_distance_succeeding':i.jump_distance_succeeding,
														'nearest_distance':i.nearest_distance,
														'sum_of_distances':i.sum_of_distances,
														'width':i.width,
														'linearity':i.linearity,
														'radius':i.radius,
														'circularity':i.circularity,
														'boundary_length':i.boundary_length,
														'boundary_regulatity':i.boundary_regulatity,
														'mean_curvature':i.mean_curvature,
														'mean_angular_difference':i.mean_angular_difference,
														'aspect_ratio':i.aspect_ratio,
														'kurtosis':i.kurtosis,
											
														'nn_number_of_points':i.nn_number_of_points,
														'nn_std_deviation':i.nn_std_deviation,
														'nn_mean_average_deviation_from_median':i.nn_mean_average_deviation_from_median,
														'nn_width':i.nn_width,
														'nn_linearity':i.nn_linearity,
														'nn_radius':i.nn_radius,
														'nn_circularity':i.nn_circularity,
														'nn_boundary_length':i.nn_boundary_length,
														'nn_boundary_regulatity':i.nn_boundary_regulatity,
														'nn_mean_curvature':i.nn_mean_curvature,
														'nn_mean_angular_difference':i.nn_mean_angular_difference,
														'nn_aspect_ratio':i.nn_aspect_ratio,
														'nn_kurtosis':i.nn_kurtosis})
''',
											
'div_distance_number_of_points':i.div_distance_number_of_points,
'div_distance_std_deviation':i.div_distance_std_deviation,
'div_distance_mean_average_deviation_from_median':i.div_distance_mean_average_deviation_from_median,
'div_distance_width':i.div_distance_width,
'div_distance_linearity':i.div_distance_linearity,
'div_distance_radius':i.div_distance_radius,
'div_distance_circularity':i.div_distance_circularity,
'div_distance_boundary_length':i.div_distance_boundary_length,
'div_distance_boundary_regulatity':i.div_distance_boundary_regulatity,
'div_distance_mean_curvature':i.div_distance_mean_curvature,
'div_distance_mean_angular_difference':i.div_distance_mean_angular_difference,
'div_distance_aspect_ratio':i.div_distance_aspect_ratio,
'div_distance_kurtosis':i.div_distance_kurtosis,

'mlp_distance_number_of_points':i.mlp_distance_number_of_points,
'mlp_distance_std_deviation':i.mlp_distance_std_deviation,
'mlp_distance_mean_average_deviation_from_median':i.mlp_distance_mean_average_deviation_from_median,
'mlp_distance_width':i.mlp_distance_width,
'mlp_distance_linearity':i.mlp_distance_linearity,
'mlp_distance_radius':i.mlp_distance_radius,
'mlp_distance_circularity':i.mlp_distance_circularity,
'mlp_distance_boundary_length':i.mlp_distance_boundary_length,
'mlp_distance_boundary_regulatity':i.mlp_distance_boundary_regulatity,
'mlp_distance_mean_curvature':i.mlp_distance_mean_curvature,
'mlp_distance_mean_angular_difference':i.mlp_distance_mean_angular_difference,
'mlp_distance_aspect_ratio':i.mlp_distance_aspect_ratio,
'mlp_distance_kurtosis':i.mlp_distance_kurtosis,

'div_number_std_deviation':i.div_number_std_deviation,
'div_number_mean_average_deviation_from_median':i.div_number_mean_average_deviation_from_median,
'div_number_width':i.div_number_width,
'div_number_linearity':i.div_number_linearity,
'div_number_radius':i.div_number_radius,
'div_number_circularity':i.div_number_circularity,
'div_number_boundary_length':i.div_number_boundary_length,
'div_number_boundary_regulatity':i.div_number_boundary_regulatity,
'div_number_mean_curvature':i.div_number_mean_curvature,
'div_number_mean_angular_difference':i.div_number_mean_angular_difference,
'div_number_aspect_ratio':i.div_number_aspect_ratio,
'div_number_kurtosis':i.div_number_kurtosis,

'mlp_number_std_deviation':i.mlp_number_std_deviation,
'mlp_number_mean_average_deviation_from_median':i.mlp_number_mean_average_deviation_from_median,
'mlp_number_width':i.mlp_number_width,
'mlp_number_linearity':i.mlp_number_linearity,
'mlp_number_radius':i.mlp_number_radius,
'mlp_number_circularity':i.mlp_number_circularity,
'mlp_number_boundary_length':i.mlp_number_boundary_length,
'mlp_number_boundary_regulatity':i.mlp_number_boundary_regulatity,
'mlp_number_mean_curvature':i.mlp_number_mean_curvature,
'mlp_number_mean_angular_difference':i.mlp_number_mean_angular_difference,
'mlp_number_aspect_ratio':i.mlp_number_aspect_ratio,
'mlp_number_kurtosis':i.mlp_number_kurtosis
'''






lables = labled_data['lables']
##---------vectorize data
vec = DictVectorizer()
vec_data = vec.fit_transform(features_array).toarray()
feature_names = vec.get_feature_names()
vec_lables = vec.fit_transform(lables).toarray().ravel()
print('data vectorized')

#--------------impute missing data
imp = SimpleImputer(missing_values=np.nan, strategy = 'constant', fill_value=0, copy=False, verbose = True)
#imp = SimpleImputer(missing_values=np.nan, strategy = 'mean', copy=False, verbose = 1)
imp.fit(vec_data)
vec_data = imp.transform(vec_data)
joblib.dump(imp, 'imputer.joblib')
print('imputation completed: ',imp.get_params())
print('splitting...')
train_data, test_data, train_lables, test_lables = train_test_split(vec_data, vec_lables, test_size=test_size, random_state=0)
print('data splitted')

labled_data['feature_names'] = feature_names;
labled_data['train_data'] = train_data;
labled_data['test_data'] = test_data;
labled_data['train_lables'] = train_lables;
labled_data['test_lables'] = test_lables;

print('saving...')
ws_path = os.path.expanduser('~/robot_host_ws/')
data_path = os.path.join(ws_path,'Classifiers/'+str(sys.argv[1]).split('/')[-1].split('.')[0]+'_'+str(len(feature_names))+'/')
if not os.path.isdir(data_path):
    os.makedirs (data_path)
np.save(data_path+str(sys.argv[1]).split('/')[-1].split('.')[0],labled_data);
print(type(feature_names))
with open(data_path+'feature_names.txt', 'w') as f:
    for item in feature_names:
        f.write("%s\n" % item)
np.save(path,labled_data);
print('saving done')
print('preprocessing done')

#norm_data = preprocessing.normalize(vec_data)
