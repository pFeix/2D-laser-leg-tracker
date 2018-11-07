; Auto-generated. Do not edit!


(cl:in-package laser_features-msg)


;//! \htmlinclude Featured_segments.msg.html

(cl:defclass <Featured_segments> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (segments
    :reader segments
    :initarg :segments
    :type (cl:vector laser_features-msg:Segment_featured)
   :initform (cl:make-array 0 :element-type 'laser_features-msg:Segment_featured :initial-element (cl:make-instance 'laser_features-msg:Segment_featured))))
)

(cl:defclass Featured_segments (<Featured_segments>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Featured_segments>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Featured_segments)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_features-msg:<Featured_segments> is deprecated: use laser_features-msg:Featured_segments instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Featured_segments>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:header-val is deprecated.  Use laser_features-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'segments-val :lambda-list '(m))
(cl:defmethod segments-val ((m <Featured_segments>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:segments-val is deprecated.  Use laser_features-msg:segments instead.")
  (segments m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Featured_segments>) ostream)
  "Serializes a message object of type '<Featured_segments>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'segments))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'segments))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Featured_segments>) istream)
  "Deserializes a message object of type '<Featured_segments>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'segments) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'segments)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'laser_features-msg:Segment_featured))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Featured_segments>)))
  "Returns string type for a message object of type '<Featured_segments>"
  "laser_features/Featured_segments")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Featured_segments)))
  "Returns string type for a message object of type 'Featured_segments"
  "laser_features/Featured_segments")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Featured_segments>)))
  "Returns md5sum for a message object of type '<Featured_segments>"
  "53ca7ad138f7ae77d9c0f8765518fe7c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Featured_segments)))
  "Returns md5sum for a message object of type 'Featured_segments"
  "53ca7ad138f7ae77d9c0f8765518fe7c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Featured_segments>)))
  "Returns full string definition for message of type '<Featured_segments>"
  (cl:format cl:nil "Header header~%laser_features/Segment_featured[] segments~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: laser_features/Segment_featured~%geometry_msgs/Point32[] points~%float32 class_id~%geometry_msgs/Point32 center~%float32 distance~%int32 nearest_neghbour_id~%~%float32 jump_distance_preceeding~%float32 jump_distance_succeeding~%float32 nearest_distance~%float32 sum_of_distances~%~%float32 number_of_points~%float32 std_deviation~%float32 mean_average_deviation_from_median~%float32 width~%float32 linearity~%float32 radius~%float32 circularity~%float32 boundary_length~%float32 boundary_regulatity~%float32 mean_curvature~%float32 mean_angular_difference~%float32 aspect_ratio~%float32 kurtosis~%~%#float32 div_distance_number_of_points~%#float32 div_distance_std_deviation~%#float32 div_distance_mean_average_deviation_from_median~%#float32 div_distance_width~%#float32 div_distance_linearity~%#float32 div_distance_radius~%#float32 div_distance_circularity~%#float32 div_distance_boundary_length~%#float32 div_distance_boundary_regulatity~%#float32 div_distance_mean_curvature~%#float32 div_distance_mean_angular_difference~%#float32 div_distance_aspect_ratio~%#float32 div_distance_kurtosis~%~%#float32 mlp_distance_number_of_points~%#float32 mlp_distance_std_deviation~%#float32 mlp_distance_mean_average_deviation_from_median~%#float32 mlp_distance_width~%#float32 mlp_distance_linearity~%#float32 mlp_distance_radius~%#float32 mlp_distance_circularity~%#float32 mlp_distance_boundary_length~%#float32 mlp_distance_boundary_regulatity~%#float32 mlp_distance_mean_curvature~%#float32 mlp_distance_mean_angular_difference~%#float32 mlp_distance_aspect_ratio~%#float32 mlp_distance_kurtosis~%~%#float32 div_number_std_deviation~%#float32 div_number_mean_average_deviation_from_median~%#float32 div_number_width~%#float32 div_number_linearity~%#float32 div_number_radius~%#float32 div_number_circularity~%#float32 div_number_boundary_length~%#float32 div_number_boundary_regulatity~%#float32 div_number_mean_curvature~%#float32 div_number_mean_angular_difference~%#float32 div_number_aspect_ratio~%#float32 div_number_kurtosis~%~%#float32 mlp_number_std_deviation~%#float32 mlp_number_mean_average_deviation_from_median~%#float32 mlp_number_width~%#float32 mlp_number_linearity~%#float32 mlp_number_radius~%#float32 mlp_number_circularity~%#float32 mlp_number_boundary_length~%#float32 mlp_number_boundary_regulatity~%#float32 mlp_number_mean_curvature~%#float32 mlp_number_mean_angular_difference~%#float32 mlp_number_aspect_ratio~%#float32 mlp_number_kurtosis~%~%~%float32 nn_number_of_points~%float32 nn_std_deviation~%float32 nn_mean_average_deviation_from_median~%float32 nn_width~%float32 nn_linearity~%float32 nn_radius~%float32 nn_circularity~%float32 nn_boundary_length~%float32 nn_boundary_regulatity~%float32 nn_mean_curvature~%float32 nn_mean_angular_difference~%float32 nn_aspect_ratio~%float32 nn_kurtosis~%~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Featured_segments)))
  "Returns full string definition for message of type 'Featured_segments"
  (cl:format cl:nil "Header header~%laser_features/Segment_featured[] segments~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: laser_features/Segment_featured~%geometry_msgs/Point32[] points~%float32 class_id~%geometry_msgs/Point32 center~%float32 distance~%int32 nearest_neghbour_id~%~%float32 jump_distance_preceeding~%float32 jump_distance_succeeding~%float32 nearest_distance~%float32 sum_of_distances~%~%float32 number_of_points~%float32 std_deviation~%float32 mean_average_deviation_from_median~%float32 width~%float32 linearity~%float32 radius~%float32 circularity~%float32 boundary_length~%float32 boundary_regulatity~%float32 mean_curvature~%float32 mean_angular_difference~%float32 aspect_ratio~%float32 kurtosis~%~%#float32 div_distance_number_of_points~%#float32 div_distance_std_deviation~%#float32 div_distance_mean_average_deviation_from_median~%#float32 div_distance_width~%#float32 div_distance_linearity~%#float32 div_distance_radius~%#float32 div_distance_circularity~%#float32 div_distance_boundary_length~%#float32 div_distance_boundary_regulatity~%#float32 div_distance_mean_curvature~%#float32 div_distance_mean_angular_difference~%#float32 div_distance_aspect_ratio~%#float32 div_distance_kurtosis~%~%#float32 mlp_distance_number_of_points~%#float32 mlp_distance_std_deviation~%#float32 mlp_distance_mean_average_deviation_from_median~%#float32 mlp_distance_width~%#float32 mlp_distance_linearity~%#float32 mlp_distance_radius~%#float32 mlp_distance_circularity~%#float32 mlp_distance_boundary_length~%#float32 mlp_distance_boundary_regulatity~%#float32 mlp_distance_mean_curvature~%#float32 mlp_distance_mean_angular_difference~%#float32 mlp_distance_aspect_ratio~%#float32 mlp_distance_kurtosis~%~%#float32 div_number_std_deviation~%#float32 div_number_mean_average_deviation_from_median~%#float32 div_number_width~%#float32 div_number_linearity~%#float32 div_number_radius~%#float32 div_number_circularity~%#float32 div_number_boundary_length~%#float32 div_number_boundary_regulatity~%#float32 div_number_mean_curvature~%#float32 div_number_mean_angular_difference~%#float32 div_number_aspect_ratio~%#float32 div_number_kurtosis~%~%#float32 mlp_number_std_deviation~%#float32 mlp_number_mean_average_deviation_from_median~%#float32 mlp_number_width~%#float32 mlp_number_linearity~%#float32 mlp_number_radius~%#float32 mlp_number_circularity~%#float32 mlp_number_boundary_length~%#float32 mlp_number_boundary_regulatity~%#float32 mlp_number_mean_curvature~%#float32 mlp_number_mean_angular_difference~%#float32 mlp_number_aspect_ratio~%#float32 mlp_number_kurtosis~%~%~%float32 nn_number_of_points~%float32 nn_std_deviation~%float32 nn_mean_average_deviation_from_median~%float32 nn_width~%float32 nn_linearity~%float32 nn_radius~%float32 nn_circularity~%float32 nn_boundary_length~%float32 nn_boundary_regulatity~%float32 nn_mean_curvature~%float32 nn_mean_angular_difference~%float32 nn_aspect_ratio~%float32 nn_kurtosis~%~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Featured_segments>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'segments) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Featured_segments>))
  "Converts a ROS message object to a list"
  (cl:list 'Featured_segments
    (cl:cons ':header (header msg))
    (cl:cons ':segments (segments msg))
))
