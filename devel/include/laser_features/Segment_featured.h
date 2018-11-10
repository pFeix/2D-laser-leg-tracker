// Generated by gencpp from file laser_features/Segment_featured.msg
// DO NOT EDIT!


#ifndef LASER_FEATURES_MESSAGE_SEGMENT_FEATURED_H
#define LASER_FEATURES_MESSAGE_SEGMENT_FEATURED_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Point32.h>
#include <geometry_msgs/Point32.h>

namespace laser_features
{
template <class ContainerAllocator>
struct Segment_featured_
{
  typedef Segment_featured_<ContainerAllocator> Type;

  Segment_featured_()
    : points()
    , class_id(0.0)
    , center()
    , distance(0.0)
    , nearest_neghbour_id(0)
    , jump_distance_preceeding(0.0)
    , jump_distance_succeeding(0.0)
    , nearest_distance(0.0)
    , sum_of_distances(0.0)
    , number_of_points(0.0)
    , std_deviation(0.0)
    , mean_average_deviation_from_median(0.0)
    , width(0.0)
    , linearity(0.0)
    , radius(0.0)
    , circularity(0.0)
    , boundary_length(0.0)
    , boundary_regulatity(0.0)
    , mean_curvature(0.0)
    , mean_angular_difference(0.0)
    , aspect_ratio(0.0)
    , kurtosis(0.0)
    , nn_number_of_points(0.0)
    , nn_std_deviation(0.0)
    , nn_mean_average_deviation_from_median(0.0)
    , nn_width(0.0)
    , nn_linearity(0.0)
    , nn_radius(0.0)
    , nn_circularity(0.0)
    , nn_boundary_length(0.0)
    , nn_boundary_regulatity(0.0)
    , nn_mean_curvature(0.0)
    , nn_mean_angular_difference(0.0)
    , nn_aspect_ratio(0.0)
    , nn_kurtosis(0.0)  {
    }
  Segment_featured_(const ContainerAllocator& _alloc)
    : points(_alloc)
    , class_id(0.0)
    , center(_alloc)
    , distance(0.0)
    , nearest_neghbour_id(0)
    , jump_distance_preceeding(0.0)
    , jump_distance_succeeding(0.0)
    , nearest_distance(0.0)
    , sum_of_distances(0.0)
    , number_of_points(0.0)
    , std_deviation(0.0)
    , mean_average_deviation_from_median(0.0)
    , width(0.0)
    , linearity(0.0)
    , radius(0.0)
    , circularity(0.0)
    , boundary_length(0.0)
    , boundary_regulatity(0.0)
    , mean_curvature(0.0)
    , mean_angular_difference(0.0)
    , aspect_ratio(0.0)
    , kurtosis(0.0)
    , nn_number_of_points(0.0)
    , nn_std_deviation(0.0)
    , nn_mean_average_deviation_from_median(0.0)
    , nn_width(0.0)
    , nn_linearity(0.0)
    , nn_radius(0.0)
    , nn_circularity(0.0)
    , nn_boundary_length(0.0)
    , nn_boundary_regulatity(0.0)
    , nn_mean_curvature(0.0)
    , nn_mean_angular_difference(0.0)
    , nn_aspect_ratio(0.0)
    , nn_kurtosis(0.0)  {
  (void)_alloc;
    }



   typedef std::vector< ::geometry_msgs::Point32_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::geometry_msgs::Point32_<ContainerAllocator> >::other >  _points_type;
  _points_type points;

   typedef float _class_id_type;
  _class_id_type class_id;

   typedef  ::geometry_msgs::Point32_<ContainerAllocator>  _center_type;
  _center_type center;

   typedef float _distance_type;
  _distance_type distance;

   typedef int32_t _nearest_neghbour_id_type;
  _nearest_neghbour_id_type nearest_neghbour_id;

   typedef float _jump_distance_preceeding_type;
  _jump_distance_preceeding_type jump_distance_preceeding;

   typedef float _jump_distance_succeeding_type;
  _jump_distance_succeeding_type jump_distance_succeeding;

   typedef float _nearest_distance_type;
  _nearest_distance_type nearest_distance;

   typedef float _sum_of_distances_type;
  _sum_of_distances_type sum_of_distances;

   typedef float _number_of_points_type;
  _number_of_points_type number_of_points;

   typedef float _std_deviation_type;
  _std_deviation_type std_deviation;

   typedef float _mean_average_deviation_from_median_type;
  _mean_average_deviation_from_median_type mean_average_deviation_from_median;

   typedef float _width_type;
  _width_type width;

   typedef float _linearity_type;
  _linearity_type linearity;

   typedef float _radius_type;
  _radius_type radius;

   typedef float _circularity_type;
  _circularity_type circularity;

   typedef float _boundary_length_type;
  _boundary_length_type boundary_length;

   typedef float _boundary_regulatity_type;
  _boundary_regulatity_type boundary_regulatity;

   typedef float _mean_curvature_type;
  _mean_curvature_type mean_curvature;

   typedef float _mean_angular_difference_type;
  _mean_angular_difference_type mean_angular_difference;

   typedef float _aspect_ratio_type;
  _aspect_ratio_type aspect_ratio;

   typedef float _kurtosis_type;
  _kurtosis_type kurtosis;

   typedef float _nn_number_of_points_type;
  _nn_number_of_points_type nn_number_of_points;

   typedef float _nn_std_deviation_type;
  _nn_std_deviation_type nn_std_deviation;

   typedef float _nn_mean_average_deviation_from_median_type;
  _nn_mean_average_deviation_from_median_type nn_mean_average_deviation_from_median;

   typedef float _nn_width_type;
  _nn_width_type nn_width;

   typedef float _nn_linearity_type;
  _nn_linearity_type nn_linearity;

   typedef float _nn_radius_type;
  _nn_radius_type nn_radius;

   typedef float _nn_circularity_type;
  _nn_circularity_type nn_circularity;

   typedef float _nn_boundary_length_type;
  _nn_boundary_length_type nn_boundary_length;

   typedef float _nn_boundary_regulatity_type;
  _nn_boundary_regulatity_type nn_boundary_regulatity;

   typedef float _nn_mean_curvature_type;
  _nn_mean_curvature_type nn_mean_curvature;

   typedef float _nn_mean_angular_difference_type;
  _nn_mean_angular_difference_type nn_mean_angular_difference;

   typedef float _nn_aspect_ratio_type;
  _nn_aspect_ratio_type nn_aspect_ratio;

   typedef float _nn_kurtosis_type;
  _nn_kurtosis_type nn_kurtosis;





  typedef boost::shared_ptr< ::laser_features::Segment_featured_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::laser_features::Segment_featured_<ContainerAllocator> const> ConstPtr;

}; // struct Segment_featured_

typedef ::laser_features::Segment_featured_<std::allocator<void> > Segment_featured;

typedef boost::shared_ptr< ::laser_features::Segment_featured > Segment_featuredPtr;
typedef boost::shared_ptr< ::laser_features::Segment_featured const> Segment_featuredConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::laser_features::Segment_featured_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::laser_features::Segment_featured_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace laser_features

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'laser_features': ['/home/pfeix/robot_host_ws/src/laser_features/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::laser_features::Segment_featured_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::laser_features::Segment_featured_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::laser_features::Segment_featured_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::laser_features::Segment_featured_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::laser_features::Segment_featured_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::laser_features::Segment_featured_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::laser_features::Segment_featured_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6151e5e19cab3935f12db4c2e82530b4";
  }

  static const char* value(const ::laser_features::Segment_featured_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6151e5e19cab3935ULL;
  static const uint64_t static_value2 = 0xf12db4c2e82530b4ULL;
};

template<class ContainerAllocator>
struct DataType< ::laser_features::Segment_featured_<ContainerAllocator> >
{
  static const char* value()
  {
    return "laser_features/Segment_featured";
  }

  static const char* value(const ::laser_features::Segment_featured_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::laser_features::Segment_featured_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Point32[] points\n\
float32 class_id\n\
geometry_msgs/Point32 center\n\
float32 distance\n\
int32 nearest_neghbour_id\n\
\n\
float32 jump_distance_preceeding\n\
float32 jump_distance_succeeding\n\
float32 nearest_distance\n\
float32 sum_of_distances\n\
\n\
float32 number_of_points\n\
float32 std_deviation\n\
float32 mean_average_deviation_from_median\n\
float32 width\n\
float32 linearity\n\
float32 radius\n\
float32 circularity\n\
float32 boundary_length\n\
float32 boundary_regulatity\n\
float32 mean_curvature\n\
float32 mean_angular_difference\n\
float32 aspect_ratio\n\
float32 kurtosis\n\
\n\
#float32 div_distance_number_of_points\n\
#float32 div_distance_std_deviation\n\
#float32 div_distance_mean_average_deviation_from_median\n\
#float32 div_distance_width\n\
#float32 div_distance_linearity\n\
#float32 div_distance_radius\n\
#float32 div_distance_circularity\n\
#float32 div_distance_boundary_length\n\
#float32 div_distance_boundary_regulatity\n\
#float32 div_distance_mean_curvature\n\
#float32 div_distance_mean_angular_difference\n\
#float32 div_distance_aspect_ratio\n\
#float32 div_distance_kurtosis\n\
\n\
#float32 mlp_distance_number_of_points\n\
#float32 mlp_distance_std_deviation\n\
#float32 mlp_distance_mean_average_deviation_from_median\n\
#float32 mlp_distance_width\n\
#float32 mlp_distance_linearity\n\
#float32 mlp_distance_radius\n\
#float32 mlp_distance_circularity\n\
#float32 mlp_distance_boundary_length\n\
#float32 mlp_distance_boundary_regulatity\n\
#float32 mlp_distance_mean_curvature\n\
#float32 mlp_distance_mean_angular_difference\n\
#float32 mlp_distance_aspect_ratio\n\
#float32 mlp_distance_kurtosis\n\
\n\
#float32 div_number_std_deviation\n\
#float32 div_number_mean_average_deviation_from_median\n\
#float32 div_number_width\n\
#float32 div_number_linearity\n\
#float32 div_number_radius\n\
#float32 div_number_circularity\n\
#float32 div_number_boundary_length\n\
#float32 div_number_boundary_regulatity\n\
#float32 div_number_mean_curvature\n\
#float32 div_number_mean_angular_difference\n\
#float32 div_number_aspect_ratio\n\
#float32 div_number_kurtosis\n\
\n\
#float32 mlp_number_std_deviation\n\
#float32 mlp_number_mean_average_deviation_from_median\n\
#float32 mlp_number_width\n\
#float32 mlp_number_linearity\n\
#float32 mlp_number_radius\n\
#float32 mlp_number_circularity\n\
#float32 mlp_number_boundary_length\n\
#float32 mlp_number_boundary_regulatity\n\
#float32 mlp_number_mean_curvature\n\
#float32 mlp_number_mean_angular_difference\n\
#float32 mlp_number_aspect_ratio\n\
#float32 mlp_number_kurtosis\n\
\n\
\n\
float32 nn_number_of_points\n\
float32 nn_std_deviation\n\
float32 nn_mean_average_deviation_from_median\n\
float32 nn_width\n\
float32 nn_linearity\n\
float32 nn_radius\n\
float32 nn_circularity\n\
float32 nn_boundary_length\n\
float32 nn_boundary_regulatity\n\
float32 nn_mean_curvature\n\
float32 nn_mean_angular_difference\n\
float32 nn_aspect_ratio\n\
float32 nn_kurtosis\n\
\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point32\n\
# This contains the position of a point in free space(with 32 bits of precision).\n\
# It is recommeded to use Point wherever possible instead of Point32.  \n\
# \n\
# This recommendation is to promote interoperability.  \n\
#\n\
# This message is designed to take up less space when sending\n\
# lots of points at once, as in the case of a PointCloud.  \n\
\n\
float32 x\n\
float32 y\n\
float32 z\n\
";
  }

  static const char* value(const ::laser_features::Segment_featured_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::laser_features::Segment_featured_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.points);
      stream.next(m.class_id);
      stream.next(m.center);
      stream.next(m.distance);
      stream.next(m.nearest_neghbour_id);
      stream.next(m.jump_distance_preceeding);
      stream.next(m.jump_distance_succeeding);
      stream.next(m.nearest_distance);
      stream.next(m.sum_of_distances);
      stream.next(m.number_of_points);
      stream.next(m.std_deviation);
      stream.next(m.mean_average_deviation_from_median);
      stream.next(m.width);
      stream.next(m.linearity);
      stream.next(m.radius);
      stream.next(m.circularity);
      stream.next(m.boundary_length);
      stream.next(m.boundary_regulatity);
      stream.next(m.mean_curvature);
      stream.next(m.mean_angular_difference);
      stream.next(m.aspect_ratio);
      stream.next(m.kurtosis);
      stream.next(m.nn_number_of_points);
      stream.next(m.nn_std_deviation);
      stream.next(m.nn_mean_average_deviation_from_median);
      stream.next(m.nn_width);
      stream.next(m.nn_linearity);
      stream.next(m.nn_radius);
      stream.next(m.nn_circularity);
      stream.next(m.nn_boundary_length);
      stream.next(m.nn_boundary_regulatity);
      stream.next(m.nn_mean_curvature);
      stream.next(m.nn_mean_angular_difference);
      stream.next(m.nn_aspect_ratio);
      stream.next(m.nn_kurtosis);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Segment_featured_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::laser_features::Segment_featured_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::laser_features::Segment_featured_<ContainerAllocator>& v)
  {
    s << indent << "points[]" << std::endl;
    for (size_t i = 0; i < v.points.size(); ++i)
    {
      s << indent << "  points[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::geometry_msgs::Point32_<ContainerAllocator> >::stream(s, indent + "    ", v.points[i]);
    }
    s << indent << "class_id: ";
    Printer<float>::stream(s, indent + "  ", v.class_id);
    s << indent << "center: ";
    s << std::endl;
    Printer< ::geometry_msgs::Point32_<ContainerAllocator> >::stream(s, indent + "  ", v.center);
    s << indent << "distance: ";
    Printer<float>::stream(s, indent + "  ", v.distance);
    s << indent << "nearest_neghbour_id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.nearest_neghbour_id);
    s << indent << "jump_distance_preceeding: ";
    Printer<float>::stream(s, indent + "  ", v.jump_distance_preceeding);
    s << indent << "jump_distance_succeeding: ";
    Printer<float>::stream(s, indent + "  ", v.jump_distance_succeeding);
    s << indent << "nearest_distance: ";
    Printer<float>::stream(s, indent + "  ", v.nearest_distance);
    s << indent << "sum_of_distances: ";
    Printer<float>::stream(s, indent + "  ", v.sum_of_distances);
    s << indent << "number_of_points: ";
    Printer<float>::stream(s, indent + "  ", v.number_of_points);
    s << indent << "std_deviation: ";
    Printer<float>::stream(s, indent + "  ", v.std_deviation);
    s << indent << "mean_average_deviation_from_median: ";
    Printer<float>::stream(s, indent + "  ", v.mean_average_deviation_from_median);
    s << indent << "width: ";
    Printer<float>::stream(s, indent + "  ", v.width);
    s << indent << "linearity: ";
    Printer<float>::stream(s, indent + "  ", v.linearity);
    s << indent << "radius: ";
    Printer<float>::stream(s, indent + "  ", v.radius);
    s << indent << "circularity: ";
    Printer<float>::stream(s, indent + "  ", v.circularity);
    s << indent << "boundary_length: ";
    Printer<float>::stream(s, indent + "  ", v.boundary_length);
    s << indent << "boundary_regulatity: ";
    Printer<float>::stream(s, indent + "  ", v.boundary_regulatity);
    s << indent << "mean_curvature: ";
    Printer<float>::stream(s, indent + "  ", v.mean_curvature);
    s << indent << "mean_angular_difference: ";
    Printer<float>::stream(s, indent + "  ", v.mean_angular_difference);
    s << indent << "aspect_ratio: ";
    Printer<float>::stream(s, indent + "  ", v.aspect_ratio);
    s << indent << "kurtosis: ";
    Printer<float>::stream(s, indent + "  ", v.kurtosis);
    s << indent << "nn_number_of_points: ";
    Printer<float>::stream(s, indent + "  ", v.nn_number_of_points);
    s << indent << "nn_std_deviation: ";
    Printer<float>::stream(s, indent + "  ", v.nn_std_deviation);
    s << indent << "nn_mean_average_deviation_from_median: ";
    Printer<float>::stream(s, indent + "  ", v.nn_mean_average_deviation_from_median);
    s << indent << "nn_width: ";
    Printer<float>::stream(s, indent + "  ", v.nn_width);
    s << indent << "nn_linearity: ";
    Printer<float>::stream(s, indent + "  ", v.nn_linearity);
    s << indent << "nn_radius: ";
    Printer<float>::stream(s, indent + "  ", v.nn_radius);
    s << indent << "nn_circularity: ";
    Printer<float>::stream(s, indent + "  ", v.nn_circularity);
    s << indent << "nn_boundary_length: ";
    Printer<float>::stream(s, indent + "  ", v.nn_boundary_length);
    s << indent << "nn_boundary_regulatity: ";
    Printer<float>::stream(s, indent + "  ", v.nn_boundary_regulatity);
    s << indent << "nn_mean_curvature: ";
    Printer<float>::stream(s, indent + "  ", v.nn_mean_curvature);
    s << indent << "nn_mean_angular_difference: ";
    Printer<float>::stream(s, indent + "  ", v.nn_mean_angular_difference);
    s << indent << "nn_aspect_ratio: ";
    Printer<float>::stream(s, indent + "  ", v.nn_aspect_ratio);
    s << indent << "nn_kurtosis: ";
    Printer<float>::stream(s, indent + "  ", v.nn_kurtosis);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LASER_FEATURES_MESSAGE_SEGMENT_FEATURED_H