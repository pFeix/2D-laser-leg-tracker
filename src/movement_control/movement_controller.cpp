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
	
	float stop_threshold = 0.75;
	bool has_obstacale = false;
	ros::Time last_time = ros::Time(0);
	
	float max_angular_speed = 1;
	float min_angular_speed = -1;
	float angular_target_offset = 0.0;
	


public:
	bool follow_target = false;

	MovementController() {
		vel_pub = n.advertise<geometry_msgs::Twist>("/RosAria/cmd_vel",1);
		target_sub = n.subscribe("/target_info", 1, &MovementController::targetInfoCallback, this);
		us_sub = n.subscribe("/RosAria/sonar", 1, &MovementController::ultraSonicCallback, this);
	}
	
	void targetInfoCallback(const laser_segmentation::Target &target_msg)
	{
		if(follow_target) {
			ROS_INFO("Target pos.x: %f pos.y: %f",target_msg.pos.x,target_msg.pos.y); //y -> rotation x ->distance
			geometry_msgs::Twist vel_msg;
			
			double passed_time = (target_msg.header.stamp-last_time).toSec();
			if(last_time == ros::Time(0))
				passed_time = 0.0;
			last_time = target_msg.header.stamp;
			//ROS_INFO("passed_time: %f",passed_time);
	
			//calculate angle
			float slope = target_msg.pos.y / target_msg.pos.x;
			float angle = atan(slope);
			
			ROS_INFO("angle: %f",angle);
			
	
			
			vel_msg.angular.z = pid_controller(angular_target_offset, angle, passed_time, max_angular_speed, min_angular_speed);
			
			
			
			if(abs(angle)<0.2 && target_msg.pos.x > 1.0)
				vel_msg.linear.x = 0.2; // move to target
			else if(abs(angle)<0.4 && target_msg.pos.x > 1.0)
				vel_msg.linear.x = 0.1; // move to target slow
			else
				vel_msg.linear.x = 0.0;
				
			publish_vel(vel_msg);
		}
		
	}
	
	void ultraSonicCallback(const sensor_msgs::PointCloud &us_msg)
	{
		float min_distance = std::numeric_limits<float>::infinity();
		for(int i = 0; i < us_msg.points.size(); i++) {
			float distance = sqrt(pow(us_msg.points[i].x,2.0)+pow(us_msg.points[i].y,2.0));
			if (distance > 0.0 && distance < min_distance) {
				min_distance = distance;
			}
		}
		
		//ROS_INFO("min_distance %f",min_distance);
		
		if (min_distance < stop_threshold) {
			ROS_INFO("Obstacle detected stopping !");
			geometry_msgs::Twist vel_msg;
			has_obstacale = true;
		} else {
			//ROS_INFO("No Obstacle moving onward.");
			has_obstacale = false;
		}
		
		
	}
	

	void publish_vel(geometry_msgs::Twist vel_msg) {
		if(has_obstacale && vel_msg.linear.x > 0.0)
			vel_msg.linear.x = 0.0;
		vel_pub.publish(vel_msg);
  }
  
  float k_p = 1.0;
	float k_d = 0.25;
	float k_i = 0.0;
	float PID_integral = 0.0;
	float last_offset = 0.0;

	float pid_controller(float target_point, float current_point, float dt, float max_out, float min_out) {
		float offset = current_point - target_point;
		//PID_integral += offset * dt;
		float PID_derivate = (offset - last_offset) / dt;
	
		float p_out = k_p * offset;
		float i_out = k_i * PID_integral;
		float d_out = k_d * PID_derivate;
	
		float out = p_out + i_out + d_out;
		
		ROS_INFO("out: %f, p:%f, i:%f, d:%f",out,p_out,i_out,d_out);
	
		if(out > max_out)
			out = max_out;
		
		if(out < min_out)
			out = min_out;
	
		last_offset = offset;
	
		return out;
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
			if (c == 'w'){
		  	vel_msg.linear.x = 0.2;					//ROS_INFO( "W");
		  	KCObject.publish_vel(vel_msg);
	  	}
			else if (c == 'a') {
		  	vel_msg.angular.z = 1.0;				//ROS_INFO( "A");
		  	KCObject.publish_vel(vel_msg);
	  	}
			else if (c == 's'){
		  	vel_msg.linear.x = -0.2;					//ROS_INFO( "S");
	  		KCObject.publish_vel(vel_msg);
	  	}
			else if (c == 'd') {
		  	vel_msg.angular.z = -1.0;				//ROS_INFO( "D");
		  	KCObject.publish_vel(vel_msg);
	  	}
			else if (c == 'x') {

		  	KCObject.publish_vel(vel_msg);	
	  	}		
			else if (c == 'l')
				KCObject.follow_target = !KCObject.follow_target;
	  	else {
		  	vel_msg.angular.z = 0.0;		//ROS_INFO( "X");
		  	vel_msg.linear.x = 0;
				KCObject.follow_target = false;
			}
			
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







