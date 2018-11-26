#include "ros/ros.h"
#include "sensor_msgs/PointCloud.h"
#include "std_msgs/Header.h"
#include "geometry_msgs/PointStamped.h"
#include "laser_features/Featured_segments.h"
#include "laser_features/Segment_featured.h"
#include "laser_segmentation/Target.h"
#include "hungarian-algorithm/Hungarian.h"
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <chrono>
#include <queue> 


#include <tf/transform_listener.h>
#include <geometry_msgs/TransformStamped.h>
#include <tf2_ros/transform_broadcaster.h>


//for keyboard input
#include <stdio.h>
#include <sys/select.h>
#include <termios.h>
#include <stropts.h>
#include <sys/ioctl.h>

/*
TO DO:
-to prevent assignment at any cost -> include meassure not available cost //study source again

-over max_cost_treshhold (curr recaclulate assignment )use next best solution/set cost to infity/UPPER ONE

-increase frame pulish rate

-track only legs


 
--------------------------------do after rest/segmentation-----------------------------------
-prevent target from get lost e.g. target gets not assignt because other object has only a bit lower cost -> priotize target (bad idea? because target gets wrong assigned) -> solved throug tracking only target 

-detect merge process -> dont assign 2nd canditate other wise -> stall/delete

-------------------------------do afterclassification improvement----------------------------------------------------------
-save propability over time and take middle
-improve cost_function -> appearance/propability(better classifier needed)

--------------------------------do after rest-------------------------------------------------------------------
-improve gating current > max_cost -> later > kalman predict area
-limit velocity to reasonable value/ calculate better fix bug !!!!!!!!!!!!!!!!!!!!!!!!!!
-link no match cost to velocity/time not to distance

*/
class SegmentTracking
{
private:
	ros::NodeHandle n;
	ros::Subscriber sub;
	ros::Publisher segments_pub;
	ros::Publisher target_marker_pub;
	ros::Publisher pred_way_pub;
	ros::Publisher id_text_pub;
	ros::Publisher target_pub;
	
	HungarianAlgorithm HungAlgo;
	
	struct object {
		int id;
		geometry_msgs::Point32 pos;
		geometry_msgs::Point32 last_pos;
		geometry_msgs::Point32 vel;
		std::queue<float> propability_history;
		float distance;
		bool is_target = false;
		float last_seen = 0.0;
		bool assigned = false;
		float last_pos_change = 0.0;
		
	};
	std::vector<object> known_objects;
	
	float target_propability_treshold = 0.7;
	float tracking_propability_treshold = 0.5;
	
	float init_max_distance = 1.5;
	float legs_max_distance = 0.5;
	float delete_treshold = 5.0; //in s
		
	float no_match_cost; 
	
	
	ros::Time last_time_laser = ros::Time(0);
	
	int id_count = 1;
	tf::Transform last_transform;
	
	
	

public:
	tf::StampedTransform current_transform_stamp;

	SegmentTracking() {
		  		  	
  	target_pub = n.advertise<laser_segmentation::Target>("/target_info",1, true);
		target_marker_pub = n.advertise<visualization_msgs::MarkerArray>("/target_marker", 1, true);
		pred_way_pub = n.advertise<visualization_msgs::MarkerArray>("/pred_way_marker", 1, true);
		id_text_pub = n.advertise<visualization_msgs::MarkerArray>("/id_text_markers", 1, true);
		
		sub = n.subscribe("/classified_segments", 10, &SegmentTracking::pointCloudCallback, this);
		
		
		object cost_calc_obj_1;
		object cost_calc_obj_2;
		cost_calc_obj_1.pos.x = 1;
		no_match_cost = calculate_cost(cost_calc_obj_1, cost_calc_obj_2); //calcuclate max cost for assignment by distance of dummy objects
		ROS_INFO("no_match_cost: %f",no_match_cost);
	}
	
	
//*************************************************************************************************************//
//																							callback loop																									 //
//*************************************************************************************************************//

	void pointCloudCallback(const laser_features::Featured_segments &msg)
	{		
		//************time calculation*********************************
		auto time_1 = std::chrono::high_resolution_clock::now();
		ros::Time new_time_laser = msg.odom.header.stamp;
		double passed_time = (new_time_laser-last_time_laser).toSec();
		ROS_INFO("passed_time:%lf",passed_time);
		last_time_laser = new_time_laser;

		
		//************transform calculation*****************************
		tf::Quaternion laser_frame_quat(msg.odom.pose.pose.orientation.x,msg.odom.pose.pose.orientation.y,msg.odom.pose.pose.orientation.z,msg.odom.pose.pose.orientation.w);
		tf::Vector3 laser_frame_vec(msg.odom.pose.pose.position.x,msg.odom.pose.pose.position.y,msg.odom.pose.pose.position.z);
		tf::Transform new_transform(laser_frame_quat, laser_frame_vec);
		tf::Transform difference_transform = calculate_transform(new_transform,last_transform);
	  
	  last_transform = new_transform;
	  
			
		//************safe measured objects*****************************
		std::vector<object> measured_objects = meassure_objects(msg);
		if(measured_objects.empty())
			return;
			
			
		//************init() save all initial mesaurements into array***
		if(known_objects.empty()) {
			id_count = 1;
			for(int i =0; i<measured_objects.size(); i++) {
				if(measured_objects[i].propability_history.back() > tracking_propability_treshold) {
					object new_object = measured_objects[i];
					new_object.id = id_count;
					id_count++;				
					known_objects.push_back(new_object);
				}
			}
		//************update objects	**********************************
		} else {			
			vector <object> predicted_objects; 	//kown object predictet by last knewn state
			vector <object> new_objects; 				//new objects states
			
			predicted_objects = known_objects;
			predicted_objects = predict_objects(known_objects,passed_time); //currently not predicting
			predicted_objects = apply_transform_change(predicted_objects, difference_transform);
			visualize_pred_way(msg.header, known_objects, predicted_objects);
			vector<int> assignment = find_best_assignment(predicted_objects, measured_objects, new_objects, passed_time);

			//assign best guess to known objects
			for(int i = 0; i<assignment.size(); i++) {
				if(assignment[i] >= 0) {
					//ROS_INFO("assignment: %i -> %i cost: %lf",i,assignment[i],costMatrix[i][assignment[i]]);
					measured_objects[assignment[i]].assigned = true;
					object new_object = measured_objects[assignment[i]];
					new_object.propability_history.swap(predicted_objects[i].propability_history);
					new_object.propability_history.push(predicted_objects[i].propability_history.front());
					
					new_object.id = predicted_objects[i].id;
					new_object.is_target = predicted_objects[i].is_target;
					new_object.vel = update_velocity(known_objects[i], new_object, passed_time, difference_transform); //attentoN!!!!!!!!!!!!!!!!
					new_object.last_pos_change = calculate_2_point_distance(new_object.pos,known_objects[i].pos);
					if(is_leg(new_object)) {
						new_objects.push_back(new_object);
					}
				}
				else {
					if(is_leg(predicted_objects[i])) {
						stall_object(new_objects,predicted_objects[i],passed_time);	
					}		
				}
			}
					
			//if no suitable object for meassurements are found create new objects
			for(int i = 0; i<measured_objects.size(); i++) {
				if(measured_objects[i].assigned == false && measured_objects[i].propability_history.back() > tracking_propability_treshold) {
					measured_objects[i].assigned = true;
					measured_objects[i].id = id_count;
					id_count++;
					new_objects.push_back(measured_objects[i]);
				}
			}
					
			known_objects = new_objects;
						
			
				
			//--------------------------publish and visualize results-----------------------------------				
			publish_target_pos(msg.header, known_objects);
			visualize_target(known_objects, msg.header);
			visualize_ids(known_objects,msg.header);
		}
		
		mark_target(known_objects);
		
		//**********************footer/execution time calculation**********************************************************
		
		auto time_2 = std::chrono::high_resolution_clock::now();
		float execution_time = std::chrono::duration_cast<std::chrono::microseconds>(time_2 - time_1).count()/10e6;
		//ROS_INFO("Execution time: %f",execution_time);//float e_t = execution_time.count();
	}
	
	
	
	
	
//****************************************************************************************************//	
//-----------------------------HELPER-FUNCTIONS-------------------------------------------------------//
//****************************************************************************************************//
	
	bool is_leg(object obj) {
		if(obj.is_target || propability_average(obj.propability_history) > tracking_propability_treshold || propability_max(obj.propability_history) > target_propability_treshold) {
			return true;
		} else {
	 		return false;
		}
	
	}
	
	float propability_max(std::queue<float> propability_history) {
		float max = 0.0;
		while(!propability_history.empty()) {
			if(propability_history.front()>max)
			 max = propability_history.front();
			propability_history.pop();
		}
		return max;		
	}
	
	float propability_average(std::queue<float> propability_history) {
		float average = 0.0;
		int count = propability_history.size();
		while(!propability_history.empty()) {
			average += propability_history.front()/count;
			propability_history.pop();
		}
		return average;
	}
	
	
	vector<int> find_best_assignment(vector<object>& predicted_objects, vector<object>& measured_objects, vector<object>& new_objects,const float passed_time) {
		vector< vector<double> > costMatrix;
		vector<int> assignment;

		//calculate all costs
		costMatrix.resize(predicted_objects.size());
		//ROS_INFO("Cost Matrix: \n");
		for(int i = 0; i < predicted_objects.size(); i++) {
			for(int j = 0; j < measured_objects.size(); j++) {
				double cost = calculate_cost(predicted_objects[i],measured_objects[j]);
				costMatrix[i].push_back(cost);
				//std::cout << costMatrix[i][j] << ",";
			}
			//std::cout << "\n";
		}
	
		//solve linear assignment problem
		double cost = HungAlgo.Solve(costMatrix, assignment);
		ROS_INFO("assignment cost: %lf", cost);

		//unassign if over treshold
		for(int i = 0; i<assignment.size();i++) {
			if(costMatrix[i][assignment[i]] >= no_match_cost) {
				assignment[i] = -1;
			}
		}
			
		return (assignment);
	}



	void publish_target_pos(const std_msgs::Header header, const std::vector<object> known_objects) {
		laser_segmentation::Target target_msg;
		target_msg.header = header;
		target_msg.last_seen = -1.0;
				
		object target;
		int n_target_found = 0;
		for(int i = 0; i<known_objects.size(); i++) {
			if(known_objects[i].is_target && known_objects[i].last_seen == 0.0) {
				n_target_found += 1;
				target = known_objects[i];
				target_msg.pos.x += target.pos.x;
				target_msg.pos.y += target.pos.y;
				target_msg.pos.z += target.pos.z;
				target_msg.vel.x += target.vel.x;
				target_msg.vel.y += target.vel.y;
				target_msg.vel.z += target.vel.z;
				
				if(target_msg.last_seen == -1 || target_msg.last_seen > target.last_seen)
					target_msg.last_seen = target.last_seen;
			}
		}
		target_msg.pos.x = target_msg.pos.x/n_target_found;
		target_msg.pos.y = target_msg.pos.y/n_target_found;
		target_msg.pos.z = target_msg.pos.z/n_target_found;
		target_msg.vel.x = target_msg.vel.x/n_target_found;
		target_msg.vel.y = target_msg.vel.y/n_target_found;
		target_msg.vel.z = target_msg.vel.z/n_target_found;
		
		if(n_target_found > 0)
			target_pub.publish(target_msg);
	}

	
	std::vector<object> meassure_objects(const laser_features::Featured_segments &msg)
	{
		std::vector<object> measured_objects;
		for(auto &segment: msg.segments) {
			object new_measurement;
			new_measurement.id = -1;
			new_measurement.pos = segment.center;
			geometry_msgs::Point32 zero_vel; zero_vel.x = 0; zero_vel.y = 0; zero_vel.z = 0;
			new_measurement.vel = zero_vel;
			new_measurement.propability_history.push(segment.class_id);
			new_measurement.distance = segment.distance_to_origin;
			measured_objects.push_back(new_measurement);
		}
		return measured_objects;
	}

	//calculate last seen time and save if below time treshhold else let fall
	void stall_object(std::vector<object>& new_objects, const object old_object, const float passed_time) 
	{
		object new_object = old_object;
		new_object.last_seen += passed_time;
		if(new_object.last_seen < delete_treshold) {
			new_object.vel.x = 0.0;//new_object.vel.x/2;
			new_object.vel.y = 0.0;//new_object.vel.y/2;
			new_object.vel.z = 0.0;//new_object.vel.z/2;
			new_objects.push_back(new_object);
		}
	}
	
	geometry_msgs::Point32 predict_position(geometry_msgs::Point32 pos, const geometry_msgs::Point32 vel, const float passed_time) 
	{
		pos.x = pos.x + vel.x*passed_time;
		pos.y = pos.y + vel.y*passed_time;
		pos.z = pos.z + vel.z*passed_time;
		return pos;
	}
	
	geometry_msgs::Point32 update_velocity(object old_obj, object new_obj, float passed_time, tf::Transform transform)
	{
		
		if(old_obj.pos.x == 0.0 && old_obj.pos.y == 0.0 && old_obj.pos.z == 0.0 ) {
			return old_obj.pos;
		}
		passed_time = passed_time + old_obj.last_seen;
		
		old_obj.pos = apply_rotation_change(old_obj.pos, transform.getBasis());
		old_obj.pos = apply_translation_change(old_obj.pos, transform.getOrigin());
				
		geometry_msgs::Point32 vel;
		vel.x = (new_obj.pos.x - old_obj.pos.x)/passed_time/3;
		vel.y = (new_obj.pos.y - old_obj.pos.y)/passed_time/3;
		vel.z = (new_obj.pos.z - old_obj.pos.z)/passed_time/3;
		
		
		//ROS_INFO("vel: (%f,%f), old_pos: (%f,%f), new_pos: (%f,%f), passed_time: %f",vel.x, vel.y, old_obj.pos.x, old_obj.pos.y, new_obj.pos.x, new_obj.pos.y, passed_time);
		return vel;		
	}

	void mark_target(std::vector<object>& known_objects) {
		int n_target_found = 0;
		ROS_INFO("n_objects %lu",known_objects.size());
		if(known_objects.size() == 0)
			return;
		
		for(int i = 0; i<known_objects.size(); i++) {
			if(known_objects[i].is_target == true) {
				n_target_found += 1;
			}
		}
		ROS_INFO("n_target %i",n_target_found);
		
		if(n_target_found <= 0) {
			n_target_found = 0;
			object dummy_object;
			dummy_object.distance = std::numeric_limits<float>::infinity();
			object * best_object = &dummy_object;
			
			for(int i =0; i<known_objects.size(); i++) {
				if(propability_max(known_objects[i].propability_history) >= target_propability_treshold && known_objects[i].distance < best_object->distance) 
				{
					best_object = &known_objects[i];
				}					
			}
			if(best_object == &dummy_object)
				return;
			ROS_INFO("Searching for target... best object distance: %f propability: %f",best_object->distance,best_object->propability_history.back());
	
			if(best_object->distance < init_max_distance) {
				best_object->is_target = true;
				n_target_found = 1;
				ROS_INFO("first target found!");
			}
		}
		if(n_target_found ==1) {
			object * target_object;
			for(int i =0; i<known_objects.size(); i++) {
				if(known_objects[i].is_target == true) {
					target_object = &known_objects[i];
					break;
				}
			}
			object * nearest_neighbour_object = find_nearest_neighbour(known_objects,*target_object);//cant use nearest neigbour id attribute because may be out of date or object list may be changed
			float distance = calculate_2_point_distance(target_object->pos,nearest_neighbour_object->pos);
			if(propability_max(nearest_neighbour_object->propability_history) > tracking_propability_treshold && distance < legs_max_distance) {
			 nearest_neighbour_object->is_target = true;
			 n_target_found = 2;
			}
		}
		
		if(n_target_found ==2) {
			int n_target_found = 0;
			int id_target_1 = -1;
			int id_target_2 = -1;
			for(int i = 0; i<known_objects.size(); i++) {
				if(known_objects[i].is_target == true) {
					n_target_found += 1;
					if(n_target_found == 1) {
					 id_target_1 = i;
					} else if(n_target_found == 2) {	
					 id_target_2 = i;
					}
				}
			}
			
			
			float distance = calculate_2_point_distance(known_objects[id_target_1].pos,known_objects[id_target_2].pos);
			ROS_INFO("2 target distance: %f",distance);
			if(distance >= legs_max_distance) {
				if(known_objects[id_target_1].last_pos_change > known_objects[id_target_2].last_pos_change) {
					known_objects[id_target_1].is_target = false;
				} else {
					known_objects[id_target_2].is_target = false;
				}
			}
			//check targets -> nn_relationship
		}
		
		n_target_found = 0;
		for(int i = 0; i<known_objects.size(); i++) {
			if(known_objects[i].is_target == true) {
				n_target_found += 1;
			}
		}
		ROS_INFO("n_target after: %i",n_target_found);
		
		
	}
	
	object * find_nearest_neighbour(std::vector<object>& known_objects, object& target_object) {
		object dummy_object;
		object * nearest_neighbour_object = &dummy_object;
		float min_distance = std::numeric_limits<float>::infinity();
		geometry_msgs::Point32 pos_target = target_object.pos;
		for(int i =0; i<known_objects.size(); i++) {
			geometry_msgs::Point32 pos_second_target = known_objects[i].pos;
			float distance = calculate_2_point_distance(pos_target,pos_second_target);
			if(distance < min_distance && distance > 0.0) {
				min_distance = distance;
				nearest_neighbour_object = &known_objects[i];
			}
		}
		return nearest_neighbour_object;
	}
	
	void reset_target() {
		ROS_INFO("reseting target!");
		known_objects.clear();
		for(int i =0; i<known_objects.size(); i++) {
			known_objects[i].is_target = false;
		}
	}
	
	
	tf::Transform calculate_transform(tf::Transform old_trans, tf::Transform new_trans){

  	tf::Transform difference_transform; 	
		tf::Matrix3x3 rotation_matrix = new_trans.getBasis().transpose() * old_trans.getBasis();
		tf::Vector3 translation_vector = new_trans.getOrigin() - old_trans.getOrigin();
		difference_transform = tf::Transform(rotation_matrix,translation_vector);
		
		return difference_transform;
	}
	
	
	
	
	geometry_msgs::Point32 apply_rotation_change(geometry_msgs::Point32 point, tf::Matrix3x3 rotation_matrix){
		tf::Vector3 tf_point(point.x,point.y,point.z);
		tf_point = tf_point*rotation_matrix;
		
		geometry_msgs::Point32 transformed_point;
	  transformed_point.x = tf_point.x();
	  transformed_point.y = tf_point.y();
	  transformed_point.z = tf_point.z();
	  
	  return transformed_point;
	}
	
	geometry_msgs::Point32 apply_translation_change(geometry_msgs::Point32 point, tf::Vector3 translation_vector){
		tf::Vector3 tf_point(point.x,point.y,point.z);
		tf_point = tf_point+translation_vector;
		
		geometry_msgs::Point32 transformed_point;
	  transformed_point.x = tf_point.x();
	  transformed_point.y = tf_point.y();
	  transformed_point.z = tf_point.z();
	  
	  return transformed_point;
	}

	vector<object> apply_transform_change(vector<object> predicted_objects, tf::Transform difference_transform) {
			vector<object> transformed_objects;

			for(int i=0;i<predicted_objects.size(); i++) {
				object predicted_obj = predicted_objects[i];
				predicted_obj.pos = apply_rotation_change(predicted_obj.pos,difference_transform.getBasis());
				predicted_obj.vel = apply_rotation_change(predicted_obj.vel,difference_transform.getBasis());
				predicted_obj.pos = apply_translation_change(predicted_obj.pos,difference_transform.getOrigin());
				
				//tf::Vector3 tf_pos(predicted_obj.pos.x,predicted_obj.pos.y,predicted_obj.pos.z);
			  //tf_pos = tf_pos*difference_transform.getBasis();
			  //tf_pos = tf_pos+difference_transform.getOrigin();
			  
			  
			  //predicted_obj.pos.x = tf_pos.x();
			  //predicted_obj.pos.y = tf_pos.y();
			  //predicted_obj.pos.z = tf_pos.z();
			  
			  transformed_objects.push_back(predicted_obj);
			}
			

	      
			//--------------------------------
			return transformed_objects;
	}
	

	vector<object> predict_objects(vector<object> predicted_objects, const float passed_time) {
			for(int i = 0; i < known_objects.size(); i++) {
				predicted_objects[i].pos = predict_position(predicted_objects[i].pos, predicted_objects[i].vel, passed_time);
			}
			return predicted_objects;
	}
	
	double calculate_cost(object A, object B){
		float object_distance = calculate_2_point_distance(A.pos, B.pos);
		double cost = pow(object_distance,2.0);
		//ROS_INFO("cost_claclulation: A=(%f,%f,%f), B=(%f,%f,%f), cost=%lf",A.pos.x,A.pos.y,A.pos.z,B.pos.x,B.pos.y,B.pos.z,cost);
		return cost;
	}
	
	float calculate_2_point_distance(geometry_msgs::Point32 A,geometry_msgs::Point32 B) {
		return sqrt(pow(A.x-B.x,2.0)+pow(A.y-B.y,2.0)+pow(A.z-B.z,2.0));
	}
		
		
//*************************************************************************************************************//
//																							VISUALIZATION																									 //
//*************************************************************************************************************//

	void visualize_ids(const std::vector<object> known_objects, const std_msgs::Header header) {
		visualization_msgs::MarkerArray id_text_array;
		visualization_msgs::Marker id_text;
		id_text.header = header;
		id_text.action= id_text.DELETEALL;
		id_text_array.markers.push_back(id_text);
		id_text_pub.publish(id_text_array);
		
		for(auto obj : known_objects) {
			visualization_msgs::Marker id_text;
			
			id_text.header = header;
			id_text.ns = "class_text";
			id_text.action = id_text.ADD;
			id_text.pose.orientation.w = 1.0;
			id_text.id = obj.id;
			id_text.type = id_text.TEXT_VIEW_FACING;

			id_text.scale.z = 0.05;
	
			id_text.color.a = 1.0 - 1.0*(obj.last_seen/delete_treshold);
			id_text.color.r = 1.0;
			id_text.color.g = 1.0;
			id_text.color.b = 1.0;
			id_text.text = std::to_string(id_text.id);
			id_text.pose.position.x = (obj.pos.x);
			id_text.pose.position.y = (obj.pos.y);
			id_text.pose.position.z = (obj.pos.z);
			id_text_array.markers.push_back(id_text);
		}
		
		id_text_pub.publish(id_text_array);
		
	}
	
	void visualize_target(const std::vector<object> known_objects, const std_msgs::Header header) {
		//ROS_INFO("visualizing....  ");
		visualization_msgs::MarkerArray target_arrow_array;
		visualization_msgs::Marker del_arrow;
		del_arrow.header = header;
		del_arrow.action= del_arrow.DELETEALL;
		target_arrow_array.markers.push_back(del_arrow);
		target_marker_pub.publish(target_arrow_array);
		
		
		for(int i = 0; i<known_objects.size(); i++) {
			if(known_objects[i].is_target) {
				visualization_msgs::Marker arrow;
				object target = known_objects[i];
				
				arrow.header = header;
				arrow.ns = "target";
				arrow.action = visualization_msgs::Marker::ADD;
				arrow.pose.orientation.w = 1.0;
				arrow.id = i;
				arrow.type = visualization_msgs::Marker::ARROW;
	
				geometry_msgs::Point arrow_start;
				geometry_msgs::Point arrow_end;
				arrow_start.x = target.pos.x; arrow_start.y = target.pos.y; arrow_start.z = target.pos.z+0.15;
				arrow_end.x = target.pos.x; arrow_end.y = target.pos.y; arrow_end.z = target.pos.z;
				arrow.points.push_back(arrow_start);
				arrow.points.push_back(arrow_end);
	
	
				arrow.scale.x = 0.02; //shaft dia
				arrow.scale.y = 0.03;	//head dia
				arrow.scale.z = 0.05;	//head length
	
				arrow.color.a = 1.0;
				arrow.color.r = 1.0;
				arrow.color.g = 1.0;
				arrow.color.b = 1.0;
				target_arrow_array.markers.push_back(arrow);
			}
		}
		
		target_marker_pub.publish(target_arrow_array);
		//ROS_INFO("target visualization published");
	}
	
	void visualize_pred_way(std_msgs::Header header,const std::vector<object> known_objects, const std::vector<object> predicted_objects) {
		
		visualization_msgs::MarkerArray pred_way_arrow_array;
		visualization_msgs::Marker del_arrow;
		del_arrow.header = header;
		del_arrow.action= del_arrow.DELETEALL;
		pred_way_arrow_array.markers.push_back(del_arrow);
		pred_way_pub.publish(pred_way_arrow_array);
		
		
		for(int i = 0; i<known_objects.size(); i++) {
			//if(known_objects[i].is_target) {
				visualization_msgs::Marker pred_way_arrow;
				pred_way_arrow.header = header;
				pred_way_arrow.ns = "pred_way";
				pred_way_arrow.action = visualization_msgs::Marker::ADD;
				pred_way_arrow.pose.orientation.w = 1.0;
				pred_way_arrow.id = i;
				pred_way_arrow.type = visualization_msgs::Marker::ARROW;
		
				geometry_msgs::Point pred_way_arrow_start;
				geometry_msgs::Point pred_way_arrow_end;
		
				pred_way_arrow_start.x = known_objects[i].pos.x;
				pred_way_arrow_start.y = known_objects[i].pos.y;
				pred_way_arrow_start.z = known_objects[i].pos.z;
		
				pred_way_arrow_end.x = predicted_objects[i].pos.x;
				pred_way_arrow_end.y = predicted_objects[i].pos.y;
				pred_way_arrow_end.z = predicted_objects[i].pos.z;
				pred_way_arrow.points.push_back(pred_way_arrow_start);
				pred_way_arrow.points.push_back(pred_way_arrow_end);
		
		
				pred_way_arrow.scale.x = 0.02; 	//shaft dia
				pred_way_arrow.scale.y = 0.03;	//head dia
				pred_way_arrow.scale.z = 0.05;	//head length
		
				pred_way_arrow.color.a = 1.0;
				pred_way_arrow.color.r = 1.0;
				pred_way_arrow.color.g = 1.0;
				pred_way_arrow.color.b = 1.0;
				pred_way_arrow_array.markers.push_back(pred_way_arrow);
			//}
		}
		
		pred_way_pub.publish(pred_way_arrow_array);
	}
};

//********************************************************************************************************//
//																									main																									//
//********************************************************************************************************//

int _kbhit() {
    static const int STDIN = 0;
    static bool initialized = false;

    if (! initialized) {
        // Use termios to turn off line buffering
        termios term;
        tcgetattr(STDIN, &term);
        term.c_lflag &= ~ICANON;
        tcsetattr(STDIN, TCSANOW, &term);
        setbuf(stdin, NULL);
        initialized = true;
    }

    int bytesWaiting;
    ioctl(STDIN, FIONREAD, &bytesWaiting);
    return bytesWaiting;
}


int main(int argc, char **argv)
{
  ros::init(argc, argv, "segmentTracker");

	//ROS_INFO("ARG: %s", argv[1]);
		
  SegmentTracking STObject;

	ros::Rate r(100);
  while (ros::ok())
	{		
		if(_kbhit()) {
			int c = getchar();
  		if (c == 'r' || c == 'R')
  			STObject.reset_target();
  	} 	
		ros::spinOnce();
		r.sleep();
	}

  return 0;
}
