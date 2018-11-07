;; Auto-generated. Do not edit!


(when (boundp 'laser_features::Segment_featured)
  (if (not (find-package "LASER_FEATURES"))
    (make-package "LASER_FEATURES"))
  (shadow 'Segment_featured (find-package "LASER_FEATURES")))
(unless (find-package "LASER_FEATURES::SEGMENT_FEATURED")
  (make-package "LASER_FEATURES::SEGMENT_FEATURED"))

(in-package "ROS")
;;//! \htmlinclude Segment_featured.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass laser_features::Segment_featured
  :super ros::object
  :slots (_points _class_id _center _distance _nearest_neghbour_id _jump_distance_preceeding _jump_distance_succeeding _nearest_distance _sum_of_distances _number_of_points _std_deviation _mean_average_deviation_from_median _width _linearity _radius _circularity _boundary_length _boundary_regulatity _mean_curvature _mean_angular_difference _aspect_ratio _kurtosis _nn_number_of_points _nn_std_deviation _nn_mean_average_deviation_from_median _nn_width _nn_linearity _nn_radius _nn_circularity _nn_boundary_length _nn_boundary_regulatity _nn_mean_curvature _nn_mean_angular_difference _nn_aspect_ratio _nn_kurtosis ))

(defmethod laser_features::Segment_featured
  (:init
   (&key
    ((:points __points) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point32 :init) r)) r))
    ((:class_id __class_id) 0.0)
    ((:center __center) (instance geometry_msgs::Point32 :init))
    ((:distance __distance) 0.0)
    ((:nearest_neghbour_id __nearest_neghbour_id) 0)
    ((:jump_distance_preceeding __jump_distance_preceeding) 0.0)
    ((:jump_distance_succeeding __jump_distance_succeeding) 0.0)
    ((:nearest_distance __nearest_distance) 0.0)
    ((:sum_of_distances __sum_of_distances) 0.0)
    ((:number_of_points __number_of_points) 0.0)
    ((:std_deviation __std_deviation) 0.0)
    ((:mean_average_deviation_from_median __mean_average_deviation_from_median) 0.0)
    ((:width __width) 0.0)
    ((:linearity __linearity) 0.0)
    ((:radius __radius) 0.0)
    ((:circularity __circularity) 0.0)
    ((:boundary_length __boundary_length) 0.0)
    ((:boundary_regulatity __boundary_regulatity) 0.0)
    ((:mean_curvature __mean_curvature) 0.0)
    ((:mean_angular_difference __mean_angular_difference) 0.0)
    ((:aspect_ratio __aspect_ratio) 0.0)
    ((:kurtosis __kurtosis) 0.0)
    ((:nn_number_of_points __nn_number_of_points) 0.0)
    ((:nn_std_deviation __nn_std_deviation) 0.0)
    ((:nn_mean_average_deviation_from_median __nn_mean_average_deviation_from_median) 0.0)
    ((:nn_width __nn_width) 0.0)
    ((:nn_linearity __nn_linearity) 0.0)
    ((:nn_radius __nn_radius) 0.0)
    ((:nn_circularity __nn_circularity) 0.0)
    ((:nn_boundary_length __nn_boundary_length) 0.0)
    ((:nn_boundary_regulatity __nn_boundary_regulatity) 0.0)
    ((:nn_mean_curvature __nn_mean_curvature) 0.0)
    ((:nn_mean_angular_difference __nn_mean_angular_difference) 0.0)
    ((:nn_aspect_ratio __nn_aspect_ratio) 0.0)
    ((:nn_kurtosis __nn_kurtosis) 0.0)
    )
   (send-super :init)
   (setq _points __points)
   (setq _class_id (float __class_id))
   (setq _center __center)
   (setq _distance (float __distance))
   (setq _nearest_neghbour_id (round __nearest_neghbour_id))
   (setq _jump_distance_preceeding (float __jump_distance_preceeding))
   (setq _jump_distance_succeeding (float __jump_distance_succeeding))
   (setq _nearest_distance (float __nearest_distance))
   (setq _sum_of_distances (float __sum_of_distances))
   (setq _number_of_points (float __number_of_points))
   (setq _std_deviation (float __std_deviation))
   (setq _mean_average_deviation_from_median (float __mean_average_deviation_from_median))
   (setq _width (float __width))
   (setq _linearity (float __linearity))
   (setq _radius (float __radius))
   (setq _circularity (float __circularity))
   (setq _boundary_length (float __boundary_length))
   (setq _boundary_regulatity (float __boundary_regulatity))
   (setq _mean_curvature (float __mean_curvature))
   (setq _mean_angular_difference (float __mean_angular_difference))
   (setq _aspect_ratio (float __aspect_ratio))
   (setq _kurtosis (float __kurtosis))
   (setq _nn_number_of_points (float __nn_number_of_points))
   (setq _nn_std_deviation (float __nn_std_deviation))
   (setq _nn_mean_average_deviation_from_median (float __nn_mean_average_deviation_from_median))
   (setq _nn_width (float __nn_width))
   (setq _nn_linearity (float __nn_linearity))
   (setq _nn_radius (float __nn_radius))
   (setq _nn_circularity (float __nn_circularity))
   (setq _nn_boundary_length (float __nn_boundary_length))
   (setq _nn_boundary_regulatity (float __nn_boundary_regulatity))
   (setq _nn_mean_curvature (float __nn_mean_curvature))
   (setq _nn_mean_angular_difference (float __nn_mean_angular_difference))
   (setq _nn_aspect_ratio (float __nn_aspect_ratio))
   (setq _nn_kurtosis (float __nn_kurtosis))
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
  (:center
   (&rest __center)
   (if (keywordp (car __center))
       (send* _center __center)
     (progn
       (if __center (setq _center (car __center)))
       _center)))
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:nearest_neghbour_id
   (&optional __nearest_neghbour_id)
   (if __nearest_neghbour_id (setq _nearest_neghbour_id __nearest_neghbour_id)) _nearest_neghbour_id)
  (:jump_distance_preceeding
   (&optional __jump_distance_preceeding)
   (if __jump_distance_preceeding (setq _jump_distance_preceeding __jump_distance_preceeding)) _jump_distance_preceeding)
  (:jump_distance_succeeding
   (&optional __jump_distance_succeeding)
   (if __jump_distance_succeeding (setq _jump_distance_succeeding __jump_distance_succeeding)) _jump_distance_succeeding)
  (:nearest_distance
   (&optional __nearest_distance)
   (if __nearest_distance (setq _nearest_distance __nearest_distance)) _nearest_distance)
  (:sum_of_distances
   (&optional __sum_of_distances)
   (if __sum_of_distances (setq _sum_of_distances __sum_of_distances)) _sum_of_distances)
  (:number_of_points
   (&optional __number_of_points)
   (if __number_of_points (setq _number_of_points __number_of_points)) _number_of_points)
  (:std_deviation
   (&optional __std_deviation)
   (if __std_deviation (setq _std_deviation __std_deviation)) _std_deviation)
  (:mean_average_deviation_from_median
   (&optional __mean_average_deviation_from_median)
   (if __mean_average_deviation_from_median (setq _mean_average_deviation_from_median __mean_average_deviation_from_median)) _mean_average_deviation_from_median)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:linearity
   (&optional __linearity)
   (if __linearity (setq _linearity __linearity)) _linearity)
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:circularity
   (&optional __circularity)
   (if __circularity (setq _circularity __circularity)) _circularity)
  (:boundary_length
   (&optional __boundary_length)
   (if __boundary_length (setq _boundary_length __boundary_length)) _boundary_length)
  (:boundary_regulatity
   (&optional __boundary_regulatity)
   (if __boundary_regulatity (setq _boundary_regulatity __boundary_regulatity)) _boundary_regulatity)
  (:mean_curvature
   (&optional __mean_curvature)
   (if __mean_curvature (setq _mean_curvature __mean_curvature)) _mean_curvature)
  (:mean_angular_difference
   (&optional __mean_angular_difference)
   (if __mean_angular_difference (setq _mean_angular_difference __mean_angular_difference)) _mean_angular_difference)
  (:aspect_ratio
   (&optional __aspect_ratio)
   (if __aspect_ratio (setq _aspect_ratio __aspect_ratio)) _aspect_ratio)
  (:kurtosis
   (&optional __kurtosis)
   (if __kurtosis (setq _kurtosis __kurtosis)) _kurtosis)
  (:nn_number_of_points
   (&optional __nn_number_of_points)
   (if __nn_number_of_points (setq _nn_number_of_points __nn_number_of_points)) _nn_number_of_points)
  (:nn_std_deviation
   (&optional __nn_std_deviation)
   (if __nn_std_deviation (setq _nn_std_deviation __nn_std_deviation)) _nn_std_deviation)
  (:nn_mean_average_deviation_from_median
   (&optional __nn_mean_average_deviation_from_median)
   (if __nn_mean_average_deviation_from_median (setq _nn_mean_average_deviation_from_median __nn_mean_average_deviation_from_median)) _nn_mean_average_deviation_from_median)
  (:nn_width
   (&optional __nn_width)
   (if __nn_width (setq _nn_width __nn_width)) _nn_width)
  (:nn_linearity
   (&optional __nn_linearity)
   (if __nn_linearity (setq _nn_linearity __nn_linearity)) _nn_linearity)
  (:nn_radius
   (&optional __nn_radius)
   (if __nn_radius (setq _nn_radius __nn_radius)) _nn_radius)
  (:nn_circularity
   (&optional __nn_circularity)
   (if __nn_circularity (setq _nn_circularity __nn_circularity)) _nn_circularity)
  (:nn_boundary_length
   (&optional __nn_boundary_length)
   (if __nn_boundary_length (setq _nn_boundary_length __nn_boundary_length)) _nn_boundary_length)
  (:nn_boundary_regulatity
   (&optional __nn_boundary_regulatity)
   (if __nn_boundary_regulatity (setq _nn_boundary_regulatity __nn_boundary_regulatity)) _nn_boundary_regulatity)
  (:nn_mean_curvature
   (&optional __nn_mean_curvature)
   (if __nn_mean_curvature (setq _nn_mean_curvature __nn_mean_curvature)) _nn_mean_curvature)
  (:nn_mean_angular_difference
   (&optional __nn_mean_angular_difference)
   (if __nn_mean_angular_difference (setq _nn_mean_angular_difference __nn_mean_angular_difference)) _nn_mean_angular_difference)
  (:nn_aspect_ratio
   (&optional __nn_aspect_ratio)
   (if __nn_aspect_ratio (setq _nn_aspect_ratio __nn_aspect_ratio)) _nn_aspect_ratio)
  (:nn_kurtosis
   (&optional __nn_kurtosis)
   (if __nn_kurtosis (setq _nn_kurtosis __nn_kurtosis)) _nn_kurtosis)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point32[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ;; float32 _class_id
    4
    ;; geometry_msgs/Point32 _center
    (send _center :serialization-length)
    ;; float32 _distance
    4
    ;; int32 _nearest_neghbour_id
    4
    ;; float32 _jump_distance_preceeding
    4
    ;; float32 _jump_distance_succeeding
    4
    ;; float32 _nearest_distance
    4
    ;; float32 _sum_of_distances
    4
    ;; float32 _number_of_points
    4
    ;; float32 _std_deviation
    4
    ;; float32 _mean_average_deviation_from_median
    4
    ;; float32 _width
    4
    ;; float32 _linearity
    4
    ;; float32 _radius
    4
    ;; float32 _circularity
    4
    ;; float32 _boundary_length
    4
    ;; float32 _boundary_regulatity
    4
    ;; float32 _mean_curvature
    4
    ;; float32 _mean_angular_difference
    4
    ;; float32 _aspect_ratio
    4
    ;; float32 _kurtosis
    4
    ;; float32 _nn_number_of_points
    4
    ;; float32 _nn_std_deviation
    4
    ;; float32 _nn_mean_average_deviation_from_median
    4
    ;; float32 _nn_width
    4
    ;; float32 _nn_linearity
    4
    ;; float32 _nn_radius
    4
    ;; float32 _nn_circularity
    4
    ;; float32 _nn_boundary_length
    4
    ;; float32 _nn_boundary_regulatity
    4
    ;; float32 _nn_mean_curvature
    4
    ;; float32 _nn_mean_angular_difference
    4
    ;; float32 _nn_aspect_ratio
    4
    ;; float32 _nn_kurtosis
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
     ;; float32 _class_id
       (sys::poke _class_id (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Point32 _center
       (send _center :serialize s)
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _nearest_neghbour_id
       (write-long _nearest_neghbour_id s)
     ;; float32 _jump_distance_preceeding
       (sys::poke _jump_distance_preceeding (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _jump_distance_succeeding
       (sys::poke _jump_distance_succeeding (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _nearest_distance
       (sys::poke _nearest_distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sum_of_distances
       (sys::poke _sum_of_distances (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _number_of_points
       (sys::poke _number_of_points (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _std_deviation
       (sys::poke _std_deviation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _mean_average_deviation_from_median
       (sys::poke _mean_average_deviation_from_median (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _linearity
       (sys::poke _linearity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _radius
       (sys::poke _radius (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _circularity
       (sys::poke _circularity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _boundary_length
       (sys::poke _boundary_length (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _boundary_regulatity
       (sys::poke _boundary_regulatity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _mean_curvature
       (sys::poke _mean_curvature (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _mean_angular_difference
       (sys::poke _mean_angular_difference (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _aspect_ratio
       (sys::poke _aspect_ratio (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _kurtosis
       (sys::poke _kurtosis (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _nn_number_of_points
       (sys::poke _nn_number_of_points (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _nn_std_deviation
       (sys::poke _nn_std_deviation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _nn_mean_average_deviation_from_median
       (sys::poke _nn_mean_average_deviation_from_median (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _nn_width
       (sys::poke _nn_width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _nn_linearity
       (sys::poke _nn_linearity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _nn_radius
       (sys::poke _nn_radius (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _nn_circularity
       (sys::poke _nn_circularity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _nn_boundary_length
       (sys::poke _nn_boundary_length (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _nn_boundary_regulatity
       (sys::poke _nn_boundary_regulatity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _nn_mean_curvature
       (sys::poke _nn_mean_curvature (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _nn_mean_angular_difference
       (sys::poke _nn_mean_angular_difference (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _nn_aspect_ratio
       (sys::poke _nn_aspect_ratio (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _nn_kurtosis
       (sys::poke _nn_kurtosis (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32 _class_id
     (setq _class_id (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Point32 _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _nearest_neghbour_id
     (setq _nearest_neghbour_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _jump_distance_preceeding
     (setq _jump_distance_preceeding (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _jump_distance_succeeding
     (setq _jump_distance_succeeding (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _nearest_distance
     (setq _nearest_distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sum_of_distances
     (setq _sum_of_distances (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _number_of_points
     (setq _number_of_points (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _std_deviation
     (setq _std_deviation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _mean_average_deviation_from_median
     (setq _mean_average_deviation_from_median (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _linearity
     (setq _linearity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _radius
     (setq _radius (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _circularity
     (setq _circularity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _boundary_length
     (setq _boundary_length (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _boundary_regulatity
     (setq _boundary_regulatity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _mean_curvature
     (setq _mean_curvature (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _mean_angular_difference
     (setq _mean_angular_difference (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _aspect_ratio
     (setq _aspect_ratio (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _kurtosis
     (setq _kurtosis (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _nn_number_of_points
     (setq _nn_number_of_points (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _nn_std_deviation
     (setq _nn_std_deviation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _nn_mean_average_deviation_from_median
     (setq _nn_mean_average_deviation_from_median (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _nn_width
     (setq _nn_width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _nn_linearity
     (setq _nn_linearity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _nn_radius
     (setq _nn_radius (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _nn_circularity
     (setq _nn_circularity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _nn_boundary_length
     (setq _nn_boundary_length (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _nn_boundary_regulatity
     (setq _nn_boundary_regulatity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _nn_mean_curvature
     (setq _nn_mean_curvature (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _nn_mean_angular_difference
     (setq _nn_mean_angular_difference (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _nn_aspect_ratio
     (setq _nn_aspect_ratio (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _nn_kurtosis
     (setq _nn_kurtosis (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get laser_features::Segment_featured :md5sum-) "6151e5e19cab3935f12db4c2e82530b4")
(setf (get laser_features::Segment_featured :datatype-) "laser_features/Segment_featured")
(setf (get laser_features::Segment_featured :definition-)
      "geometry_msgs/Point32[] points
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



(provide :laser_features/Segment_featured "6151e5e19cab3935f12db4c2e82530b4")


