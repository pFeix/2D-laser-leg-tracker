;; Auto-generated. Do not edit!


(when (boundp 'laser_features::Featured_segments)
  (if (not (find-package "LASER_FEATURES"))
    (make-package "LASER_FEATURES"))
  (shadow 'Featured_segments (find-package "LASER_FEATURES")))
(unless (find-package "LASER_FEATURES::FEATURED_SEGMENTS")
  (make-package "LASER_FEATURES::FEATURED_SEGMENTS"))

(in-package "ROS")
;;//! \htmlinclude Featured_segments.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass laser_features::Featured_segments
  :super ros::object
  :slots (_header _segments ))

(defmethod laser_features::Featured_segments
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:segments __segments) (let (r) (dotimes (i 0) (push (instance laser_features::Segment_featured :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _segments __segments)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:segments
   (&rest __segments)
   (if (keywordp (car __segments))
       (send* _segments __segments)
     (progn
       (if __segments (setq _segments (car __segments)))
       _segments)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; laser_features/Segment_featured[] _segments
    (apply #'+ (send-all _segments :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; laser_features/Segment_featured[] _segments
     (write-long (length _segments) s)
     (dolist (elem _segments)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; laser_features/Segment_featured[] _segments
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _segments (let (r) (dotimes (i n) (push (instance laser_features::Segment_featured :init) r)) r))
     (dolist (elem- _segments)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get laser_features::Featured_segments :md5sum-) "53ca7ad138f7ae77d9c0f8765518fe7c")
(setf (get laser_features::Featured_segments :datatype-) "laser_features/Featured_segments")
(setf (get laser_features::Featured_segments :definition-)
      "Header header
laser_features/Segment_featured[] segments

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: laser_features/Segment_featured
geometry_msgs/Point32[] points
float32 class_id
geometry_msgs/Point32 center
float32 distance
int32 nearest_neghbour_id

float32 jump_distance_preceeding
float32 jump_distance_succeeding
float32 nearest_distance
float32 sum_of_distances

float32 number_of_points
float32 std_deviation
float32 mean_average_deviation_from_median
float32 width
float32 linearity
float32 radius
float32 circularity
float32 boundary_length
float32 boundary_regulatity
float32 mean_curvature
float32 mean_angular_difference
float32 aspect_ratio
float32 kurtosis

#float32 div_distance_number_of_points
#float32 div_distance_std_deviation
#float32 div_distance_mean_average_deviation_from_median
#float32 div_distance_width
#float32 div_distance_linearity
#float32 div_distance_radius
#float32 div_distance_circularity
#float32 div_distance_boundary_length
#float32 div_distance_boundary_regulatity
#float32 div_distance_mean_curvature
#float32 div_distance_mean_angular_difference
#float32 div_distance_aspect_ratio
#float32 div_distance_kurtosis

#float32 mlp_distance_number_of_points
#float32 mlp_distance_std_deviation
#float32 mlp_distance_mean_average_deviation_from_median
#float32 mlp_distance_width
#float32 mlp_distance_linearity
#float32 mlp_distance_radius
#float32 mlp_distance_circularity
#float32 mlp_distance_boundary_length
#float32 mlp_distance_boundary_regulatity
#float32 mlp_distance_mean_curvature
#float32 mlp_distance_mean_angular_difference
#float32 mlp_distance_aspect_ratio
#float32 mlp_distance_kurtosis

#float32 div_number_std_deviation
#float32 div_number_mean_average_deviation_from_median
#float32 div_number_width
#float32 div_number_linearity
#float32 div_number_radius
#float32 div_number_circularity
#float32 div_number_boundary_length
#float32 div_number_boundary_regulatity
#float32 div_number_mean_curvature
#float32 div_number_mean_angular_difference
#float32 div_number_aspect_ratio
#float32 div_number_kurtosis

#float32 mlp_number_std_deviation
#float32 mlp_number_mean_average_deviation_from_median
#float32 mlp_number_width
#float32 mlp_number_linearity
#float32 mlp_number_radius
#float32 mlp_number_circularity
#float32 mlp_number_boundary_length
#float32 mlp_number_boundary_regulatity
#float32 mlp_number_mean_curvature
#float32 mlp_number_mean_angular_difference
#float32 mlp_number_aspect_ratio
#float32 mlp_number_kurtosis


float32 nn_number_of_points
float32 nn_std_deviation
float32 nn_mean_average_deviation_from_median
float32 nn_width
float32 nn_linearity
float32 nn_radius
float32 nn_circularity
float32 nn_boundary_length
float32 nn_boundary_regulatity
float32 nn_mean_curvature
float32 nn_mean_angular_difference
float32 nn_aspect_ratio
float32 nn_kurtosis


================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
float32 z
")



(provide :laser_features/Featured_segments "53ca7ad138f7ae77d9c0f8765518fe7c")


