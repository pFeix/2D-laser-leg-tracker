; Auto-generated. Do not edit!


(cl:in-package laser_segmentation-msg)


;//! \htmlinclude PointCloudSegmented.msg.html

(cl:defclass <PointCloudSegmented> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (segments
    :reader segments
    :initarg :segments
    :type (cl:vector laser_segmentation-msg:Segment)
   :initform (cl:make-array 0 :element-type 'laser_segmentation-msg:Segment :initial-element (cl:make-instance 'laser_segmentation-msg:Segment))))
)

(cl:defclass PointCloudSegmented (<PointCloudSegmented>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointCloudSegmented>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointCloudSegmented)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_segmentation-msg:<PointCloudSegmented> is deprecated: use laser_segmentation-msg:PointCloudSegmented instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PointCloudSegmented>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_segmentation-msg:header-val is deprecated.  Use laser_segmentation-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'segments-val :lambda-list '(m))
(cl:defmethod segments-val ((m <PointCloudSegmented>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_segmentation-msg:segments-val is deprecated.  Use laser_segmentation-msg:segments instead.")
  (segments m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointCloudSegmented>) ostream)
  "Serializes a message object of type '<PointCloudSegmented>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'segments))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'segments))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointCloudSegmented>) istream)
  "Deserializes a message object of type '<PointCloudSegmented>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'segments) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'segments)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'laser_segmentation-msg:Segment))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointCloudSegmented>)))
  "Returns string type for a message object of type '<PointCloudSegmented>"
  "laser_segmentation/PointCloudSegmented")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointCloudSegmented)))
  "Returns string type for a message object of type 'PointCloudSegmented"
  "laser_segmentation/PointCloudSegmented")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointCloudSegmented>)))
  "Returns md5sum for a message object of type '<PointCloudSegmented>"
  "01f27048a4424acfc2e3c1dd6636c9d4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointCloudSegmented)))
  "Returns md5sum for a message object of type 'PointCloudSegmented"
  "01f27048a4424acfc2e3c1dd6636c9d4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointCloudSegmented>)))
  "Returns full string definition for message of type '<PointCloudSegmented>"
  (cl:format cl:nil "Header header~%laser_segmentation/Segment[] segments~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: laser_segmentation/Segment~%geometry_msgs/Point32[] segment~%int32 class_id~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointCloudSegmented)))
  "Returns full string definition for message of type 'PointCloudSegmented"
  (cl:format cl:nil "Header header~%laser_segmentation/Segment[] segments~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: laser_segmentation/Segment~%geometry_msgs/Point32[] segment~%int32 class_id~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointCloudSegmented>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'segments) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointCloudSegmented>))
  "Converts a ROS message object to a list"
  (cl:list 'PointCloudSegmented
    (cl:cons ':header (header msg))
    (cl:cons ':segments (segments msg))
))
