#include "ros/ros.h"
#include "sensor_msgs/PointCloud.h"
#include "geometry_msgs/Point32.h"

#include <fstream>

class TrainingdataPublisher
{
private:
	ros::NodeHandle n;
	ros::Publisher data_pub;
	
	
public:
	TrainingdataPublisher() {
		data_pub = n.advertise<sensor_msgs::PointCloud>("/RosAria/urg_1_pointcloud",100000,true);
	}
	
	
	void processTrainingdata(const char* path) {
		
		ros::Rate poll_rate(100);
		while(data_pub.getNumSubscribers() == 0)
    	poll_rate.sleep();
	
		//std::cout << "path: " << path << std::endl;
		std::string scan;
		std::ifstream trainingFile(path);
		if(trainingFile.is_open()) {
			//std::cout << "Is open" << std::endl;
			int count = 0;
			while(getline(trainingFile,scan)) {
				count++;
				//std::cout << scan << std::endl;
				
				std::vector<std::string> scan_split;
				std::istringstream scanStream(scan);
				std::string item;
				while(std::getline(scanStream,item,' ')) {
					scan_split.push_back(item);
				}				
				scan_split.erase(scan_split.begin());
				int size = boost::size(scan_split);
				ROS_INFO("count: %i, size: %i",count,size);
				
				sensor_msgs::PointCloud point_cloud;
				point_cloud.header.stamp = ros::Time::now();
				point_cloud.header.frame_id = "odom";
				//point_cloud.header.frame_id = "base_link";
				
				sensor_msgs::ChannelFloat32 channel;
				channel.name = "class_label";
				point_cloud.channels.push_back(channel);
				
				for(int i = 0; i < size; i= i+3) {
					//ROS_INFO("%i: x:\"%i\" ",i,scan_split[i].c_str()[0]);
					if(scan_split[i]=="\r")
						break;
					
					geometry_msgs::Point32 point;
					point.x = boost::lexical_cast<float>(scan_split[i]); 
					point.y = boost::lexical_cast<float>(scan_split[i+1]);
					float class_label = stoi(scan_split[i+2]);
					//std::cout << scan_split[i+2] << ":" <<class_label;
					point_cloud.points.push_back(point);
					point_cloud.channels[0].values.push_back(class_label);
					//ROS_INFO("%f",point_cloud.channels[0].values[i/3]);
				}
				
				data_pub.publish(point_cloud);
				
				ros::Rate wait_rate(6);
				wait_rate.sleep();
			}
			ROS_INFO("%i scans published from file",count);
			trainingFile.close();
		}
	}
	
	
};


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
  ros::init(argc, argv, "trainingDataPub");
	
  TrainingdataPublisher TDPObject;
  
  if(argv[1]) {
		TDPObject.processTrainingdata(argv[1]);
	}
	else {
		ROS_INFO("enter training data path");
		exit(0);
	}
  ros::spin();
	

  /**
   * ros::spin() will enter a loop, pumping callbacks.  With this version, all
   * callbacks will be called from within this thread (the main one).  ros::spin()
   * will exit when Ctrl-C is pressed, or the node is shutdown by the master.
   */
  

  return 0;
}
