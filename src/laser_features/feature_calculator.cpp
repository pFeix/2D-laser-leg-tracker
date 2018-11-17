#include "ros/ros.h"
#include "laser_segmentation/PointCloudSegmented.h"
#include "geometry_msgs/Point32.h"
#include "visualization_msgs/MarkerArray.h"
#include "laser_features/Segment_featured.h"
#include "laser_features/Featured_segments.h"
//#include <visualization_msgs/Marker.h>
#include <Eigen/Dense>
#include <chrono>


class FeatureCalculator
{
private:
	ros::NodeHandle n;
	ros::Subscriber sub;
	ros::Publisher features_pub;
	ros::Publisher marker_pub;
	const float PI = 3.1415927;
	int scan_count = 0;
	int segments_count = 0;
	int all_segments_count = 0;

public:

	FeatureCalculator() {
			sub = n.subscribe("/pointcloud_segments", 100000, &FeatureCalculator::pointCloudSegmentsCallback, this);
  		features_pub = n.advertise<laser_features::Featured_segments>("/featured_segments",100000, true);


			marker_pub = n.advertise<visualization_msgs::Marker>("/visualization_marker", 1000);
	}


	void pointCloudSegmentsCallback(const laser_segmentation::PointCloudSegmented &msg) {
		auto time_1 = std::chrono::high_resolution_clock::now();
		laser_features::Featured_segments segments_msg;
		segments_msg.header = msg.header;
		
		all_segments_count += boost::size(msg.segments);
		
		for(int i= 0; i < boost::size(msg.segments); i++) {
			laser_features::Segment_featured segment_msg;
			
			
			//1) Number of points
			segment_msg.number_of_points = boost::size(msg.segments[i].points);
			
			if(segment_msg.number_of_points < 3)
				continue;					//skip segments with less then 3 points since geometrical calculations are not possible
				
			segments_count++;
				
			//ROS_INFO("Segment: %i",i);
			//ROS_INFO("Number of Points: %i",segment_msg.number_of_points);
				
				
			//calculation of segment features
			geometry_msgs::Point32 center =  calculate_center(msg,i,segment_msg.number_of_points);
			segment_msg.center = center;
			//ROS_INFO("Center x: %f, y: %f, z: %f",center.x,center.y,center.z);
			geometry_msgs::Point32 origin;
			origin.x = origin.y = origin.z = 0.0;
			segment_msg.distance_to_origin = calculate_2_point_distance(segment_msg.center,origin);
			
			//0) class_id
			segment_msg.class_id = msg.segments[i].class_id;
			
			//2) Standard deviation
			segment_msg.std_deviation = calculate_std_deviation(msg, i, segment_msg.number_of_points, center);
			//3) Mean average deviation from median
			segment_msg.mean_average_deviation_from_median = calculate_mean_average_deviation_from_median(msg.segments[i], segment_msg.number_of_points); 
			//4) Jump distance from preceeding segment
			segment_msg.jump_distance_preceeding = calculate_jump_distance_preceeding(msg, i);
			//5) Jump distance to succeeding segment
			segment_msg.jump_distance_succeeding = calculate_jump_distance_succeeding(msg, i);
			//6) Width
			segment_msg.width = calculate_width(msg.segments[i],segment_msg.number_of_points);
			//7) Linearity
			auto line_params = fit_line(msg.segments[i],segment_msg.number_of_points);
			segment_msg.linearity = calculate_linearity(msg.segments[i],segment_msg.number_of_points,line_params);
			//9) Radius
			geometry_msgs::Vector3 fitted_circle = calculate_fitted_circle(msg.segments[i],segment_msg.number_of_points);
			segment_msg.radius = fitted_circle.z;
			//8) Circularity
			segment_msg.circularity = calculate_circularity(fitted_circle, msg.segments[i], segment_msg.number_of_points);

			//10) Boundary length
			segment_msg.boundary_length = calculate_boundary_length(msg.segments[i],segment_msg.number_of_points);
			//11) Boundary regularity
			segment_msg.boundary_regulatity = calculate_boundary_regularity(msg.segments[i],segment_msg.number_of_points,segment_msg.boundary_length);
			//12) Mean curvature
			segment_msg.mean_curvature = calculate_mean_curvature(msg.segments[i],segment_msg.number_of_points);
			//13) Mean angular difference
			segment_msg.mean_angular_difference = calculate_mean_angular_difference(msg.segments[i],segment_msg.number_of_points);
			//14) ------- not necessary  Mean speed
			
			//15) Kurtosis wikipedia
			segment_msg.kurtosis = calculate_Kurtosis(msg.segments[i], segment_msg.number_of_points, center, segment_msg.std_deviation);
			//16) Aspect Ratio
			segment_msg.aspect_ratio = calculate_aspect_ratio(msg.segments[i], segment_msg.number_of_points, line_params);
			//17) Sum of Distances
			segment_msg.sum_of_distances = segment_msg.jump_distance_preceeding + segment_msg.jump_distance_succeeding;
			 
			
			
			
			segments_msg.segments.push_back(segment_msg);
		}
		
		for(int ii= 0; ii < boost::size(segments_msg.segments); ii++) {
			geometry_msgs::Point32 center = segments_msg.segments[ii].center;
			//18) Nearest Distance
			float nearest_distance = std::numeric_limits<float>::infinity();
			int nearest_neghbour_id = ii;
			for(int j= 0; j < boost::size(segments_msg.segments); j++) {
				geometry_msgs::Point32 other_center = segments_msg.segments[j].center;
					if(ii!=j) {
						float distance = calculate_2_point_distance(center,other_center);
						if(distance < nearest_distance) {
							nearest_distance = distance;
							nearest_neghbour_id = j;
						} 
					}
			}
			segments_msg.segments[ii].nearest_distance = nearest_distance;
			segments_msg.segments[ii].nearest_neghbour_id = nearest_neghbour_id;
			//ROS_INFO("nearest_distance: %f",nearest_distance);
		}
		
		for(int ii= 0; ii < boost::size(segments_msg.segments); ii++) {
			float nn_id = segments_msg.segments[ii].nearest_neghbour_id;
			
			segments_msg.segments[ii].nn_number_of_points										= segments_msg.segments[nn_id].number_of_points;
			segments_msg.segments[ii].nn_std_deviation											= segments_msg.segments[nn_id].std_deviation;
			segments_msg.segments[ii].nn_mean_average_deviation_from_median = segments_msg.segments[nn_id].mean_average_deviation_from_median;
			segments_msg.segments[ii].nn_width															= segments_msg.segments[nn_id].width;
			segments_msg.segments[ii].nn_linearity													= segments_msg.segments[nn_id].linearity;
			segments_msg.segments[ii].nn_radius															= segments_msg.segments[nn_id].radius;
			segments_msg.segments[ii].nn_circularity												= segments_msg.segments[nn_id].circularity;
			segments_msg.segments[ii].nn_boundary_length										= segments_msg.segments[nn_id].boundary_length;
			segments_msg.segments[ii].nn_boundary_regulatity								= segments_msg.segments[nn_id].boundary_regulatity;
			segments_msg.segments[ii].nn_mean_curvature											= segments_msg.segments[nn_id].mean_curvature;
			segments_msg.segments[ii].nn_mean_angular_difference						= segments_msg.segments[nn_id].mean_angular_difference;
			segments_msg.segments[ii].nn_aspect_ratio												= segments_msg.segments[nn_id].aspect_ratio;
			segments_msg.segments[ii].nn_kurtosis														= segments_msg.segments[nn_id].kurtosis;
		}
		
		for(int ii= 0; ii < boost::size(segments_msg.segments); ii++) {
			laser_features::Segment_featured segment_msg = segments_msg.segments[ii];
			float norm_var = segment_msg.distance_to_origin;
			segment_msg.div_distance_number_of_points = segment_msg.number_of_points/norm_var;
			segment_msg.div_distance_std_deviation		= segment_msg.std_deviation/norm_var;
			segment_msg.div_distance_mean_average_deviation_from_median =	segment_msg.mean_average_deviation_from_median/norm_var;
			segment_msg.div_distance_width						= segment_msg.width/norm_var;
			segment_msg.div_distance_linearity				= segment_msg.linearity/norm_var;
			segment_msg.div_distance_radius						= segment_msg.radius/norm_var;
			segment_msg.div_distance_circularity		  = segment_msg.circularity/norm_var;
			segment_msg.div_distance_boundary_length	= segment_msg.boundary_length/norm_var;
			segment_msg.div_distance_boundary_regulatity	= segment_msg.boundary_regulatity/norm_var;
			segment_msg.div_distance_mean_curvature		= segment_msg.mean_curvature/norm_var;
			segment_msg.div_distance_mean_angular_difference	= segment_msg.mean_angular_difference/norm_var;
			segment_msg.div_distance_aspect_ratio			= segment_msg.aspect_ratio/norm_var;
			segment_msg.div_distance_kurtosis					= segment_msg.kurtosis/norm_var;
			
			segment_msg.mlp_distance_number_of_points = segment_msg.number_of_points*norm_var;
			segment_msg.mlp_distance_std_deviation		= segment_msg.std_deviation*norm_var;
			segment_msg.mlp_distance_mean_average_deviation_from_median =	segment_msg.mean_average_deviation_from_median*norm_var;
			segment_msg.mlp_distance_width						= segment_msg.width*norm_var;
			segment_msg.mlp_distance_linearity				= segment_msg.linearity*norm_var;
			segment_msg.mlp_distance_radius						= segment_msg.radius*norm_var;
			segment_msg.mlp_distance_circularity		  = segment_msg.circularity*norm_var;
			segment_msg.mlp_distance_boundary_length	= segment_msg.boundary_length*norm_var;
			segment_msg.mlp_distance_boundary_regulatity	= segment_msg.boundary_regulatity*norm_var;
			segment_msg.mlp_distance_mean_curvature		= segment_msg.mean_curvature*norm_var;
			segment_msg.mlp_distance_mean_angular_difference	= segment_msg.mean_angular_difference*norm_var;
			segment_msg.mlp_distance_aspect_ratio			= segment_msg.aspect_ratio*norm_var;
			segment_msg.mlp_distance_kurtosis					= segment_msg.kurtosis*norm_var;
			
			
			norm_var = segment_msg.number_of_points;

			segment_msg.div_number_std_deviation		= segment_msg.std_deviation/norm_var;
			segment_msg.div_number_mean_average_deviation_from_median =	segment_msg.mean_average_deviation_from_median/norm_var;
			segment_msg.div_number_width						= segment_msg.width/norm_var;
			segment_msg.div_number_linearity				= segment_msg.linearity/norm_var;
			segment_msg.div_number_radius						= segment_msg.radius/norm_var;
			segment_msg.div_number_circularity		  = segment_msg.circularity/norm_var;
			segment_msg.div_number_boundary_length	= segment_msg.boundary_length/norm_var;
			segment_msg.div_number_boundary_regulatity	= segment_msg.boundary_regulatity/norm_var;
			segment_msg.div_number_mean_curvature		= segment_msg.mean_curvature/norm_var;
			segment_msg.div_number_mean_angular_difference	= segment_msg.mean_angular_difference/norm_var;
			segment_msg.div_number_aspect_ratio			= segment_msg.aspect_ratio/norm_var;
			segment_msg.div_number_kurtosis					= segment_msg.kurtosis/norm_var;
			
			segment_msg.mlp_number_std_deviation		= segment_msg.std_deviation*norm_var;
			segment_msg.mlp_number_mean_average_deviation_from_median =	segment_msg.mean_average_deviation_from_median*norm_var;
			segment_msg.mlp_number_width						= segment_msg.width*norm_var;
			segment_msg.mlp_number_linearity				= segment_msg.linearity*norm_var;
			segment_msg.mlp_number_radius						= segment_msg.radius*norm_var;
			segment_msg.mlp_number_circularity		  = segment_msg.circularity*norm_var;
			segment_msg.mlp_number_boundary_length	= segment_msg.boundary_length*norm_var;
			segment_msg.mlp_number_boundary_regulatity	= segment_msg.boundary_regulatity*norm_var;
			segment_msg.mlp_number_mean_curvature		= segment_msg.mean_curvature*norm_var;
			segment_msg.mlp_number_mean_angular_difference	= segment_msg.mean_angular_difference*norm_var;
			segment_msg.mlp_number_aspect_ratio			= segment_msg.aspect_ratio*norm_var;
			segment_msg.mlp_number_kurtosis					= segment_msg.kurtosis*norm_var;
			
			segments_msg.segments[ii] = segment_msg;
		}
		auto time_2 = std::chrono::high_resolution_clock::now();
		float execution_time = std::chrono::duration_cast<std::chrono::microseconds>(time_2 - time_1).count();
		ROS_INFO("Execution time (microseconds): %f",execution_time);//float e_t = execution_time.count();
		scan_count++;
		ROS_INFO("feature scan count: %i, segments count: %i/%i",scan_count,segments_count,all_segments_count);
		
		features_pub.publish(segments_msg);
	
	}
	
	float calculate_2_point_distance(geometry_msgs::Point32 A,geometry_msgs::Point32 B) {
		return sqrt(pow(A.x-B.x,2)+pow(A.y-B.y,2)+pow(A.z-B.z,2));
	}
	
	//check
	float calculate_aspect_ratio(const laser_segmentation::Segment &segments, const int &number_of_points,std::tuple<float,float> line_param) {
		//aspect ratio == small_diam/big_diam -> 
		float gradient = std::get<0>(line_param);
		float y_axis = std::get<1>(line_param);
		
		geometry_msgs::Point32 first_point;
		first_point.x = segments.points[0].x;
		first_point.y = y_axis + (first_point.x * gradient);
		
		geometry_msgs::Point32 last_point;
		last_point.x = segments.points[number_of_points-1].x;
		last_point.y = y_axis + (last_point.x * gradient);
		
		
		float length = calculate_2_point_distance(first_point,last_point);
		float min_dist = std::numeric_limits<float>::infinity();
		float max_dist = -std::numeric_limits<float>::infinity();
		
		
		for(auto &segment : segments.points) {
			float y_fit = y_axis + gradient * segment.x;
			float dist = y_fit-segment.y;
			if(dist < min_dist)
				min_dist = dist;
			if(dist > max_dist)
				max_dist = dist;
		}
		
		
		float width = max_dist-min_dist;
		float aspect_ratio = width/length;
		if(aspect_ratio > 1)
			aspect_ratio = 1/aspect_ratio;
		
		return aspect_ratio;
	}
	
	float calculate_Kurtosis(const laser_segmentation::Segment &segments, const int &number_of_points, geometry_msgs::Point32 center, float std_deviation) {
		float sum = 0.0;
		for(int i = 0; i<number_of_points; i++) {
			float distance = sqrt(pow(segments.points[i].x-center.x,2)+pow(segments.points[i].y-center.y,2));
			sum += pow(distance/std_deviation,4);
		}
		return sum/number_of_points;
	}
	
	float calculate_circularity(geometry_msgs::Vector3 fitted_circle, const laser_segmentation::Segment &segments, const int &number_of_points) {
		float sum_of_squares = 0.0;
		for(int i = 0; i<number_of_points; i++) {
			sum_of_squares += pow(fitted_circle.z - sqrt(pow(fitted_circle.x-segments.points[i].x,2)+pow(fitted_circle.y-segments.points[i].y,2)),2);
		}
		//ROS_INFO("circularity: %f",sum_of_squares);
		return sum_of_squares;
	}
	
	geometry_msgs::Vector3 calculate_fitted_circle(const laser_segmentation::Segment &segments, const int &number_of_points) {
		
		geometry_msgs::Vector3 fitted_circle;
		
		Eigen::MatrixXd A(number_of_points,3);
		Eigen::MatrixXd b(number_of_points,1);
		
		for(int i = 0; i<number_of_points; i++) {
			A(i,0) = -2.0*segments.points[i].x;
			A(i,1) = -2.0*segments.points[i].y;
			A(i,2) = 1.0;
			
			b(i,0) = (-pow(segments.points[i].x,2)-pow(segments.points[i].y,2));
			
			//ROS_INFO("row %i: A %f,%f,%f ;  B %f",i,A(i,0),A(i,1),A(i,2),b(i,0));
		}
		
		Eigen::MatrixXd x = ((A.transpose()*A).inverse())*A.transpose()*b;
		
		//ROS_INFO("x: rows: %li cols: %li ",x.rows(),x.cols());
		
		fitted_circle.x = x(0,0);
		fitted_circle.y = x(1,0);
		fitted_circle.z = sqrt(pow(fitted_circle.x ,2)+pow(fitted_circle.y ,2)-x(2,0));
		
		//ROS_INFO("x_c: %f, y_c: %f, r_c: %f",fitted_circle.x,fitted_circle.y,fitted_circle.z);
			
		return fitted_circle;
	}
	
	
	float calculate_mean_angular_difference(const laser_segmentation::Segment &segments, const int &number_of_points) {
	
		float angular_diff = 0.0;
		for(int i = 2; i<number_of_points; i++) {
			geometry_msgs::Point32 v_ab;
			v_ab.x = segments.points[i-1].x - segments.points[i-2].x;
			v_ab.y = segments.points[i-1].y - segments.points[i-2].y;
			
			
			geometry_msgs::Point32 v_bc;
			v_bc.x = segments.points[i].x - segments.points[i-1].x;
			v_bc.y = segments.points[i].y - segments.points[i-1].y;
			
			float dot_prod = v_ab.x * v_bc.x + v_ab.y * v_bc.y;
			float v_ab_mag = sqrt(pow(v_ab.x,2)+pow(v_ab.y,2));
			float v_bc_mag = sqrt(pow(v_bc.x,2)+pow(v_bc.y,2));
			
			float beta_i = acos(dot_prod/(v_ab_mag*v_bc_mag));
			
			angular_diff += beta_i;

		}
		
		float mean_angular_diff = angular_diff/(number_of_points-2);
		
		//ROS_INFO("mean_angular_diff: %f",mean_angular_diff);
		
		return mean_angular_diff;
	}
	
	
	float calculate_mean_curvature(const laser_segmentation::Segment &segments, const int &number_of_points) {
	
	float k = 0.0;
	
		for(int i = 2; i<number_of_points; i++) {
			float d_a = sqrt(pow(segments.points[i-2].x-segments.points[i-1].x,2)+pow(segments.points[i-2].y-segments.points[i-1].y,2));
			float d_b = sqrt(pow(segments.points[i-1].x-segments.points[i].x,2)+pow(segments.points[i-1].y-segments.points[i].y,2));
			float d_c = sqrt(pow(segments.points[i-2].x-segments.points[i].x,2)+pow(segments.points[i-2].y-segments.points[i].y,2));
			
			float s = (d_a + d_b + d_c) /2;
			
			float A = sqrt(s*(s-d_a)*(s-d_b)*(s-d_c));
			
			float k_i = 4*A/(d_a*d_b*d_c);
			k += k_i;			
		}
		
	k = k/(number_of_points-2);
		
	//ROS_INFO("mean_curvature	: %f", k);
	
	return k;
	
	}
	
	
	float calculate_boundary_regularity(const laser_segmentation::Segment &segments, const int &number_of_points, const float boundary_length) {
		float mean = boundary_length/(number_of_points-1);
		float variance = 0.0;
		for(int i = 1; i<number_of_points; i++) {
			variance+= pow(sqrt(pow(segments.points[i].x-segments.points[i-1].x,2) + pow(segments.points[i].y-segments.points[i-1].y,2)) - mean,2);
		}
		
		float std_deviation = sqrt(variance);	
		
		return std_deviation;
	}
	

	float calculate_boundary_length(const laser_segmentation::Segment &segments, const int &number_of_points) {
	
		float boundary_length = 0.0;
		for(int i = 1; i<number_of_points; i++) {
			boundary_length += sqrt(pow(segments.points[i].x-segments.points[i-1].x,2) + pow(segments.points[i].y-segments.points[i-1].y,2));
		} 
		//ROS_INFO("boundary length: %f",boundary_length);
		return boundary_length;
	}
	
	std::tuple<float,float> fit_line(const laser_segmentation::Segment &segments, const int &number_of_points) {
		float x_sum = 0.0;
		float y_sum = 0.0;
		float x_sq_sum = 0.0;
		float y_sq_sum = 0.0;
		float x_y_sum = 0.0;
		for (auto &segment : segments.points) {
			x_sum += segment.x;
			y_sum += segment.y;
			x_sq_sum += segment.x*segment.x;
			y_sq_sum += segment.y*segment.y;
			x_y_sum += segment.x * segment.y;
		} 

		//https://sciencing.com/calculate-linearity-7560898.html correlation
		//float s_x = x_sq_sum - (x_sum*x_sum)/number_of_points;
		//float s_y = y_sq_sum - (y_sum*y_sum)/number_of_points;
		//float s_xy = (y_sum * x_sum)/number_of_points - x_y_sum;
		//float correlation = s_xy/(sqrt(s_x)*sqrt(s_y));
		
		
		//http://datagenetics.com/blog/august12013/index.html regression
		
		float gradient = ((number_of_points * x_y_sum) - (x_sum * y_sum))/
											((number_of_points * x_sq_sum)- (x_sum * x_sum));				
		float y_axis = (y_sum/number_of_points) - gradient*(x_sum/number_of_points);
		
		return std::make_tuple(gradient,y_axis);
	}
	
	//ueberpreuefen
	float calculate_linearity(const laser_segmentation::Segment &segments, const int &number_of_points, std::tuple<float,float> line_params) {
						
		float gradient = std::get<0>(line_params);
		float y_axis = std::get<1>(line_params);
		
		float sq_dist = 0.0;
		for (auto &segment : segments.points) {
			float y_fit = y_axis + gradient * segment.x;
			sq_dist += pow(y_fit-segment.y,2);
		}
		
		float linearity = sq_dist;
		
/*-------------handling moved to preprocessing		
		if(std::isnan(linearity)) { //check for NaN if calculation fails -> happens very few times shouldn ot be a problem e.g. 10/380094
			//ROS_INFO("linearity calc error: number_of_points: %i M: %f C: %f x_sum: %f y_sum: %f x_sq_sum: %f y_sq_sum: %f x_y_sum: %f",number_of_points,M,C,x_sum,y_sum,x_sq_sum,y_sq_sum,x_y_sum);
			linearity = -1;
		}
*/
			
		//ROS_INFO("linearity: %f",linearity);
		
		return linearity;
	}
	
	
	float calculate_width(const laser_segmentation::Segment &segment, const int &number_of_points) {
		geometry_msgs::Point32 first_point = segment.points[0];
		geometry_msgs::Point32 last_point = segment.points[number_of_points-1];
		
		float width = sqrt(pow(last_point.x - first_point.x, 2)+pow(last_point.y - first_point.y, 2));
		
		//ROS_INFO("width: %f",width);
		return width;
	}
	
	float calculate_jump_distance_succeeding(const laser_segmentation::PointCloudSegmented &msg, const int &segment_id) {				//checked 
		if(segment_id==boost::size(msg.segments)-1) 
			return 0.0;
			
		geometry_msgs::Point32 last_point = msg.segments[segment_id].points[boost::size(msg.segments[segment_id].points)-1];
		geometry_msgs::Point32 succeeding_point = msg.segments[segment_id+1].points[0];	
			
		float jump_distance_succeeding = sqrt(pow(last_point.x - succeeding_point.x, 2)+pow(last_point.y - succeeding_point.y, 2));
			
		//ROS_INFO("jump_distance_succeeding: %f",jump_distance_succeeding);
			
		return jump_distance_succeeding;
	}
	
	float calculate_jump_distance_preceeding(const laser_segmentation::PointCloudSegmented &msg, const int &segment_id) {				//checked
		if(segment_id==0) 
			return 0.0;
			
		geometry_msgs::Point32 first_point = msg.segments[segment_id].points[0];
		geometry_msgs::Point32 preceeding_point = msg.segments[segment_id-1].points[boost::size(msg.segments[segment_id-1].points)-1];	

		float jump_distance_preceeding = sqrt(pow(first_point.x - preceeding_point.x, 2)+pow(first_point.y - preceeding_point.y, 2));

		//ROS_INFO("jump_distance_preceeding: %f",jump_distance_preceeding);

		return jump_distance_preceeding;
	}
	
	float calculate_mean_average_deviation_from_median(const laser_segmentation::Segment &segment, const int &number_of_points) {			//checked
				
		geometry_msgs::Point32 median_point;
		if (number_of_points % 2 == 0) {
			median_point.x = (segment.points[number_of_points/2].x + segment.points[number_of_points/2+1].x)/2;
			median_point.y = (segment.points[number_of_points/2].y + segment.points[number_of_points/2+1].y)/2;
		} else {
			median_point = segment.points[(number_of_points+1)/2];
		}
		
		float mean_average_deviation;
		mean_average_deviation = 0;
		
		for(int i = 0; i < number_of_points; i++) {
			mean_average_deviation += (segment.points[i].x-median_point.x) + (segment.points[i].y-median_point.y);
		}
		
		mean_average_deviation = mean_average_deviation /number_of_points;
		
		//ROS_INFO("mean_average_deviation: %f",mean_average_deviation);

		return mean_average_deviation;
	}
	
	float calculate_std_deviation(const laser_segmentation::PointCloudSegmented &msg, const int &segment_id, const int &number_of_points, //checked
																									const geometry_msgs::Point32 &center) {
		
		float std_deviation = 0;
		for(int j = 0; j < number_of_points; j++)	{
			std_deviation += pow((msg.segments[segment_id].points[j].x - center.x)+(msg.segments[segment_id].points[j].y - center.y),2);
		}
		std_deviation = sqrt(std_deviation/(number_of_points-1));

		return std_deviation;
	}
	
	geometry_msgs::Point32 calculate_center(const laser_segmentation::PointCloudSegmented &msg,const int &segment_id,const int &number_of_points) {
			geometry_msgs::Point32 center;
			
			for(int j = 0; j < number_of_points; j++)	{
				center.x += msg.segments[segment_id].points[j].x;
				center.y += msg.segments[segment_id].points[j].y;
				center.z += msg.segments[segment_id].points[j].z;
			}
			
			center.x = center.x/number_of_points;
			center.y = center.y/number_of_points;
			center.z = center.z/number_of_points;
			
			return center;
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
  ros::init(argc, argv, "featureCalculator");

/*	ROS_INFO("ARG: %s", argv[1]);
	bool isSim = false;
	if(argv[1] && boost::lexical_cast<std::string>(argv[1]) == "--sim") {
			isSim = true;
	}*/


  FeatureCalculator FCObject;
   


  /**
   * ros::spin() will enter a loop, pumping callbacks.  With this version, all
   * callbacks will be called from within this thread (the main one).  ros::spin()
   * will exit when Ctrl-C is pressed, or the node is shutdown by the master.
   */
  ros::spin();

  return 0;
}
