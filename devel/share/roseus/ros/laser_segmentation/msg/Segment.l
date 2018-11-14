;; Auto-generated. Do not edit!


(when (boundp 'laser_segmentation::Segment)
  (if (not (find-package "LASER_SEGMENTATION"))
    (make-package "LASER_SEGMENTATION"))
  (shadow 'Segment (find-package "LASER_SEGMENTATION")))
(unless (find-package "LASER_SEGMENTATION::SEGMENT")
  (make-package "LASER_SEGMENTATION::SEGMENT"))

(in-package "ROS")
;;//! \htmlinclude Segment.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass laser_segmentation::Segment
  :super ros::object
  :slots (_points _class_id ))

(defmethod laser_segmentation::Segment
  (:init
   (&key
    ((:points __points) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point32 :init) r)) r))
    ((:class_id __class_id) 0)
    )
   (send-super :init)
   (setq _points __points)
   (setq _class_id (round __class_id))
   self)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:class_id
   (&optional __class_id)
   (if __class_id (setq _class_id __class_id)) _class_id)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point32[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ;; int32 _class_id
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point32[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;; int32 _class_id
       (write-long _class_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point32[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance geometry_msgs::Point32 :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int32 _class_id
     (setq _class_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get laser_segmentation::Segment :md5sum-) "653812b29ee135129fc16022303c10e0")
(setf (get laser_segmentation::Segment :datatype-) "laser_segmentation/Segment")
(setf (get laser_segmentation::Segment :definition-)
      "geometry_msgs/Point32[] points
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



(provide :laser_segmentation/Segment "653812b29ee135129fc16022303c10e0")


