#include "ros/ros.h"
#include "sensor_msgs/PointCloud.h"
#include "laser_segmentation/PointCloudSegmented.h"
#include "laser_segmentation/Segment.h"
#include <visualization_msgs/Marker.h>

class LaserpointSegmentation
{
private:
	ros::NodeHandle n;
	ros::Subscriber sub;
	ros::Publisher segments_pub;
	ros::Publisher marker_pub;
	
	bool doTrain;
	int scan_count = 0;
	int all_segment_count = 0;
	int segment_error_count = 0;
	float threshold = 0.05;
	int changed_lables_count = 0;

public:

	//bool isSim = false;

	LaserpointSegmentation(bool isSim) {
	
		ROS_INFO("ISSIM: %i" , isSim);
		if(isSim)
			sub = n.subscribe("/RosAria/sim_urg_1_pointcloud", 100000, &LaserpointSegmentation::pointCloudCallback, this);
		else
	  	sub = n.subscribe("/RosAria/urg_1_pointcloud", 100000, &LaserpointSegmentation::pointCloudCallback, this);
	  		  	
  	segments_pub = n.advertise<laser_segmentation::PointCloudSegmented>("/pointcloud_segments",100000, true);
		marker_pub = n.advertise<visualization_msgs::Marker>("/visualization_marker", 100000, true);
	}
	
//*****************************************************************************************************************************************//
//                         																SEGMENTATION                                                                     //
//*****************************************************************************************************************************************//
	   
	void pointCloudCallback(const sensor_msgs::PointCloud::ConstPtr& msg)
	{

		//ROS_INFO("PointCloud: n:[%lu] ", boost::size(msg->points));
	  	 
	  	laser_segmentation::PointCloudSegmented segments_msg;
	  	segments_msg.header = msg->header;
	  	segments_msg.segments.resize(boost::size(msg->points)); //reserve sufficient space for segments

  		int segment_counter = 0;
	  	
	  
	  	//ROS_INFO("Threshold: %f" , threshold); 

  	if(boost::size(msg->points)==0){
			return;
		}	
  	else {
			segments_msg.segments[segment_counter].segment.push_back(msg->points[0]);
			
			if (has_lables(msg)) 
				segments_msg.segments[segment_counter].class_id=msg->channels[0].values[0];
			else
				segments_msg.segments[segment_counter].class_id=-1;

			//ROS_INFO("Number points: %lu ", boost::size(msg->points));
  		//ROS_INFO("---------------------------------------- \n Segment: %i ", 0);
	  	//ROS_INFO("%i, Delta= %f ,Distance= %f",0, 0.0, sqrt(pow(msg->points[0].x,2.0) + pow(msg->points[0].y,2.0)));
		}
		  bool lable_changed = false;
  		for(int i=1; i < boost::size(msg->points); i++) { 		
				float delta = calculate_2_point_distance(msg->points[i],msg->points[i-1]);
				
	
				//if smaler then threshold save in same segment
				if(delta <= threshold) {
					ROS_INFO("delta: %f x:%f y:%f z:%f", delta,msg->points[i].x,msg->points[i].y,msg->points[i].z);
					segments_msg.segments[segment_counter].segment.push_back(msg->points[i]);

					if (has_lables(msg)) {
						if(segments_msg.segments[segment_counter].class_id!=msg->channels[0].values[i]) { //set label to 1 if background or mixture of background and peaople data
							segments_msg.segments[segment_counter].class_id = 1;
							if(!lable_changed) {
								changed_lables_count += 1;
								lable_changed = true;
							}					
						}
					}else{
						segments_msg.segments[segment_counter].class_id=-1;
					}
				//if bigger then threshold save in new segment	
				}else{
					ROS_INFO("new segment! delta: %f", delta);
					segment_counter++;
					lable_changed = false;
					segments_msg.segments[segment_counter].segment.push_back(msg->points[i]);
					if (has_lables(msg))
						segments_msg.segments[segment_counter].class_id = msg->channels[0].values[i];
					else
						segments_msg.segments[segment_counter].class_id=-1;
			
					ROS_INFO("---------------------------------------- \n Segment: %i ", segment_counter);
				}
	
				//ROS_INFO("%i, Delta= %f ,Distance= %f, x= %f, y= %f, class_id= %d",i, delta, 
				//sqrt(pow(msg->points[i].x,2.0) + pow(msg->points[i].y,2.0)), msg->points[i].x , msg->points[i].y, segments_msg.segments[segment_counter].class_id );
	  	}

  		segments_msg.segments.resize(segment_counter+1);
  		all_segment_count += segment_counter+1;
			scan_count++;
			ROS_INFO("segmentation scan count: %i, segments count: %i, changed lables count: %i",scan_count,all_segment_count,changed_lables_count);
  		
  		//ROS_INFO("segments: %lu " , boost::size(segments_msg.segments));
	  	segments_pub.publish(segments_msg);
	  	
	  	visualize_segments(segments_msg);

		
	}
	
//*****************************************************************************************************************************************//
//                         																HELPER FUNCTIONS                                                                 //
//*****************************************************************************************************************************************//
	
	float calculate_2_point_distance(geometry_msgs::Point32 A,geometry_msgs::Point32 B) {
		return sqrt(pow(A.x-B.x,2)+pow(A.y-B.y,2)+pow(A.z-B.z,2));
	}
	
	
	bool has_lables(const sensor_msgs::PointCloud::ConstPtr& msg) {
		if (boost::size(msg->channels)>0 && msg->channels[0].name == "class_label") {
			return true;
		} else {
			return false;
		}
		return false;
	}


//*****************************************************************************************************************************************//
//                         																VISUALIZATION                                                                    //
//*****************************************************************************************************************************************//
		
	void visualize_segments(laser_segmentation::PointCloudSegmented segments_msg) {

		visualization_msgs::Marker line_list;
		line_list.header = segments_msg.header;
		line_list.ns = "segments_lines";
		line_list.action = visualization_msgs::Marker::MODIFY;
		line_list.pose.orientation.w = 1.0;
		line_list.id = 0;
		line_list.type = visualization_msgs::Marker::LINE_LIST;
	
		line_list.scale.x = 0.003;
		
		line_list.color.a = 1.0;
			
		for (int i = 0; i < boost::size(segments_msg.segments); i++)
		{
			std_msgs::ColorRGBA color;
			
			if(i%3 == 0)
				color.g = 1.0;
			else if(i%3 == 1) {
				color.r = 1.0;
				color.g = 1.0;
			}
			else if(i%3 == 2)
				color.r = 1.0;
			
			
			for (int j = 1; j < boost::size(segments_msg.segments[i].segment); j++)
			{
				  geometry_msgs::Point p;
				  p.x = segments_msg.segments[i].segment[j-1].x;
				  p.y = segments_msg.segments[i].segment[j-1].y;
				  p.z = segments_msg.segments[i].segment[j-1].z;
				  
				  geometry_msgs::Point pp;
	  			pp.x = segments_msg.segments[i].segment[j].x;
				  pp.y = segments_msg.segments[i].segment[j].y;
				  pp.z = segments_msg.segments[i].segment[j].z;
				

				  // The line list needs two points for each line
				  line_list.points.push_back(p);
				  line_list.colors.push_back(color);
				  line_list.points.push_back(pp);
				  line_list.colors.push_back(color);
		  	} 	
		}		
		marker_pub.publish(line_list);
	}

};

//*****************************************************************************************************************************************//
//                         																MAIN                                                                    				 //
//*****************************************************************************************************************************************//

int main(int argc, char **argv)
{
  /**
   * The ros::init() function needs to see argc and argv so that it can perform
   * any ROS arguments and name remapping that were provided at the command line.
   * For programmatic remappings you can use a different version of init() which takes
   * remappings directly, but for most command-line programs, passing argc and argv is
   * the easiest way to do it.  The third argument to init() is the name of the node.
   *
   * You must call one of the versions of ros::init() before using any other
   * part of the ROS system.
   */
  ros::init(argc, argv, "laserSegmentor");

	ROS_INFO("ARG: %s", argv[1]);
	
	bool isSim = false;
	
	if(argv[1] && boost::lexical_cast<std::string>(argv[1]) == "--sim") {
			isSim = true;
	}

  LaserpointSegmentation LSObject(isSim);
   


  /**
   * ros::spin() will enter a loop, pumping callbacks.  With this version, all
   * callbacks will be called from within this thread (the main one).  ros::spin()
   * will exit when Ctrl-C is pressed, or the node is shutdown by the master.
   */
  ros::spin();

  return 0;
}
