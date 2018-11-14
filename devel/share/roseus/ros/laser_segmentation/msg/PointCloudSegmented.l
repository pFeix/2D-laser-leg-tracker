;; Auto-generated. Do not edit!


(when (boundp 'laser_segmentation::PointCloudSegmented)
  (if (not (find-package "LASER_SEGMENTATION"))
    (make-package "LASER_SEGMENTATION"))
  (shadow 'PointCloudSegmented (find-package "LASER_SEGMENTATION")))
(unless (find-package "LASER_SEGMENTATION::POINTCLOUDSEGMENTED")
  (make-package "LASER_SEGMENTATION::POINTCLOUDSEGMENTED"))

(in-package "ROS")
;;//! \htmlinclude PointCloudSegmented.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass laser_segmentation::PointCloudSegmented
  :super ros::object
  :slots (_header _segments ))

(defmethod laser_segmentation::PointCloudSegmented
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:segments __segments) (let (r) (dotimes (i 0) (push (instance laser_segmentation::Segment :init) r)) r))
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
    ;; laser_segmentation/Segment[] _segments
    (apply #'+ (send-all _segments :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; laser_segmentation/Segment[] _segments
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
   ;; laser_segmentation/Segment[] _segments
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _segments (let (r) (dotimes (i n) (push (instance laser_segmentation::Segment :init) r)) r))
     (dolist (elem- _segments)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get laser_segmentation::PointCloudSegmented :md5sum-) "1fdd18917c0600141633e5caf4a303e6")
(setf (get laser_segmentation::PointCloudSegmented :datatype-) "laser_segmentation/PointCloudSegmented")
(setf (get laser_segmentation::PointCloudSegmented :definition-)
      "Header header
laser_segmentation/Segment[] segments

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
MSG: laser_segmentation/Segment
geometry_msgs/Point32[] points
int32 class_id

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



(provide :laser_segmentation/PointCloudSegmented "1fdd18917c0600141633e5caf4a303e6")


