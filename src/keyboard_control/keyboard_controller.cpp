#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include <termios.h>

class KeyboardController
{
private:
	ros::NodeHandle n;
	ros::Publisher vel_pub;


public:

	KeyboardController() {
		vel_pub = n.advertise<geometry_msgs::Twist>("/RosAria/cmd_vel",1);
	}


  int getch()
	{
		static struct termios oldt, newt;
		tcgetattr( STDIN_FILENO, &oldt);           // save old settings
		newt = oldt;
		newt.c_lflag &= ~(ICANON);                 // disable buffering      
		tcsetattr( STDIN_FILENO, TCSANOW, &newt);  // apply new settings

		int c = getchar();  // read character (non-blocking)

		tcsetattr( STDIN_FILENO, TCSANOW, &oldt);  // restore old settings
		return c;
	}

	void publish_vel(geometry_msgs::Twist vel_msg) {
		vel_pub.publish(vel_msg);
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
  ros::init(argc, argv, "keyboardController");


  KeyboardController KCObject;

	while (ros::ok())
	{
		geometry_msgs::Twist vel_msg;


  	int c = KCObject.getch();   // call your non-blocking input function
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
   
  /**
   * ros::spin() will enter a loop, pumping callbacks.  With this version, all
   * callbacks will be called from within this thread (the main one).  ros::spin()
   * will exit when Ctrl-C is pressed, or the node is shutdown by the master.
   */
  ros::spin();

  return 0;
}







