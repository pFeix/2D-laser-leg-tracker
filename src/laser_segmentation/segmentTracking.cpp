#include "ros/ros.h"
#include "sensor_msgs/PointCloud.h"
#include "std_msgs/Header.h"
#include "laser_features/Featured_segments.h"
#include "laser_features/Segment_featured.h"
#include "hungarian-algorithm/Hungarian.h"
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <chrono>


//for keyboard input
#include <stdio.h>
#include <sys/select.h>
#include <termios.h>
#include <stropts.h>
#include <sys/ioctl.h>

/*
TO DO:
-to prevent assignment at any cost -> include meassure not available with high cost(not to high/calclulate cost for specific values) -> handle as if not assigned //study source again

-add max_cost_treshhold for assignment -> if greater recaclulate assignment/use next best solution/set cost to infity/UPPER ONE

 
--------------------------------do after rest/segmentation-----------------------------------
-if target_number < 2 get nearestN of target and if > treshhold also target (increases target not getting lost)

-prevent target from get lost(segment error) ? e.g. target gets not assignt because other object has only a bit lower cost -> priotize target (bad idea? because target gets assigned even if not true) ? or just improve scoring/segmenting

-------------------------------do afterclassification improvement----------------------------------------------------------
-save propability over time and take middle
-improve cost_function -> appearance ? propability(better classifier needed)

--------------------------------do after rest-------------------------------------------------------------------
-gating erst treshhold distance spaeter kalman predict
-limit velocity to reasonable value/ calculate better
-link no match cost to velocity and time not to distance

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
	float association_velocity_treshhold = 1.4; //in m/s
	
	float init_max_distance = 1.5;
	float scan_max_distance = 1.0;
	float delete_treshold = 3.0;
		
	float no_match_cost; 
	
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
		
		
		object cost_calc_obj_1;
		object cost_calc_obj_2;
		cost_calc_obj_1.pos.x = 1;
		no_match_cost = calculate_cost(cost_calc_obj_1, cost_calc_obj_2);
	}
	

	void pointCloudCallback(const laser_features::Featured_segments &msg)
	{
		auto time_1 = std::chrono::high_resolution_clock::now();
		double passed_time = (msg.header.stamp-last_time).toSec();
		if(last_time == ros::Time(0) || passed_time <= 0.0 || passed_time > 5.0)
			passed_time = 0.0;
		last_time = msg.header.stamp;
		ROS_INFO("passed_time:%lf",passed_time);
		
		
		//---------------safe measured objects ---------------------------------
		std::vector<object> measured_objects = meassure_objects(msg);
		if(measured_objects.empty())
			return;
			
			
		// init() save all initial mesaurements into array
		if(known_objects.empty()) {
			id_count = 1;
			for(int i =0; i<measured_objects.size(); i++) {
				object new_object = measured_objects[i];
				new_object.id = id_count;
				id_count++;				
				known_objects.push_back(new_object);
				mark_target(known_objects);
			}
		//update objects	
		} else {
			//ROS_INFO("n_objects: %i n_meassured: %i",known_objects.size(),measured_objects.size());
			
			object predicted_objects[known_objects.size()]; //kown object predictet by last knewn state
			vector <object> new_objects; 										//new objects states
			
			//predict next objects position
			for(int i = 0; i < known_objects.size(); i++) {
				predicted_objects[i] = predict_object(known_objects[i],passed_time);
			}
		
			//calculate all costs
			vector< vector<double> > costMatrix(known_objects.size());
			ROS_INFO("Cost Matrix: \n");
			for(int i = 0; i < known_objects.size(); i++) {
				for(int j = 0; j < measured_objects.size(); j++) {
					float cost = calculate_cost(predicted_objects[i],measured_objects[j]);
					if(cost <= no_match_cost)
						costMatrix[i].push_back(cost);
					else
						costMatrix[i].push_back(std::numeric_limits<float>::max());
					std::cout << costMatrix[i][j] << ",";
				}
				std::cout << "\n";
			}
			
			//find objects without reasonable cost and stall them
			stall_unassignable_objects(known_objects, costMatrix, new_objects,passed_time);
			
			
			//find best assignment
			vector<int> assignment;
			double cost = HungAlgo.Solve(costMatrix, assignment);
			
			for(int i = 0; i<assignment.size(); i++) {
				//assign best guess to known objects
				if(assignment[i] >= 0) {
					object new_object = measured_objects[assignment[i]];
					measured_objects[assignment[i]].assigned = true;
					
					new_object.id = known_objects[i].id;
					new_object.is_target = known_objects[i].is_target;
					new_object.vel = update_velocity(known_objects[i].pos, new_object.pos);
					new_objects.push_back(new_object);
				}
				else {
					stall_object(new_objects,known_objects[i],passed_time);			
				}
			}
		
			//if no suitable object for meassurements are found create new objects
			for(int i = 0; i<measured_objects.size(); i++) {
				if(measured_objects[i].assigned == false) {
					measured_objects[i].assigned = true;
					measured_objects[i].id = id_count;
					id_count++;
					new_objects.push_back(measured_objects[i]);
				}
			}
					
			known_objects = new_objects;			
			if(!has_target)
				mark_target(known_objects);
				
			visualize_target(known_objects, msg.header);
			visualize_ids(known_objects,msg.header);
		}
		auto time_2 = std::chrono::high_resolution_clock::now();
		//float execution_time = std::chrono::duration_cast<std::chrono::microseconds>(time_2 - time_1).count();
		//ROS_INFO("Execution time: %f",execution_time);//float e_t = execution_time.count();
		ROS_INFO("no_match_cost: %f",no_match_cost);
	}
	
	
	
	
	
	
////-----------------------------HELPER-FUNCTIONS-------------------------------------------------------

	void stall_unassignable_objects(std::vector<object>& known_objects, vector< vector<double> >& costMatrix, vector <object>& new_objects,const float passed_time)
	{
		for(int i = 0; i < costMatrix.size(); i++) {
			bool has_match = false;
			for(int j = 0; j < costMatrix[i].size(); j++) {
				if(costMatrix[i][j] <= no_match_cost) {
					has_match = true;
					break;
				}					
			}
			if(!has_match) {
				costMatrix.erase(costMatrix.begin()+i);
				stall_object(new_objects,known_objects[i],passed_time);
				known_objects.erase(known_objects.begin()+i);
				i--;
			}
		}
	}

	std::vector<object> meassure_objects(const laser_features::Featured_segments &msg)
	{
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
		}
		return measured_objects;
	}

	//calculate last seen time and save if below time treshhold else let fall
	void stall_object(std::vector<object>& new_objects, object old_object, const float passed_time) 
	{
		object new_object = old_object;
		new_object.last_seen += passed_time;
		if(new_object.last_seen < delete_treshold) {
			new_object.pos = predict_position(new_object.pos,new_object.vel,passed_time);
			//new_object.vel.x = 0;//new_object.vel.x;
			//new_object.vel.y = 0;//new_object.vel.y;
			//new_object.vel.z = 0;//new_object.vel.z;
			new_objects.push_back(new_object);
		}
	}
	
	geometry_msgs::Point32 predict_position(geometry_msgs::Point32 pos, const geometry_msgs::Point32 vel, const float passed_time) 
	{
		pos.x = pos.x; + vel.x*passed_time;
		pos.y = pos.y; + vel.y*passed_time;
		pos.z = pos.z; + vel.z*passed_time;
		return pos;
	}
	
	geometry_msgs::Point32 update_velocity(geometry_msgs::Point32 old_pos, geometry_msgs::Point32 new_pos)
	{
		geometry_msgs::Point32 vel;
		vel.x = (new_pos.x - old_pos.x);
		vel.y = (new_pos.y - old_pos.y);
		vel.z = (new_pos.z - old_pos.z);
		return vel;		
	}

	void mark_target(std::vector<object>& known_objects) {
		object dummy_object;
		dummy_object.distance = std::numeric_limits<float>::infinity();
		object * best_object = &dummy_object;
		
		for(int i =0; i<known_objects.size(); i++) {
			if(known_objects[i].propability >= init_propability_treshold && known_objects[i].distance < best_object->distance) 
			{
				best_object = &known_objects[i];
			}					
		}
		ROS_INFO("Searching for target... best object distance: %f propability: %f",best_object->distance,best_object->propability);
		
		if(best_object->distance < init_max_distance) {
			best_object->is_target = true;
			has_target = true;
			ROS_INFO("first target found!");
		}
	}
	
	void reset_target() {
		ROS_INFO("reseting target!");
		for(int i =0; i<known_objects.size(); i++) {
			known_objects[i].is_target = false;
		}
		has_target = false;
	}

	object predict_object(object known_object, float passed_time) {
			object predicted_obj = known_object;
			predicted_obj.pos = predict_position(predicted_obj.pos, predicted_obj.vel, passed_time);
			return predicted_obj;
	}
	
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

  while (ros::ok())
	{		
		if(_kbhit()) {
			int c = getchar();
  		if (c == 'r')
  			STObject.reset_target();
  	}
		ros::spinOnce();
	}

  return 0;
}
