#!/usr/bin/env python
import os
import rospy
import numpy as np
import atexit
from laser_features.msg import Featured_segments

features_array = []
lables_array = []
segments_array = []
scan_count = 0
segements_count = 0
people_count = 0
background_count = 0
unkown_count = 0

def callback(data):
		global scan_count
		global segements_count
		global features_array
		global segments_array
		global lables_array
		global people_count
		global background_count
		scan_count = scan_count+1
		segements_count = segements_count + len(data.segments)
		

		for i in data.segments:

			lables_array.append({'class_label':i.class_id})
			#segments_array.append(i.points)
			#-------------do not change to automized recording of all data -> this way exclusion of specific features is possible
			features_array.append	({
														'distance_to_origin':i.distance,
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
														
										 				
										 				
			
			if i.class_id == 0:
				people_count += 1  
			else: 
				background_count += 1
				
			
			
		rospy.loginfo("to dict: scan_count: %i, segements_count: %i, people_count: %i, background_count: %i",scan_count,segements_count,people_count,background_count)
  	
def listener():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # node are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('feature_to_dict', anonymous=False)

    rospy.Subscriber("/featured_segments", Featured_segments, callback, queue_size=10000)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()
    
def exit_handler():
		print('saving features and lables... \nsize:',str(len(features_array)))
		data_dict = {'features':features_array, 'lables':lables_array}
		ws_dir=os.path.expanduser('~/robot_host_ws/')
		np.save(os.path.join(ws_dir, 'labled_data.npy'),data_dict)
		del data_dict
		#print('saving segments... \nsize:',str(len(segments_array)))
		#np.save(os.path.join(ws_dir, 'segments.npy'),segments_array)
		print('done...')
		
atexit.register(exit_handler)

if __name__ == '__main__':
    listener()
