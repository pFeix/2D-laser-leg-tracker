; Auto-generated. Do not edit!


(cl:in-package laser_features-msg)


;//! \htmlinclude Segment_featured.msg.html

(cl:defclass <Segment_featured> (roslisp-msg-protocol:ros-message)
  ((points
    :reader points
    :initarg :points
    :type (cl:vector geometry_msgs-msg:Point32)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point32 :initial-element (cl:make-instance 'geometry_msgs-msg:Point32)))
   (class_id
    :reader class_id
    :initarg :class_id
    :type cl:float
    :initform 0.0)
   (center
    :reader center
    :initarg :center
    :type geometry_msgs-msg:Point32
    :initform (cl:make-instance 'geometry_msgs-msg:Point32))
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (nearest_neghbour_id
    :reader nearest_neghbour_id
    :initarg :nearest_neghbour_id
    :type cl:integer
    :initform 0)
   (jump_distance_preceeding
    :reader jump_distance_preceeding
    :initarg :jump_distance_preceeding
    :type cl:float
    :initform 0.0)
   (jump_distance_succeeding
    :reader jump_distance_succeeding
    :initarg :jump_distance_succeeding
    :type cl:float
    :initform 0.0)
   (nearest_distance
    :reader nearest_distance
    :initarg :nearest_distance
    :type cl:float
    :initform 0.0)
   (sum_of_distances
    :reader sum_of_distances
    :initarg :sum_of_distances
    :type cl:float
    :initform 0.0)
   (number_of_points
    :reader number_of_points
    :initarg :number_of_points
    :type cl:float
    :initform 0.0)
   (std_deviation
    :reader std_deviation
    :initarg :std_deviation
    :type cl:float
    :initform 0.0)
   (mean_average_deviation_from_median
    :reader mean_average_deviation_from_median
    :initarg :mean_average_deviation_from_median
    :type cl:float
    :initform 0.0)
   (width
    :reader width
    :initarg :width
    :type cl:float
    :initform 0.0)
   (linearity
    :reader linearity
    :initarg :linearity
    :type cl:float
    :initform 0.0)
   (radius
    :reader radius
    :initarg :radius
    :type cl:float
    :initform 0.0)
   (circularity
    :reader circularity
    :initarg :circularity
    :type cl:float
    :initform 0.0)
   (boundary_length
    :reader boundary_length
    :initarg :boundary_length
    :type cl:float
    :initform 0.0)
   (boundary_regulatity
    :reader boundary_regulatity
    :initarg :boundary_regulatity
    :type cl:float
    :initform 0.0)
   (mean_curvature
    :reader mean_curvature
    :initarg :mean_curvature
    :type cl:float
    :initform 0.0)
   (mean_angular_difference
    :reader mean_angular_difference
    :initarg :mean_angular_difference
    :type cl:float
    :initform 0.0)
   (aspect_ratio
    :reader aspect_ratio
    :initarg :aspect_ratio
    :type cl:float
    :initform 0.0)
   (kurtosis
    :reader kurtosis
    :initarg :kurtosis
    :type cl:float
    :initform 0.0)
   (nn_number_of_points
    :reader nn_number_of_points
    :initarg :nn_number_of_points
    :type cl:float
    :initform 0.0)
   (nn_std_deviation
    :reader nn_std_deviation
    :initarg :nn_std_deviation
    :type cl:float
    :initform 0.0)
   (nn_mean_average_deviation_from_median
    :reader nn_mean_average_deviation_from_median
    :initarg :nn_mean_average_deviation_from_median
    :type cl:float
    :initform 0.0)
   (nn_width
    :reader nn_width
    :initarg :nn_width
    :type cl:float
    :initform 0.0)
   (nn_linearity
    :reader nn_linearity
    :initarg :nn_linearity
    :type cl:float
    :initform 0.0)
   (nn_radius
    :reader nn_radius
    :initarg :nn_radius
    :type cl:float
    :initform 0.0)
   (nn_circularity
    :reader nn_circularity
    :initarg :nn_circularity
    :type cl:float
    :initform 0.0)
   (nn_boundary_length
    :reader nn_boundary_length
    :initarg :nn_boundary_length
    :type cl:float
    :initform 0.0)
   (nn_boundary_regulatity
    :reader nn_boundary_regulatity
    :initarg :nn_boundary_regulatity
    :type cl:float
    :initform 0.0)
   (nn_mean_curvature
    :reader nn_mean_curvature
    :initarg :nn_mean_curvature
    :type cl:float
    :initform 0.0)
   (nn_mean_angular_difference
    :reader nn_mean_angular_difference
    :initarg :nn_mean_angular_difference
    :type cl:float
    :initform 0.0)
   (nn_aspect_ratio
    :reader nn_aspect_ratio
    :initarg :nn_aspect_ratio
    :type cl:float
    :initform 0.0)
   (nn_kurtosis
    :reader nn_kurtosis
    :initarg :nn_kurtosis
    :type cl:float
    :initform 0.0))
)

(cl:defclass Segment_featured (<Segment_featured>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Segment_featured>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Segment_featured)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_features-msg:<Segment_featured> is deprecated: use laser_features-msg:Segment_featured instead.")))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:points-val is deprecated.  Use laser_features-msg:points instead.")
  (points m))

(cl:ensure-generic-function 'class_id-val :lambda-list '(m))
(cl:defmethod class_id-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:class_id-val is deprecated.  Use laser_features-msg:class_id instead.")
  (class_id m))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:center-val is deprecated.  Use laser_features-msg:center instead.")
  (center m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:distance-val is deprecated.  Use laser_features-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'nearest_neghbour_id-val :lambda-list '(m))
(cl:defmethod nearest_neghbour_id-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:nearest_neghbour_id-val is deprecated.  Use laser_features-msg:nearest_neghbour_id instead.")
  (nearest_neghbour_id m))

(cl:ensure-generic-function 'jump_distance_preceeding-val :lambda-list '(m))
(cl:defmethod jump_distance_preceeding-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:jump_distance_preceeding-val is deprecated.  Use laser_features-msg:jump_distance_preceeding instead.")
  (jump_distance_preceeding m))

(cl:ensure-generic-function 'jump_distance_succeeding-val :lambda-list '(m))
(cl:defmethod jump_distance_succeeding-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:jump_distance_succeeding-val is deprecated.  Use laser_features-msg:jump_distance_succeeding instead.")
  (jump_distance_succeeding m))

(cl:ensure-generic-function 'nearest_distance-val :lambda-list '(m))
(cl:defmethod nearest_distance-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:nearest_distance-val is deprecated.  Use laser_features-msg:nearest_distance instead.")
  (nearest_distance m))

(cl:ensure-generic-function 'sum_of_distances-val :lambda-list '(m))
(cl:defmethod sum_of_distances-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:sum_of_distances-val is deprecated.  Use laser_features-msg:sum_of_distances instead.")
  (sum_of_distances m))

(cl:ensure-generic-function 'number_of_points-val :lambda-list '(m))
(cl:defmethod number_of_points-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:number_of_points-val is deprecated.  Use laser_features-msg:number_of_points instead.")
  (number_of_points m))

(cl:ensure-generic-function 'std_deviation-val :lambda-list '(m))
(cl:defmethod std_deviation-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:std_deviation-val is deprecated.  Use laser_features-msg:std_deviation instead.")
  (std_deviation m))

(cl:ensure-generic-function 'mean_average_deviation_from_median-val :lambda-list '(m))
(cl:defmethod mean_average_deviation_from_median-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:mean_average_deviation_from_median-val is deprecated.  Use laser_features-msg:mean_average_deviation_from_median instead.")
  (mean_average_deviation_from_median m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:width-val is deprecated.  Use laser_features-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'linearity-val :lambda-list '(m))
(cl:defmethod linearity-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:linearity-val is deprecated.  Use laser_features-msg:linearity instead.")
  (linearity m))

(cl:ensure-generic-function 'radius-val :lambda-list '(m))
(cl:defmethod radius-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:radius-val is deprecated.  Use laser_features-msg:radius instead.")
  (radius m))

(cl:ensure-generic-function 'circularity-val :lambda-list '(m))
(cl:defmethod circularity-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:circularity-val is deprecated.  Use laser_features-msg:circularity instead.")
  (circularity m))

(cl:ensure-generic-function 'boundary_length-val :lambda-list '(m))
(cl:defmethod boundary_length-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:boundary_length-val is deprecated.  Use laser_features-msg:boundary_length instead.")
  (boundary_length m))

(cl:ensure-generic-function 'boundary_regulatity-val :lambda-list '(m))
(cl:defmethod boundary_regulatity-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:boundary_regulatity-val is deprecated.  Use laser_features-msg:boundary_regulatity instead.")
  (boundary_regulatity m))

(cl:ensure-generic-function 'mean_curvature-val :lambda-list '(m))
(cl:defmethod mean_curvature-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:mean_curvature-val is deprecated.  Use laser_features-msg:mean_curvature instead.")
  (mean_curvature m))

(cl:ensure-generic-function 'mean_angular_difference-val :lambda-list '(m))
(cl:defmethod mean_angular_difference-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:mean_angular_difference-val is deprecated.  Use laser_features-msg:mean_angular_difference instead.")
  (mean_angular_difference m))

(cl:ensure-generic-function 'aspect_ratio-val :lambda-list '(m))
(cl:defmethod aspect_ratio-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:aspect_ratio-val is deprecated.  Use laser_features-msg:aspect_ratio instead.")
  (aspect_ratio m))

(cl:ensure-generic-function 'kurtosis-val :lambda-list '(m))
(cl:defmethod kurtosis-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:kurtosis-val is deprecated.  Use laser_features-msg:kurtosis instead.")
  (kurtosis m))

(cl:ensure-generic-function 'nn_number_of_points-val :lambda-list '(m))
(cl:defmethod nn_number_of_points-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:nn_number_of_points-val is deprecated.  Use laser_features-msg:nn_number_of_points instead.")
  (nn_number_of_points m))

(cl:ensure-generic-function 'nn_std_deviation-val :lambda-list '(m))
(cl:defmethod nn_std_deviation-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:nn_std_deviation-val is deprecated.  Use laser_features-msg:nn_std_deviation instead.")
  (nn_std_deviation m))

(cl:ensure-generic-function 'nn_mean_average_deviation_from_median-val :lambda-list '(m))
(cl:defmethod nn_mean_average_deviation_from_median-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:nn_mean_average_deviation_from_median-val is deprecated.  Use laser_features-msg:nn_mean_average_deviation_from_median instead.")
  (nn_mean_average_deviation_from_median m))

(cl:ensure-generic-function 'nn_width-val :lambda-list '(m))
(cl:defmethod nn_width-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:nn_width-val is deprecated.  Use laser_features-msg:nn_width instead.")
  (nn_width m))

(cl:ensure-generic-function 'nn_linearity-val :lambda-list '(m))
(cl:defmethod nn_linearity-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:nn_linearity-val is deprecated.  Use laser_features-msg:nn_linearity instead.")
  (nn_linearity m))

(cl:ensure-generic-function 'nn_radius-val :lambda-list '(m))
(cl:defmethod nn_radius-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:nn_radius-val is deprecated.  Use laser_features-msg:nn_radius instead.")
  (nn_radius m))

(cl:ensure-generic-function 'nn_circularity-val :lambda-list '(m))
(cl:defmethod nn_circularity-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:nn_circularity-val is deprecated.  Use laser_features-msg:nn_circularity instead.")
  (nn_circularity m))

(cl:ensure-generic-function 'nn_boundary_length-val :lambda-list '(m))
(cl:defmethod nn_boundary_length-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:nn_boundary_length-val is deprecated.  Use laser_features-msg:nn_boundary_length instead.")
  (nn_boundary_length m))

(cl:ensure-generic-function 'nn_boundary_regulatity-val :lambda-list '(m))
(cl:defmethod nn_boundary_regulatity-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:nn_boundary_regulatity-val is deprecated.  Use laser_features-msg:nn_boundary_regulatity instead.")
  (nn_boundary_regulatity m))

(cl:ensure-generic-function 'nn_mean_curvature-val :lambda-list '(m))
(cl:defmethod nn_mean_curvature-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:nn_mean_curvature-val is deprecated.  Use laser_features-msg:nn_mean_curvature instead.")
  (nn_mean_curvature m))

(cl:ensure-generic-function 'nn_mean_angular_difference-val :lambda-list '(m))
(cl:defmethod nn_mean_angular_difference-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:nn_mean_angular_difference-val is deprecated.  Use laser_features-msg:nn_mean_angular_difference instead.")
  (nn_mean_angular_difference m))

(cl:ensure-generic-function 'nn_aspect_ratio-val :lambda-list '(m))
(cl:defmethod nn_aspect_ratio-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:nn_aspect_ratio-val is deprecated.  Use laser_features-msg:nn_aspect_ratio instead.")
  (nn_aspect_ratio m))

(cl:ensure-generic-function 'nn_kurtosis-val :lambda-list '(m))
(cl:defmethod nn_kurtosis-val ((m <Segment_featured>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_features-msg:nn_kurtosis-val is deprecated.  Use laser_features-msg:nn_kurtosis instead.")
  (nn_kurtosis m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Segment_featured>) ostream)
  "Serializes a message object of type '<Segment_featured>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'class_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'center) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'nearest_neghbour_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'jump_distance_preceeding))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'jump_distance_succeeding))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'nearest_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sum_of_distances))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'number_of_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'std_deviation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mean_average_deviation_from_median))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'linearity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'radius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'circularity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'boundary_length))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'boundary_regulatity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mean_curvature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mean_angular_difference))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'aspect_ratio))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'kurtosis))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'nn_number_of_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'nn_std_deviation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'nn_mean_average_deviation_from_median))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'nn_width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'nn_linearity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'nn_radius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'nn_circularity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'nn_boundary_length))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'nn_boundary_regulatity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'nn_mean_curvature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'nn_mean_angular_difference))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'nn_aspect_ratio))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'nn_kurtosis))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Segment_featured>) istream)
  "Deserializes a message object of type '<Segment_featured>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point32))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'class_id) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'center) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nearest_neghbour_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'jump_distance_preceeding) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'jump_distance_succeeding) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nearest_distance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sum_of_distances) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'number_of_points) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'std_deviation) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mean_average_deviation_from_median) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'width) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linearity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'radius) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'circularity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'boundary_length) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'boundary_regulatity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mean_curvature) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mean_angular_difference) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'aspect_ratio) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'kurtosis) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nn_number_of_points) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nn_std_deviation) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nn_mean_average_deviation_from_median) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nn_width) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nn_linearity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nn_radius) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nn_circularity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nn_boundary_length) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nn_boundary_regulatity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nn_mean_curvature) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nn_mean_angular_difference) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nn_aspect_ratio) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'nn_kurtosis) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Segment_featured>)))
  "Returns string type for a message object of type '<Segment_featured>"
  "laser_features/Segment_featured")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Segment_featured)))
  "Returns string type for a message object of type 'Segment_featured"
  "laser_features/Segment_featured")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Segment_featured>)))
  "Returns md5sum for a message object of type '<Segment_featured>"
  "6151e5e19cab3935f12db4c2e82530b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Segment_featured)))
  "Returns md5sum for a message object of type 'Segment_featured"
  "6151e5e19cab3935f12db4c2e82530b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Segment_featured>)))
  "Returns full string definition for message of type '<Segment_featured>"
  (cl:format cl:nil "geometry_msgs/Point32[] points~%float32 class_id~%geometry_msgs/Point32 center~%float32 distance~%int32 nearest_neghbour_id~%~%float32 jump_distance_preceeding~%float32 jump_distance_succeeding~%float32 nearest_distance~%float32 sum_of_distances~%~%float32 number_of_points~%float32 std_deviation~%float32 mean_average_deviation_from_median~%float32 width~%float32 linearity~%float32 radius~%float32 circularity~%float32 boundary_length~%float32 boundary_regulatity~%float32 mean_curvature~%float32 mean_angular_difference~%float32 aspect_ratio~%float32 kurtosis~%~%#float32 div_distance_number_of_points~%#float32 div_distance_std_deviation~%#float32 div_distance_mean_average_deviation_from_median~%#float32 div_distance_width~%#float32 div_distance_linearity~%#float32 div_distance_radius~%#float32 div_distance_circularity~%#float32 div_distance_boundary_length~%#float32 div_distance_boundary_regulatity~%#float32 div_distance_mean_curvature~%#float32 div_distance_mean_angular_difference~%#float32 div_distance_aspect_ratio~%#float32 div_distance_kurtosis~%~%#float32 mlp_distance_number_of_points~%#float32 mlp_distance_std_deviation~%#float32 mlp_distance_mean_average_deviation_from_median~%#float32 mlp_distance_width~%#float32 mlp_distance_linearity~%#float32 mlp_distance_radius~%#float32 mlp_distance_circularity~%#float32 mlp_distance_boundary_length~%#float32 mlp_distance_boundary_regulatity~%#float32 mlp_distance_mean_curvature~%#float32 mlp_distance_mean_angular_difference~%#float32 mlp_distance_aspect_ratio~%#float32 mlp_distance_kurtosis~%~%#float32 div_number_std_deviation~%#float32 div_number_mean_average_deviation_from_median~%#float32 div_number_width~%#float32 div_number_linearity~%#float32 div_number_radius~%#float32 div_number_circularity~%#float32 div_number_boundary_length~%#float32 div_number_boundary_regulatity~%#float32 div_number_mean_curvature~%#float32 div_number_mean_angular_difference~%#float32 div_number_aspect_ratio~%#float32 div_number_kurtosis~%~%#float32 mlp_number_std_deviation~%#float32 mlp_number_mean_average_deviation_from_median~%#float32 mlp_number_width~%#float32 mlp_number_linearity~%#float32 mlp_number_radius~%#float32 mlp_number_circularity~%#float32 mlp_number_boundary_length~%#float32 mlp_number_boundary_regulatity~%#float32 mlp_number_mean_curvature~%#float32 mlp_number_mean_angular_difference~%#float32 mlp_number_aspect_ratio~%#float32 mlp_number_kurtosis~%~%~%float32 nn_number_of_points~%float32 nn_std_deviation~%float32 nn_mean_average_deviation_from_median~%float32 nn_width~%float32 nn_linearity~%float32 nn_radius~%float32 nn_circularity~%float32 nn_boundary_length~%float32 nn_boundary_regulatity~%float32 nn_mean_curvature~%float32 nn_mean_angular_difference~%float32 nn_aspect_ratio~%float32 nn_kurtosis~%~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Segment_featured)))
  "Returns full string definition for message of type 'Segment_featured"
  (cl:format cl:nil "geometry_msgs/Point32[] points~%float32 class_id~%geometry_msgs/Point32 center~%float32 distance~%int32 nearest_neghbour_id~%~%float32 jump_distance_preceeding~%float32 jump_distance_succeeding~%float32 nearest_distance~%float32 sum_of_distances~%~%float32 number_of_points~%float32 std_deviation~%float32 mean_average_deviation_from_median~%float32 width~%float32 linearity~%float32 radius~%float32 circularity~%float32 boundary_length~%float32 boundary_regulatity~%float32 mean_curvature~%float32 mean_angular_difference~%float32 aspect_ratio~%float32 kurtosis~%~%#float32 div_distance_number_of_points~%#float32 div_distance_std_deviation~%#float32 div_distance_mean_average_deviation_from_median~%#float32 div_distance_width~%#float32 div_distance_linearity~%#float32 div_distance_radius~%#float32 div_distance_circularity~%#float32 div_distance_boundary_length~%#float32 div_distance_boundary_regulatity~%#float32 div_distance_mean_curvature~%#float32 div_distance_mean_angular_difference~%#float32 div_distance_aspect_ratio~%#float32 div_distance_kurtosis~%~%#float32 mlp_distance_number_of_points~%#float32 mlp_distance_std_deviation~%#float32 mlp_distance_mean_average_deviation_from_median~%#float32 mlp_distance_width~%#float32 mlp_distance_linearity~%#float32 mlp_distance_radius~%#float32 mlp_distance_circularity~%#float32 mlp_distance_boundary_length~%#float32 mlp_distance_boundary_regulatity~%#float32 mlp_distance_mean_curvature~%#float32 mlp_distance_mean_angular_difference~%#float32 mlp_distance_aspect_ratio~%#float32 mlp_distance_kurtosis~%~%#float32 div_number_std_deviation~%#float32 div_number_mean_average_deviation_from_median~%#float32 div_number_width~%#float32 div_number_linearity~%#float32 div_number_radius~%#float32 div_number_circularity~%#float32 div_number_boundary_length~%#float32 div_number_boundary_regulatity~%#float32 div_number_mean_curvature~%#float32 div_number_mean_angular_difference~%#float32 div_number_aspect_ratio~%#float32 div_number_kurtosis~%~%#float32 mlp_number_std_deviation~%#float32 mlp_number_mean_average_deviation_from_median~%#float32 mlp_number_width~%#float32 mlp_number_linearity~%#float32 mlp_number_radius~%#float32 mlp_number_circularity~%#float32 mlp_number_boundary_length~%#float32 mlp_number_boundary_regulatity~%#float32 mlp_number_mean_curvature~%#float32 mlp_number_mean_angular_difference~%#float32 mlp_number_aspect_ratio~%#float32 mlp_number_kurtosis~%~%~%float32 nn_number_of_points~%float32 nn_std_deviation~%float32 nn_mean_average_deviation_from_median~%float32 nn_width~%float32 nn_linearity~%float32 nn_radius~%float32 nn_circularity~%float32 nn_boundary_length~%float32 nn_boundary_regulatity~%float32 nn_mean_curvature~%float32 nn_mean_angular_difference~%float32 nn_aspect_ratio~%float32 nn_kurtosis~%~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Segment_featured>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'center))
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Segment_featured>))
  "Converts a ROS message object to a list"
  (cl:list 'Segment_featured
    (cl:cons ':points (points msg))
    (cl:cons ':class_id (class_id msg))
    (cl:cons ':center (center msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':nearest_neghbour_id (nearest_neghbour_id msg))
    (cl:cons ':jump_distance_preceeding (jump_distance_preceeding msg))
    (cl:cons ':jump_distance_succeeding (jump_distance_succeeding msg))
    (cl:cons ':nearest_distance (nearest_distance msg))
    (cl:cons ':sum_of_distances (sum_of_distances msg))
    (cl:cons ':number_of_points (number_of_points msg))
    (cl:cons ':std_deviation (std_deviation msg))
    (cl:cons ':mean_average_deviation_from_median (mean_average_deviation_from_median msg))
    (cl:cons ':width (width msg))
    (cl:cons ':linearity (linearity msg))
    (cl:cons ':radius (radius msg))
    (cl:cons ':circularity (circularity msg))
    (cl:cons ':boundary_length (boundary_length msg))
    (cl:cons ':boundary_regulatity (boundary_regulatity msg))
    (cl:cons ':mean_curvature (mean_curvature msg))
    (cl:cons ':mean_angular_difference (mean_angular_difference msg))
    (cl:cons ':aspect_ratio (aspect_ratio msg))
    (cl:cons ':kurtosis (kurtosis msg))
    (cl:cons ':nn_number_of_points (nn_number_of_points msg))
    (cl:cons ':nn_std_deviation (nn_std_deviation msg))
    (cl:cons ':nn_mean_average_deviation_from_median (nn_mean_average_deviation_from_median msg))
    (cl:cons ':nn_width (nn_width msg))
    (cl:cons ':nn_linearity (nn_linearity msg))
    (cl:cons ':nn_radius (nn_radius msg))
    (cl:cons ':nn_circularity (nn_circularity msg))
    (cl:cons ':nn_boundary_length (nn_boundary_length msg))
    (cl:cons ':nn_boundary_regulatity (nn_boundary_regulatity msg))
    (cl:cons ':nn_mean_curvature (nn_mean_curvature msg))
    (cl:cons ':nn_mean_angular_difference (nn_mean_angular_difference msg))
    (cl:cons ':nn_aspect_ratio (nn_aspect_ratio msg))
    (cl:cons ':nn_kurtosis (nn_kurtosis msg))
))
