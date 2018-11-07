// Auto-generated. Do not edit!

// (in-package laser_features.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Segment_featured {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.points = null;
      this.class_id = null;
      this.center = null;
      this.distance = null;
      this.nearest_neghbour_id = null;
      this.jump_distance_preceeding = null;
      this.jump_distance_succeeding = null;
      this.nearest_distance = null;
      this.sum_of_distances = null;
      this.number_of_points = null;
      this.std_deviation = null;
      this.mean_average_deviation_from_median = null;
      this.width = null;
      this.linearity = null;
      this.radius = null;
      this.circularity = null;
      this.boundary_length = null;
      this.boundary_regulatity = null;
      this.mean_curvature = null;
      this.mean_angular_difference = null;
      this.aspect_ratio = null;
      this.kurtosis = null;
      this.nn_number_of_points = null;
      this.nn_std_deviation = null;
      this.nn_mean_average_deviation_from_median = null;
      this.nn_width = null;
      this.nn_linearity = null;
      this.nn_radius = null;
      this.nn_circularity = null;
      this.nn_boundary_length = null;
      this.nn_boundary_regulatity = null;
      this.nn_mean_curvature = null;
      this.nn_mean_angular_difference = null;
      this.nn_aspect_ratio = null;
      this.nn_kurtosis = null;
    }
    else {
      if (initObj.hasOwnProperty('points')) {
        this.points = initObj.points
      }
      else {
        this.points = [];
      }
      if (initObj.hasOwnProperty('class_id')) {
        this.class_id = initObj.class_id
      }
      else {
        this.class_id = 0.0;
      }
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = new geometry_msgs.msg.Point32();
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
      if (initObj.hasOwnProperty('nearest_neghbour_id')) {
        this.nearest_neghbour_id = initObj.nearest_neghbour_id
      }
      else {
        this.nearest_neghbour_id = 0;
      }
      if (initObj.hasOwnProperty('jump_distance_preceeding')) {
        this.jump_distance_preceeding = initObj.jump_distance_preceeding
      }
      else {
        this.jump_distance_preceeding = 0.0;
      }
      if (initObj.hasOwnProperty('jump_distance_succeeding')) {
        this.jump_distance_succeeding = initObj.jump_distance_succeeding
      }
      else {
        this.jump_distance_succeeding = 0.0;
      }
      if (initObj.hasOwnProperty('nearest_distance')) {
        this.nearest_distance = initObj.nearest_distance
      }
      else {
        this.nearest_distance = 0.0;
      }
      if (initObj.hasOwnProperty('sum_of_distances')) {
        this.sum_of_distances = initObj.sum_of_distances
      }
      else {
        this.sum_of_distances = 0.0;
      }
      if (initObj.hasOwnProperty('number_of_points')) {
        this.number_of_points = initObj.number_of_points
      }
      else {
        this.number_of_points = 0.0;
      }
      if (initObj.hasOwnProperty('std_deviation')) {
        this.std_deviation = initObj.std_deviation
      }
      else {
        this.std_deviation = 0.0;
      }
      if (initObj.hasOwnProperty('mean_average_deviation_from_median')) {
        this.mean_average_deviation_from_median = initObj.mean_average_deviation_from_median
      }
      else {
        this.mean_average_deviation_from_median = 0.0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('linearity')) {
        this.linearity = initObj.linearity
      }
      else {
        this.linearity = 0.0;
      }
      if (initObj.hasOwnProperty('radius')) {
        this.radius = initObj.radius
      }
      else {
        this.radius = 0.0;
      }
      if (initObj.hasOwnProperty('circularity')) {
        this.circularity = initObj.circularity
      }
      else {
        this.circularity = 0.0;
      }
      if (initObj.hasOwnProperty('boundary_length')) {
        this.boundary_length = initObj.boundary_length
      }
      else {
        this.boundary_length = 0.0;
      }
      if (initObj.hasOwnProperty('boundary_regulatity')) {
        this.boundary_regulatity = initObj.boundary_regulatity
      }
      else {
        this.boundary_regulatity = 0.0;
      }
      if (initObj.hasOwnProperty('mean_curvature')) {
        this.mean_curvature = initObj.mean_curvature
      }
      else {
        this.mean_curvature = 0.0;
      }
      if (initObj.hasOwnProperty('mean_angular_difference')) {
        this.mean_angular_difference = initObj.mean_angular_difference
      }
      else {
        this.mean_angular_difference = 0.0;
      }
      if (initObj.hasOwnProperty('aspect_ratio')) {
        this.aspect_ratio = initObj.aspect_ratio
      }
      else {
        this.aspect_ratio = 0.0;
      }
      if (initObj.hasOwnProperty('kurtosis')) {
        this.kurtosis = initObj.kurtosis
      }
      else {
        this.kurtosis = 0.0;
      }
      if (initObj.hasOwnProperty('nn_number_of_points')) {
        this.nn_number_of_points = initObj.nn_number_of_points
      }
      else {
        this.nn_number_of_points = 0.0;
      }
      if (initObj.hasOwnProperty('nn_std_deviation')) {
        this.nn_std_deviation = initObj.nn_std_deviation
      }
      else {
        this.nn_std_deviation = 0.0;
      }
      if (initObj.hasOwnProperty('nn_mean_average_deviation_from_median')) {
        this.nn_mean_average_deviation_from_median = initObj.nn_mean_average_deviation_from_median
      }
      else {
        this.nn_mean_average_deviation_from_median = 0.0;
      }
      if (initObj.hasOwnProperty('nn_width')) {
        this.nn_width = initObj.nn_width
      }
      else {
        this.nn_width = 0.0;
      }
      if (initObj.hasOwnProperty('nn_linearity')) {
        this.nn_linearity = initObj.nn_linearity
      }
      else {
        this.nn_linearity = 0.0;
      }
      if (initObj.hasOwnProperty('nn_radius')) {
        this.nn_radius = initObj.nn_radius
      }
      else {
        this.nn_radius = 0.0;
      }
      if (initObj.hasOwnProperty('nn_circularity')) {
        this.nn_circularity = initObj.nn_circularity
      }
      else {
        this.nn_circularity = 0.0;
      }
      if (initObj.hasOwnProperty('nn_boundary_length')) {
        this.nn_boundary_length = initObj.nn_boundary_length
      }
      else {
        this.nn_boundary_length = 0.0;
      }
      if (initObj.hasOwnProperty('nn_boundary_regulatity')) {
        this.nn_boundary_regulatity = initObj.nn_boundary_regulatity
      }
      else {
        this.nn_boundary_regulatity = 0.0;
      }
      if (initObj.hasOwnProperty('nn_mean_curvature')) {
        this.nn_mean_curvature = initObj.nn_mean_curvature
      }
      else {
        this.nn_mean_curvature = 0.0;
      }
      if (initObj.hasOwnProperty('nn_mean_angular_difference')) {
        this.nn_mean_angular_difference = initObj.nn_mean_angular_difference
      }
      else {
        this.nn_mean_angular_difference = 0.0;
      }
      if (initObj.hasOwnProperty('nn_aspect_ratio')) {
        this.nn_aspect_ratio = initObj.nn_aspect_ratio
      }
      else {
        this.nn_aspect_ratio = 0.0;
      }
      if (initObj.hasOwnProperty('nn_kurtosis')) {
        this.nn_kurtosis = initObj.nn_kurtosis
      }
      else {
        this.nn_kurtosis = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Segment_featured
    // Serialize message field [points]
    // Serialize the length for message field [points]
    bufferOffset = _serializer.uint32(obj.points.length, buffer, bufferOffset);
    obj.points.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point32.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [class_id]
    bufferOffset = _serializer.float32(obj.class_id, buffer, bufferOffset);
    // Serialize message field [center]
    bufferOffset = geometry_msgs.msg.Point32.serialize(obj.center, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = _serializer.float32(obj.distance, buffer, bufferOffset);
    // Serialize message field [nearest_neghbour_id]
    bufferOffset = _serializer.int32(obj.nearest_neghbour_id, buffer, bufferOffset);
    // Serialize message field [jump_distance_preceeding]
    bufferOffset = _serializer.float32(obj.jump_distance_preceeding, buffer, bufferOffset);
    // Serialize message field [jump_distance_succeeding]
    bufferOffset = _serializer.float32(obj.jump_distance_succeeding, buffer, bufferOffset);
    // Serialize message field [nearest_distance]
    bufferOffset = _serializer.float32(obj.nearest_distance, buffer, bufferOffset);
    // Serialize message field [sum_of_distances]
    bufferOffset = _serializer.float32(obj.sum_of_distances, buffer, bufferOffset);
    // Serialize message field [number_of_points]
    bufferOffset = _serializer.float32(obj.number_of_points, buffer, bufferOffset);
    // Serialize message field [std_deviation]
    bufferOffset = _serializer.float32(obj.std_deviation, buffer, bufferOffset);
    // Serialize message field [mean_average_deviation_from_median]
    bufferOffset = _serializer.float32(obj.mean_average_deviation_from_median, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float32(obj.width, buffer, bufferOffset);
    // Serialize message field [linearity]
    bufferOffset = _serializer.float32(obj.linearity, buffer, bufferOffset);
    // Serialize message field [radius]
    bufferOffset = _serializer.float32(obj.radius, buffer, bufferOffset);
    // Serialize message field [circularity]
    bufferOffset = _serializer.float32(obj.circularity, buffer, bufferOffset);
    // Serialize message field [boundary_length]
    bufferOffset = _serializer.float32(obj.boundary_length, buffer, bufferOffset);
    // Serialize message field [boundary_regulatity]
    bufferOffset = _serializer.float32(obj.boundary_regulatity, buffer, bufferOffset);
    // Serialize message field [mean_curvature]
    bufferOffset = _serializer.float32(obj.mean_curvature, buffer, bufferOffset);
    // Serialize message field [mean_angular_difference]
    bufferOffset = _serializer.float32(obj.mean_angular_difference, buffer, bufferOffset);
    // Serialize message field [aspect_ratio]
    bufferOffset = _serializer.float32(obj.aspect_ratio, buffer, bufferOffset);
    // Serialize message field [kurtosis]
    bufferOffset = _serializer.float32(obj.kurtosis, buffer, bufferOffset);
    // Serialize message field [nn_number_of_points]
    bufferOffset = _serializer.float32(obj.nn_number_of_points, buffer, bufferOffset);
    // Serialize message field [nn_std_deviation]
    bufferOffset = _serializer.float32(obj.nn_std_deviation, buffer, bufferOffset);
    // Serialize message field [nn_mean_average_deviation_from_median]
    bufferOffset = _serializer.float32(obj.nn_mean_average_deviation_from_median, buffer, bufferOffset);
    // Serialize message field [nn_width]
    bufferOffset = _serializer.float32(obj.nn_width, buffer, bufferOffset);
    // Serialize message field [nn_linearity]
    bufferOffset = _serializer.float32(obj.nn_linearity, buffer, bufferOffset);
    // Serialize message field [nn_radius]
    bufferOffset = _serializer.float32(obj.nn_radius, buffer, bufferOffset);
    // Serialize message field [nn_circularity]
    bufferOffset = _serializer.float32(obj.nn_circularity, buffer, bufferOffset);
    // Serialize message field [nn_boundary_length]
    bufferOffset = _serializer.float32(obj.nn_boundary_length, buffer, bufferOffset);
    // Serialize message field [nn_boundary_regulatity]
    bufferOffset = _serializer.float32(obj.nn_boundary_regulatity, buffer, bufferOffset);
    // Serialize message field [nn_mean_curvature]
    bufferOffset = _serializer.float32(obj.nn_mean_curvature, buffer, bufferOffset);
    // Serialize message field [nn_mean_angular_difference]
    bufferOffset = _serializer.float32(obj.nn_mean_angular_difference, buffer, bufferOffset);
    // Serialize message field [nn_aspect_ratio]
    bufferOffset = _serializer.float32(obj.nn_aspect_ratio, buffer, bufferOffset);
    // Serialize message field [nn_kurtosis]
    bufferOffset = _serializer.float32(obj.nn_kurtosis, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Segment_featured
    let len;
    let data = new Segment_featured(null);
    // Deserialize message field [points]
    // Deserialize array length for message field [points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.points[i] = geometry_msgs.msg.Point32.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [class_id]
    data.class_id = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [center]
    data.center = geometry_msgs.msg.Point32.deserialize(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nearest_neghbour_id]
    data.nearest_neghbour_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [jump_distance_preceeding]
    data.jump_distance_preceeding = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [jump_distance_succeeding]
    data.jump_distance_succeeding = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nearest_distance]
    data.nearest_distance = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sum_of_distances]
    data.sum_of_distances = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [number_of_points]
    data.number_of_points = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [std_deviation]
    data.std_deviation = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mean_average_deviation_from_median]
    data.mean_average_deviation_from_median = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [linearity]
    data.linearity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [radius]
    data.radius = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [circularity]
    data.circularity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [boundary_length]
    data.boundary_length = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [boundary_regulatity]
    data.boundary_regulatity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mean_curvature]
    data.mean_curvature = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mean_angular_difference]
    data.mean_angular_difference = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [aspect_ratio]
    data.aspect_ratio = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [kurtosis]
    data.kurtosis = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nn_number_of_points]
    data.nn_number_of_points = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nn_std_deviation]
    data.nn_std_deviation = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nn_mean_average_deviation_from_median]
    data.nn_mean_average_deviation_from_median = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nn_width]
    data.nn_width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nn_linearity]
    data.nn_linearity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nn_radius]
    data.nn_radius = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nn_circularity]
    data.nn_circularity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nn_boundary_length]
    data.nn_boundary_length = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nn_boundary_regulatity]
    data.nn_boundary_regulatity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nn_mean_curvature]
    data.nn_mean_curvature = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nn_mean_angular_difference]
    data.nn_mean_angular_difference = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nn_aspect_ratio]
    data.nn_aspect_ratio = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [nn_kurtosis]
    data.nn_kurtosis = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 12 * object.points.length;
    return length + 148;
  }

  static datatype() {
    // Returns string type for a message object
    return 'laser_features/Segment_featured';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6151e5e19cab3935f12db4c2e82530b4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Segment_featured(null);
    if (msg.points !== undefined) {
      resolved.points = new Array(msg.points.length);
      for (let i = 0; i < resolved.points.length; ++i) {
        resolved.points[i] = geometry_msgs.msg.Point32.Resolve(msg.points[i]);
      }
    }
    else {
      resolved.points = []
    }

    if (msg.class_id !== undefined) {
      resolved.class_id = msg.class_id;
    }
    else {
      resolved.class_id = 0.0
    }

    if (msg.center !== undefined) {
      resolved.center = geometry_msgs.msg.Point32.Resolve(msg.center)
    }
    else {
      resolved.center = new geometry_msgs.msg.Point32()
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    if (msg.nearest_neghbour_id !== undefined) {
      resolved.nearest_neghbour_id = msg.nearest_neghbour_id;
    }
    else {
      resolved.nearest_neghbour_id = 0
    }

    if (msg.jump_distance_preceeding !== undefined) {
      resolved.jump_distance_preceeding = msg.jump_distance_preceeding;
    }
    else {
      resolved.jump_distance_preceeding = 0.0
    }

    if (msg.jump_distance_succeeding !== undefined) {
      resolved.jump_distance_succeeding = msg.jump_distance_succeeding;
    }
    else {
      resolved.jump_distance_succeeding = 0.0
    }

    if (msg.nearest_distance !== undefined) {
      resolved.nearest_distance = msg.nearest_distance;
    }
    else {
      resolved.nearest_distance = 0.0
    }

    if (msg.sum_of_distances !== undefined) {
      resolved.sum_of_distances = msg.sum_of_distances;
    }
    else {
      resolved.sum_of_distances = 0.0
    }

    if (msg.number_of_points !== undefined) {
      resolved.number_of_points = msg.number_of_points;
    }
    else {
      resolved.number_of_points = 0.0
    }

    if (msg.std_deviation !== undefined) {
      resolved.std_deviation = msg.std_deviation;
    }
    else {
      resolved.std_deviation = 0.0
    }

    if (msg.mean_average_deviation_from_median !== undefined) {
      resolved.mean_average_deviation_from_median = msg.mean_average_deviation_from_median;
    }
    else {
      resolved.mean_average_deviation_from_median = 0.0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.linearity !== undefined) {
      resolved.linearity = msg.linearity;
    }
    else {
      resolved.linearity = 0.0
    }

    if (msg.radius !== undefined) {
      resolved.radius = msg.radius;
    }
    else {
      resolved.radius = 0.0
    }

    if (msg.circularity !== undefined) {
      resolved.circularity = msg.circularity;
    }
    else {
      resolved.circularity = 0.0
    }

    if (msg.boundary_length !== undefined) {
      resolved.boundary_length = msg.boundary_length;
    }
    else {
      resolved.boundary_length = 0.0
    }

    if (msg.boundary_regulatity !== undefined) {
      resolved.boundary_regulatity = msg.boundary_regulatity;
    }
    else {
      resolved.boundary_regulatity = 0.0
    }

    if (msg.mean_curvature !== undefined) {
      resolved.mean_curvature = msg.mean_curvature;
    }
    else {
      resolved.mean_curvature = 0.0
    }

    if (msg.mean_angular_difference !== undefined) {
      resolved.mean_angular_difference = msg.mean_angular_difference;
    }
    else {
      resolved.mean_angular_difference = 0.0
    }

    if (msg.aspect_ratio !== undefined) {
      resolved.aspect_ratio = msg.aspect_ratio;
    }
    else {
      resolved.aspect_ratio = 0.0
    }

    if (msg.kurtosis !== undefined) {
      resolved.kurtosis = msg.kurtosis;
    }
    else {
      resolved.kurtosis = 0.0
    }

    if (msg.nn_number_of_points !== undefined) {
      resolved.nn_number_of_points = msg.nn_number_of_points;
    }
    else {
      resolved.nn_number_of_points = 0.0
    }

    if (msg.nn_std_deviation !== undefined) {
      resolved.nn_std_deviation = msg.nn_std_deviation;
    }
    else {
      resolved.nn_std_deviation = 0.0
    }

    if (msg.nn_mean_average_deviation_from_median !== undefined) {
      resolved.nn_mean_average_deviation_from_median = msg.nn_mean_average_deviation_from_median;
    }
    else {
      resolved.nn_mean_average_deviation_from_median = 0.0
    }

    if (msg.nn_width !== undefined) {
      resolved.nn_width = msg.nn_width;
    }
    else {
      resolved.nn_width = 0.0
    }

    if (msg.nn_linearity !== undefined) {
      resolved.nn_linearity = msg.nn_linearity;
    }
    else {
      resolved.nn_linearity = 0.0
    }

    if (msg.nn_radius !== undefined) {
      resolved.nn_radius = msg.nn_radius;
    }
    else {
      resolved.nn_radius = 0.0
    }

    if (msg.nn_circularity !== undefined) {
      resolved.nn_circularity = msg.nn_circularity;
    }
    else {
      resolved.nn_circularity = 0.0
    }

    if (msg.nn_boundary_length !== undefined) {
      resolved.nn_boundary_length = msg.nn_boundary_length;
    }
    else {
      resolved.nn_boundary_length = 0.0
    }

    if (msg.nn_boundary_regulatity !== undefined) {
      resolved.nn_boundary_regulatity = msg.nn_boundary_regulatity;
    }
    else {
      resolved.nn_boundary_regulatity = 0.0
    }

    if (msg.nn_mean_curvature !== undefined) {
      resolved.nn_mean_curvature = msg.nn_mean_curvature;
    }
    else {
      resolved.nn_mean_curvature = 0.0
    }

    if (msg.nn_mean_angular_difference !== undefined) {
      resolved.nn_mean_angular_difference = msg.nn_mean_angular_difference;
    }
    else {
      resolved.nn_mean_angular_difference = 0.0
    }

    if (msg.nn_aspect_ratio !== undefined) {
      resolved.nn_aspect_ratio = msg.nn_aspect_ratio;
    }
    else {
      resolved.nn_aspect_ratio = 0.0
    }

    if (msg.nn_kurtosis !== undefined) {
      resolved.nn_kurtosis = msg.nn_kurtosis;
    }
    else {
      resolved.nn_kurtosis = 0.0
    }

    return resolved;
    }
};

module.exports = Segment_featured;
