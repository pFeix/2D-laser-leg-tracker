#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "sensor_msgs/PointCloud.h"
#include "laser_segmentation/Target.h"

//for keyboard input
#include <stdio.h>
#include <sys/select.h>
#include <termios.h>
#include <stropts.h>
#include <sys/ioctl.h>

class MovementController
{
private:
	ros::NodeHandle n;
	ros::Publisher vel_pub;
	ros::Subscriber target_sub;
	ros::Subscriber us_sub;


public:

	MovementController() {
		vel_pub = n.advertise<geometry_msgs::Twist>("/RosAria/cmd_vel",1);
		target_sub = n.subscribe("/target_info", 1, &MovementController::targetInfoCallback, this);
		us_sub = n.subscribe("/RosAria/sonar", 1, &MovementController::ultraSonicCallback, this);
	}
	
	void targetInfoCallback(const laser_segmentation::Target &target_msg)
	{
		ROS_INFO("Target pos.x: %f pos.y: %f",target_msg.pos.x,target_msg.pos.y);
	}
	
	void ultraSonicCallback(const sensor_msgs::PointCloud &us_msg)
	{
		ROS_INFO("N_US_POINTS %lu",us_msg.points.size());
		for(int i = 0; i < us_msg.points.size(); i++) {
			float distance = sqrt(pow(us_msg.points[i].x,2.0)+pow(us_msg.points[i].y,2.0));
			ROS_INFO("Distance %f",distance);
		}
	}
	

	void publish_vel(geometry_msgs::Twist vel_msg) {
		vel_pub.publish(vel_msg);
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
  ros::init(argc, argv, "MovementController");


  MovementController KCObject;

	while (ros::ok())
	{
		if(_kbhit()) {
			geometry_msgs::Twist vel_msg;


			int c = getchar();   // call your non-blocking input function
			if (c == 'w')
		  	vel_msg.linear.x = 0.1;					//ROS_INFO( "W");
			else if (c == 'a')
		  	vel_msg.angular.z = 0.5;				//ROS_INFO( "A");
			else if (c == 's')
		  	vel_msg.linear.x = -0.1;					//ROS_INFO( "S");
			else if (c == 'd')
		  	vel_msg.angular.z = -0.5;				//ROS_INFO( "D");
			else if (c == 'x') {
		  	vel_msg.angular.z = 0.0;	vel_msg.linear.x = 0;	}		//ROS_INFO( "D");

			KCObject.publish_vel(vel_msg);
		}
		ros::Rate r(1000);
		ros::spinOnce();
		r.sleep();
	}
   
  /**
   * ros::spin() will enter a loop, pumping callbacks.  With this version, all
   * callbacks will be called from within this thread (the main one).  ros::spin()
   * will exit when Ctrl-C is pressed, or the node is shutdown by the master.
   */
  ros::spin();

  return 0;
}







