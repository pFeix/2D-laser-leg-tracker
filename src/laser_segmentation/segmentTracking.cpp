#include "ros/ros.h"
#include "sensor_msgs/PointCloud.h"
#include "std_msgs/Header.h"
#include "laser_features/Featured_segments.h"
#include "laser_features/Segment_featured.h"
#include "hungarian-algorithm/Hungarian.h"
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <queue>

/*
TO DO:
-add max_cost_treshhold for assignment -> if creater recaclulate assignment/use next best solution/!!set cost to infity!! (exp func)
-improve cost_function
-gating ?
-if target_number < 2 get nearestN of target and if > treshhold also target
-prevent target from get lost ? e.g. target gets not assignt because other object has only a bit lower cost -> pririze target ? or improve scoring/segmenting
-reinitilize via key -> segment tracking from beginning -> select target on init

-save propability over time and take middle


*/
class SegmentTracking
{
private:
	ros::NodeHandle n;
	ros::Subscriber sub;
	ros::Publisher segments_pub;
	ros::Publisher target_pub;
	ros::Publisher pred_way_pub;
	ros::Publisher id_text_pub;
	
	HungarianAlgorithm HungAlgo;
	
	const static int max_queue_length = 5; 
	std::queue<laser_features::Featured_segments> segment_queue;
	
	struct object {
		int id;
		geometry_msgs::Point32 pos;
		geometry_msgs::Point32 vel;
		float propability;
		float distance;
		bool is_target = false;
		float last_seen = 0.0;
		bool assigned = false;
	};
	std::vector<object> known_objects;
	
	float init_propability_treshold = 0.7;
	
	float init_max_distance = 1.5;
	float scan_max_distance = 1.0;
	float delete_treshold = 3.0;
	
	ros::Time last_time = ros::Time(0);
	
	bool has_target = false;
	int id_count = 1;
	
	
	
	

public:

	SegmentTracking() {
		  		  	
  	//segments_pub = n.advertise<laser_segmentation::PointCloudSegmented>("/pointcloud_segments",100000, true);
		target_pub = n.advertise<visualization_msgs::Marker>("/target_marker", 1, true);
		pred_way_pub = n.advertise<visualization_msgs::Marker>("/pred_way_marker", 1, true);
		id_text_pub = n.advertise<visualization_msgs::MarkerArray>("/id_text_markers", 1, true);
		
		sub = n.subscribe("/classified_segments", 10, &SegmentTracking::pointCloudCallback, this);
	}
	
	   
	void pointCloudCallback(const laser_features::Featured_segments &msg)
	{
		double passed_time = (msg.header.stamp-last_time).toSec();
		if(last_time == ros::Time(0) || passed_time <= 0.0 || passed_time > 5.0)
			passed_time = 0.0;
		last_time = msg.header.stamp;
		ROS_INFO("passed_time:%lf",passed_time);
		
		
		
		//segment_queue.push(msg);
		//while(segment_queue.size() > max_queue_length)
		//	segment_queue.pop();
		//----------------------------------------------------------------------------------------------
		//---------------safe measured objects above threshold---------------------------------
		std::vector<object> measured_objects;
		for(auto &segment: msg.segments) {
			//ROS_INFO("%f",segment.class_id);
			object new_measurement;
			new_measurement.id = -1;
			new_measurement.pos = segment.center;
			geometry_msgs::Point32 zero_vel; zero_vel.x = 0; zero_vel.y = 0; zero_vel.z = 0;
			new_measurement.vel = zero_vel;
			new_measurement.propability = segment.class_id;
			new_measurement.distance = segment.distance;
			measured_objects.push_back(new_measurement);
			//ROS_INFO("prop: %f, tresh: %f",new_measurement.propability,init_propability_treshold);
			
			
		}
		//ROS_INFO("measured objects: %lu", measured_objects.size());
		if(measured_objects.empty())
			return;
			
			
		// if no target known save all initial mesaurements into array
		if(!has_target) {
			known_objects.clear();
			object dummy_object;
			dummy_object.distance = std::numeric_limits<float>::infinity();
			object * best_object = &dummy_object;
			id_count = 1;
		
			for(int i =0; i<measured_objects.size(); i++) {
				object new_object = measured_objects[i];
				new_object.id = id_count;
				id_count++;				
				known_objects.push_back(new_object);
				//ROS_INFO("prop: %f, tresh: %f",known_objects[i].propability,init_propability_treshold);
				if(known_objects.back().propability >= init_propability_treshold && known_objects[i].distance < best_object->distance) {
					best_object = &known_objects[i]; //falsch ?
				}
			}
			ROS_INFO("Searching for target... best object distance: %f propability: %f",best_object->distance,best_object->propability);
			if(best_object->distance < init_max_distance) {
				best_object->is_target = true;
				has_target = true;
				ROS_INFO("first target found!");
			}
			
		// if target nown update positions	
		} else {
			int n_objects = known_objects.size();
			int n_meassured = measured_objects.size();
			
			object predicted_objects[n_objects];
			
			//predict next objects position
			for(int i = 0; i < n_objects; i++) {
				predicted_objects[i] = predict_object(known_objects[i],passed_time);
				//std::cout << predicted_objects[i].pos.y;
			}
		
			//calculate all costs
			//									h							w
			//float costMatrix[n_objects][n_meassured];
			vector< vector<double> > costMatrix(n_objects);
			//ROS_INFO("Cost Matrix: \n");
			for(int i = 0; i < n_objects; i++) {
				for(int j = 0; j < n_meassured; j++) {
					costMatrix[i].push_back(calculate_cost(predicted_objects[i],measured_objects[j]));
					//std::cout << costMatrix[i][j] << ",";
				}
				//std::cout << "\n";
			}
			
			
			
			//find best guess
			vector<int> assignment;
			double cost = HungAlgo.Solve(costMatrix, assignment);
			vector<int> marked_for_delete;
			
			//ROS_INFO("n_objects: %i n_meassured: %i",n_objects,n_meassured);
			
			
			vector <object> new_objects;
			for(int i = 0; i<assignment.size(); i++) {
				//assign best guess to known objects
				if(assignment[i] >= 0) {
					object new_object = measured_objects[assignment[i]];
					measured_objects[assignment[i]].assigned = true;
					
					
					new_object.id = known_objects[i].id;
					new_object.is_target = known_objects[i].is_target;
					new_object.vel.x = (new_object.pos.x - known_objects[i].pos.x);
					new_object.vel.y = (new_object.pos.y - known_objects[i].pos.y);
					new_object.vel.z = (new_object.pos.z - known_objects[i].pos.z);
		
					new_objects.push_back(new_object);
				}
				//calculate last seen time and save if below time treshhold
				else {
					object new_object = known_objects[i];
					new_object.last_seen += passed_time;
					new_object.pos.x = new_object.pos.x + new_object.vel.x;
					new_object.pos.y = new_object.pos.y + new_object.vel.y;
					new_object.pos.z = new_object.pos.z + new_object.vel.z;
					if(new_object.last_seen < delete_treshold) {
						new_objects.push_back(new_object);
					}
					
				}
			}
			
			
			
			//if no suitable meassurements are found create new objects
			for(int i = 0; i<n_meassured; i++) {
				if(measured_objects[i].assigned == false) {
					measured_objects[i].assigned = true;
					measured_objects[i].id = id_count;
					id_count++;
					new_objects.push_back(measured_objects[i]);
				}
			}
			
			
			known_objects = new_objects;
						

			visualize_target(known_objects, msg.header);
			visualize_ids(known_objects,msg.header);
		
		
		/*
			//--------------------------------single target tracking---------------------------------------------------------------------
			//predict next object position
			object predicted_obj = predict_object(known_objects[0],passed_time);
			
			
			//calculate all costs and find best guess
			object best_guess;
			float min_cost = std::numeric_limits<float>::infinity();
			for(int i =0; i<=measured_objects.size(); i++) {
				float cost = calculate_cost(measured_objects[i], predicted_obj);
				if(cost < min_cost) {
					min_cost = cost;
					best_guess = measured_objects[i];
				}
			}
			//calculate velocity for next update from last known and current position + visualize pos
			//ROS_INFO("min_cost: %f",min_cost);
			if(min_cost < scan_max_distance) {
				geometry_msgs::Point32 vel;
				vel.x = (best_guess.pos.x - known_objects[0].pos.x);
				vel.y = (best_guess.pos.y - known_objects[0].pos.y);
				vel.z = (best_guess.pos.z - known_objects[0].pos.z);
				best_guess.vel = vel;
				known_objects[0] = best_guess;
				visualize_target(known_objects, msg);
				visualize_pred_way(msg.header, best_guess.pos, best_guess.vel, passed_time);
			}
			*/
		}
	}
	
	
	
	
	
	
////-----------------------------HELPER-FUNCTIONS-------------------------------------------------------
	object predict_object(object known_object, float passed_time) {
			object predicted_obj = known_object;
			predicted_obj.pos.x = predicted_obj.pos.x + predicted_obj.vel.x*passed_time;
			predicted_obj.pos.y = predicted_obj.pos.y + predicted_obj.vel.y*passed_time;
			predicted_obj.pos.z = predicted_obj.pos.z + predicted_obj.vel.z*passed_time;
			return predicted_obj;
	}
	
//	float calculate_matching_score(object A, object B){
//	
//	}
	
	float calculate_cost(object A, object B){
		float object_distance = calculate_2_point_distance(A.pos, B.pos);
		float cost = pow(object_distance,2.0);
		return cost;
	}
	
	float calculate_2_point_distance(geometry_msgs::Point32 A,geometry_msgs::Point32 B) {
		return sqrt(pow(A.x-B.x,2)+pow(A.y-B.y,2)+pow(A.z-B.z,2));
	}
	
	
	
	
	
	
////-----------------------------------------------VISUALIZATION!!!------------------------------------------------------------------------------------------------------------------------------
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
		object target;
		for(int i = 0; i<known_objects.size(); i++) {
			if(known_objects[i].is_target)
				target = known_objects[i];
		}
		
		//object target = known_objects[0];
		visualization_msgs::Marker arrow;
		arrow.header = header;
		arrow.ns = "target";
		arrow.action = visualization_msgs::Marker::MODIFY;
		arrow.pose.orientation.w = 1.0;
		arrow.id = 0;
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
		
		target_pub.publish(arrow);
		//ROS_INFO("target visualization published");
		

	}
	
	void visualize_pred_way(std_msgs::Header header,geometry_msgs::Point32 pos, geometry_msgs::Point32 vel, float passed_time) {
		visualization_msgs::Marker pred_way_arrow;
		pred_way_arrow.header = header;
		pred_way_arrow.ns = "pred_way";
		pred_way_arrow.action = visualization_msgs::Marker::MODIFY;
		pred_way_arrow.pose.orientation.w = 1.0;
		pred_way_arrow.id = 0;
		pred_way_arrow.type = visualization_msgs::Marker::ARROW;
		
		geometry_msgs::Point pred_way_arrow_start;
		geometry_msgs::Point pred_way_arrow_end;
		
		pred_way_arrow_start.x = pos.x;
		pred_way_arrow_start.y = pos.y;
		pred_way_arrow_start.z = pos.z;
		
		pred_way_arrow_end.x = pos.x + vel.x*passed_time;
		pred_way_arrow_end.y = pos.y + vel.y*passed_time;
		pred_way_arrow_end.z = pos.z + vel.z*passed_time;
		pred_way_arrow.points.push_back(pred_way_arrow_start);
		pred_way_arrow.points.push_back(pred_way_arrow_end);
		
		
		pred_way_arrow.scale.x = 0.02; 	//shaft dia
		pred_way_arrow.scale.y = 0.03;	//head dia
		pred_way_arrow.scale.z = 0.05;	//head length
		
		pred_way_arrow.color.a = 1.0;
		pred_way_arrow.color.r = 1.0;
		pred_way_arrow.color.g = 1.0;
		pred_way_arrow.color.b = 1.0;
		
		pred_way_pub.publish(pred_way_arrow);
	}
	

};


int main(int argc, char **argv)
{
  ros::init(argc, argv, "segmentTracker");

	//ROS_INFO("ARG: %s", argv[1]);
	
  SegmentTracking STObject;
   
  ros::spin();

  return 0;
}
