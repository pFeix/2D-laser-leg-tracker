import warnings
warnings.filterwarnings("ignore", category=FutureWarning)

import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.model_selection import GridSearchCV
from sklearn.metrics import classification_report accuracy_score
from sklearn.ensemble import RandomForestClassifier




print('loading files...')
labled_data = np.load('labled_data.npy').item()
train_data = labled_data['train_data']
train_lables = labled_data['train_lables']
test_data = labled_data['test_data']
test_lables = labled_data['test_lables']
feature_names = labled_data['feature_names']
print('files loaded, train_size:',len(train_data), ', num_features:',len(feature_names))


# Set the parameters by cross-validation
tuned_parameters = [{'max_depth': [20, 40, 80],
                     'max_features': [0.5],
                     'class_weight':[None,"balanced","balanced_subsample",{0:5,1:1}]}]

#scores = ['precision', 'recall']

scores = ['accuracy']

for score in scores:
    print("# Tuning hyper-parameters for %s" % score)
    print()

    clf = GridSearchCV(RandomForestClassifier(), tuned_parameters, cv=2,
                       scoring=score, n_jobs = 4, verbose = 1)
    clf.fit(train_data, train_lables)

    print("Best parameters set found on development set:")
    print()
    print(clf.best_params_)
    print()
    print("Grid scores on development set:")
    print()
    means = clf.cv_results_['mean_test_score']
    stds = clf.cv_results_['std_test_score']
    for mean, std, params in zip(means, stds, clf.cv_results_['params']):
        print("%0.3f (+/-%0.03f) for %r"
              % (mean, std * 2, params))
    print()

    print("Detailed classification report:")
    print()
    print("The model is trained on the full development set.")
    print("The scores are computed on the full evaluation set.")
    print()
    y_true, y_pred = test_lables, clf.predict(test_data)
    print(classification_report(y_true, y_pred))
    print()

# Note the problem is too easy: the hyperparameter plateau is too flat and the
# output model is the same for precision and recall with ties in quality.
