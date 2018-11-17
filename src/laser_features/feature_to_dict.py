#!/usr/bin/env python
import os
import rospy
import numpy as np
import atexit

import pandas
import shelve

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
			features_array.append(i)				 				
			
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
		print('done...')
		
atexit.register(exit_handler)

if __name__ == '__main__':
    listener()
