#!/usr/bin/env python
import rospy
import numpy as np
import time
from sklearn.externals import joblib
from sklearn.feature_extraction import DictVectorizer
from laser_features.msg import Featured_segments
from visualization_msgs.msg import Marker
from visualization_msgs.msg import MarkerArray

pub = rospy.Publisher('/classified_segments', Featured_segments, queue_size=10)
marker_pub = rospy.Publisher('/class_marker', Marker, queue_size=10)
text_marker_pub = rospy.Publisher('/text_class_marker', MarkerArray, queue_size=1)

vec = DictVectorizer()
#scaler = joblib.load('scaler.joblib')
imp = joblib.load('imputer.joblib')
#clf = joblib.load('classifier.joblib')
pip = joblib.load('pipeline.joblib')


def callback(data):	

	scan_start_time = time.clock()
	for index, i in enumerate(data.segments):
		start_time = time.clock()
		features = ({						#'distance_to_origin':i.distance_to_origin,
														'number_of_points':i.number_of_points, 
    												'std_deviation':i.std_deviation,
    												'mean_average_deviation_from_median':i.mean_average_deviation_from_median,
    												#'jump_distance_preceeding':i.jump_distance_preceeding,
    												#'jump_distance_succeeding':i.jump_distance_succeeding,
    												'nearest_distance':i.nearest_distance,
														#'sum_of_distances':i.sum_of_distances,
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
														'nn_kurtosis':i.nn_kurtosis
														})
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
										 				
		lable =	i.class_id
					
		##---------vectorize data					 				
		vec_data = vec.fit_transform(features).toarray()
		feature_names = vec.get_feature_names()
		
		##---------standartize data
		#scaled_data = scaler.transform(vec_data)

		##---------impute missing data
		vec_data = imp.transform(vec_data)
		
		##---------predict class
		#i.class_id = clf.predict(scaled_data)
		
		##---------pipeline: impute->(standartize->)predict
		invert_op = getattr(pip, "predict_proba", None)		
		if(callable(invert_op)):
			i.class_id = pip.predict_proba(vec_data)[0][0]
		else:
			i.class_id = 1 - pip.predict(vec_data)
		
		
		
		end_time = time.clock()
		print('pred:', i.class_id,'lable:', lable,'time:',end_time-start_time)
		
	scan_end_time = time.clock()
	pub.publish(data)
	print('scan_time:',scan_end_time-scan_start_time)
	
	class_visualization(data)

def class_visualization(data):
	
		center_point = Marker()
		center_point.header = data.header
		center_point.ns = "segment_center"
		center_point.action = center_point.MODIFY
		center_point.pose.orientation.w = 1.0
		center_point.id = 0
		center_point.type = center_point.SPHERE_LIST

		center_point.scale.x = center_point.scale.y = 0.1
		center_point.scale.z = 0.1
	
		center_point.color.a = 0.5
		center_point.color.r = 1.0
		center_point.color.g = 1.0
		center_point.color.b = 1.0
		
		
		
		
		class_text_array = MarkerArray()
		class_text = Marker()
		class_text.header = data.header
		class_text.action= class_text.DELETEALL
		class_text_array.markers.append(class_text)
		text_marker_pub.publish(class_text_array)
		
		for index, item in enumerate(data.segments):
			class_text = Marker()
			class_text.header = data.header
			class_text.ns = "class_text"
			class_text.action = class_text.ADD
			class_text.pose.orientation.w = 1.0
			class_text.id = index
			class_text.type = class_text.TEXT_VIEW_FACING

			class_text.scale.z = 0.05
	
			class_text.color.a = 1.0
			class_text.color.r = 1.0
			class_text.color.g = 1.0
			class_text.color.b = 1.0
			class_text.text = str(round(item.class_id,2))
			class_text.pose.position.x = (item.center.x)
			class_text.pose.position.y = (item.center.y)
			class_text.pose.position.z = (item.center.z)
			class_text_array.markers.append(class_text)
			
			if(item.class_id > 0.7):
				center_point.points.append(item.center)
			
		marker_pub.publish(center_point)
		text_marker_pub.publish(class_text_array)
  	
def scan_classifier():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # node are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('scan_classifier', anonymous=False)

    rospy.Subscriber("/featured_segments", Featured_segments, callback, queue_size=10000)
    

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    scan_classifier()
