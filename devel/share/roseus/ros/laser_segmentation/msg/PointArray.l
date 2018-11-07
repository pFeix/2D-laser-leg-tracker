;; Auto-generated. Do not edit!


(when (boundp 'laser_segmentation::PointArray)
  (if (not (find-package "LASER_SEGMENTATION"))
    (make-package "LASER_SEGMENTATION"))
  (shadow 'PointArray (find-package "LASER_SEGMENTATION")))
(unless (find-package "LASER_SEGMENTATION::POINTARRAY")
  (make-package "LASER_SEGMENTATION::POINTARRAY"))

(in-package "ROS")
;;//! \htmlinclude PointArray.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass laser_segmentation::PointArray
  :super ros::object
  :slots (_segment ))

(defmethod laser_segmentation::PointArray
  (:init
   (&key
    ((:segment __segment) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point32 :init) r)) r))
    )
   (send-super :init)
   (setq _segment __segment)
   self)
  (:segment
   (&rest __segment)
   (if (keywordp (car __segment))
       (send* _segment __segment)
     (progn
       (if __segment (setq _segment (car __segment)))
       _segment)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point32[] _segment
    (apply #'+ (send-all _segment :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point32[] _segment
     (write-long (length _segment) s)
     (dolist (elem _segment)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point32[] _segment
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _segment (let (r) (dotimes (i n) (push (instance geometry_msgs::Point32 :init) r)) r))
     (dolist (elem- _segment)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get laser_segmentation::PointArray :md5sum-) "8bab734a77cb06ef109b6411db4ce564")
(setf (get laser_segmentation::PointArray :datatype-) "laser_segmentation/PointArray")
(setf (get laser_segmentation::PointArray :definition-)
      "geometry_msgs/Point32[]     segment

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



(provide :laser_segmentation/PointArray "8bab734a77cb06ef109b6411db4ce564")


