// Auto-generated. Do not edit!

// (in-package laser_segmentation.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class PointArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.segment = null;
    }
    else {
      if (initObj.hasOwnProperty('segment')) {
        this.segment = initObj.segment
      }
      else {
        this.segment = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PointArray
    // Serialize message field [segment]
    // Serialize the length for message field [segment]
    bufferOffset = _serializer.uint32(obj.segment.length, buffer, bufferOffset);
    obj.segment.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point32.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PointArray
    let len;
    let data = new PointArray(null);
    // Deserialize message field [segment]
    // Deserialize array length for message field [segment]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.segment = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.segment[i] = geometry_msgs.msg.Point32.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 12 * object.segment.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'laser_segmentation/PointArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8bab734a77cb06ef109b6411db4ce564';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point32[]     segment
    
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
    const resolved = new PointArray(null);
    if (msg.segment !== undefined) {
      resolved.segment = new Array(msg.segment.length);
      for (let i = 0; i < resolved.segment.length; ++i) {
        resolved.segment[i] = geometry_msgs.msg.Point32.Resolve(msg.segment[i]);
      }
    }
    else {
      resolved.segment = []
    }

    return resolved;
    }
};

module.exports = PointArray;
