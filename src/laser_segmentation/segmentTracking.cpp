#include "ros/ros.h"
#include "sensor_msgs/PointCloud.h"
#include "laser_features/Featured_segments.h"
#include "laser_features/Segment_featured.h"
#include <visualization_msgs/Marker.h>
#include <queue>

class SegmentTracking
{
private:
	ros::NodeHandle n;
	ros::Subscriber sub;
	ros::Publisher segments_pub;
	ros::Publisher marker_pub;
	
	const static int max_queue_length = 5; 
	std::queue<laser_features::Featured_segments> segment_queue;
	
	struct object {
		int id;
		geometry_msgs::Point32 pos;
		geometry_msgs::Point32 vel;
		float propability;
		float distance;
	};
	std::vector<object> known_objects;
	
	float init_propability_treshold = 0.75;
	float scan_propability_treshold = 0.2;
	
	float init_max_distance = 1.5;
	float scan_max_distance = 1;

public:

	SegmentTracking() {
		  		  	
  	//segments_pub = n.advertise<laser_segmentation::PointCloudSegmented>("/pointcloud_segments",100000, true);
		marker_pub = n.advertise<visualization_msgs::Marker>("/target_marker", 1, true);
		
		sub = n.subscribe("/classified_segments", 10, &SegmentTracking::pointCloudCallback, this);
	}
	   
	void pointCloudCallback(const laser_features::Featured_segments &msg)
	{
		//segment_queue.push(msg);
		//while(segment_queue.size() > max_queue_length)
		//	segment_queue.pop();
		//----------------------------------------------------------------------------------------------
		//---------------safe measured objects above threshold---------------------------------
		std::vector<object> measured_objects;
		for(auto &segment: msg.segments) {
			ROS_INFO("%f",segment.class_id);
			if(segment.class_id >= scan_propability_treshold) {
				object new_measurement;
				new_measurement.id = 0;
				new_measurement.pos = segment.center;
				geometry_msgs::Point32 zero_vel; zero_vel.x = 0; zero_vel.y = 0; zero_vel.z = 0;
				new_measurement.vel = zero_vel;
				new_measurement.propability = segment.class_id;
				new_measurement.distance = segment.distance;
				measured_objects.push_back(new_measurement);
			}
		}
		//ROS_INFO("measured objects: %lu", measured_objects.size());
		if(measured_objects.empty())
			return;
			
			
		// if no presence known take nearest good enough to robot
		if(known_objects.empty()) {
			object new_object;
			new_object.id = 0;
			new_object.distance = std::numeric_limits<float>::infinity();
			for(int i =0; i<measured_objects.size(); i++) {
				std::cout << "test";
				if(measured_objects[i].propability >= init_propability_treshold 
				&& measured_objects[i].distance < new_object.distance) {
					new_object = measured_objects[i];
					new_object.id = 1;
				}
			}
			if(new_object.distance < init_max_distance) {
				known_objects.push_back(new_object);
				ROS_INFO("first target found!");
			}
			
			
		// if presence nown update with nearest to last known position	
		} else {
			float min_distance = std::numeric_limits<float>::infinity();
			object best_guess;
			for(int i =0; i<=measured_objects.size(); i++) {
				float object_distance = calculate_2_point_distance(measured_objects[i].pos, known_objects[0].pos);
				if(object_distance < min_distance) {
					min_distance = object_distance;
					best_guess = measured_objects[i];
				}
			}
			ROS_INFO("min_distance: %f",min_distance);
			if(min_distance < scan_max_distance) {
				known_objects[0] = best_guess;
				visualize_target(known_objects, msg);
			}
			
		}
		
	}
	
	float calculate_2_point_distance(geometry_msgs::Point32 A,geometry_msgs::Point32 B) {
		return sqrt(pow(A.x-B.x,2)+pow(A.y-B.y,2)+pow(A.z-B.z,2));
	}
	
	void visualize_target(const std::vector<object> known_objects, const laser_features::Featured_segments msg) {
		//ROS_INFO("visualizing....  ");
		object target = known_objects[0];
		visualization_msgs::Marker arrow;
		arrow.header = msg.header;
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
		arrow.scale.z = 0.05;		//head length
		
		arrow.color.a = 1.0;
		arrow.color.r = 1.0;
		arrow.color.g = 1.0;
		arrow.color.b = 1.0;
		
		marker_pub.publish(arrow);
		//ROS_INFO("visualization published");
		
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
