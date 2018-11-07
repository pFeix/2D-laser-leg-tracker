// Auto-generated. Do not edit!

// (in-package laser_features.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Segment_featured = require('./Segment_featured.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Featured_segments {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.segments = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('segments')) {
        this.segments = initObj.segments
      }
      else {
        this.segments = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Featured_segments
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [segments]
    // Serialize the length for message field [segments]
    bufferOffset = _serializer.uint32(obj.segments.length, buffer, bufferOffset);
    obj.segments.forEach((val) => {
      bufferOffset = Segment_featured.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Featured_segments
    let len;
    let data = new Featured_segments(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [segments]
    // Deserialize array length for message field [segments]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.segments = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.segments[i] = Segment_featured.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.segments.forEach((val) => {
      length += Segment_featured.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'laser_features/Featured_segments';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '53ca7ad138f7ae77d9c0f8765518fe7c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Featured_segments(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.segments !== undefined) {
      resolved.segments = new Array(msg.segments.length);
      for (let i = 0; i < resolved.segments.length; ++i) {
        resolved.segments[i] = Segment_featured.Resolve(msg.segments[i]);
      }
    }
    else {
      resolved.segments = []
    }

    return resolved;
    }
};

module.exports = Featured_segments;
