# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "laser_segmentation: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ilaser_segmentation:/home/pfeix/robot_host_ws/src/laser_segmentation/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(laser_segmentation_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/PointCloudSegmented.msg" NAME_WE)
add_custom_target(_laser_segmentation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser_segmentation" "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/PointCloudSegmented.msg" "geometry_msgs/Point32:std_msgs/Header:laser_segmentation/Segment"
)

get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg" NAME_WE)
add_custom_target(_laser_segmentation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser_segmentation" "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg" "geometry_msgs/Point32"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(laser_segmentation
  "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/PointCloudSegmented.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_segmentation
)
_generate_msg_cpp(laser_segmentation
  "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_segmentation
)

### Generating Services

### Generating Module File
_generate_module_cpp(laser_segmentation
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_segmentation
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(laser_segmentation_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(laser_segmentation_generate_messages laser_segmentation_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/PointCloudSegmented.msg" NAME_WE)
add_dependencies(laser_segmentation_generate_messages_cpp _laser_segmentation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg" NAME_WE)
add_dependencies(laser_segmentation_generate_messages_cpp _laser_segmentation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_segmentation_gencpp)
add_dependencies(laser_segmentation_gencpp laser_segmentation_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_segmentation_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(laser_segmentation
  "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/PointCloudSegmented.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_segmentation
)
_generate_msg_eus(laser_segmentation
  "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_segmentation
)

### Generating Services

### Generating Module File
_generate_module_eus(laser_segmentation
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_segmentation
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(laser_segmentation_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(laser_segmentation_generate_messages laser_segmentation_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/PointCloudSegmented.msg" NAME_WE)
add_dependencies(laser_segmentation_generate_messages_eus _laser_segmentation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg" NAME_WE)
add_dependencies(laser_segmentation_generate_messages_eus _laser_segmentation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_segmentation_geneus)
add_dependencies(laser_segmentation_geneus laser_segmentation_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_segmentation_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(laser_segmentation
  "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/PointCloudSegmented.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_segmentation
)
_generate_msg_lisp(laser_segmentation
  "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_segmentation
)

### Generating Services

### Generating Module File
_generate_module_lisp(laser_segmentation
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_segmentation
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(laser_segmentation_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(laser_segmentation_generate_messages laser_segmentation_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/PointCloudSegmented.msg" NAME_WE)
add_dependencies(laser_segmentation_generate_messages_lisp _laser_segmentation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg" NAME_WE)
add_dependencies(laser_segmentation_generate_messages_lisp _laser_segmentation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_segmentation_genlisp)
add_dependencies(laser_segmentation_genlisp laser_segmentation_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_segmentation_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(laser_segmentation
  "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/PointCloudSegmented.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_segmentation
)
_generate_msg_nodejs(laser_segmentation
  "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_segmentation
)

### Generating Services

### Generating Module File
_generate_module_nodejs(laser_segmentation
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_segmentation
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(laser_segmentation_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(laser_segmentation_generate_messages laser_segmentation_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/PointCloudSegmented.msg" NAME_WE)
add_dependencies(laser_segmentation_generate_messages_nodejs _laser_segmentation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg" NAME_WE)
add_dependencies(laser_segmentation_generate_messages_nodejs _laser_segmentation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_segmentation_gennodejs)
add_dependencies(laser_segmentation_gennodejs laser_segmentation_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_segmentation_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(laser_segmentation
  "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/PointCloudSegmented.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_segmentation
)
_generate_msg_py(laser_segmentation
  "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_segmentation
)

### Generating Services

### Generating Module File
_generate_module_py(laser_segmentation
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_segmentation
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(laser_segmentation_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(laser_segmentation_generate_messages laser_segmentation_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/PointCloudSegmented.msg" NAME_WE)
add_dependencies(laser_segmentation_generate_messages_py _laser_segmentation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_segmentation/msg/Segment.msg" NAME_WE)
add_dependencies(laser_segmentation_generate_messages_py _laser_segmentation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_segmentation_genpy)
add_dependencies(laser_segmentation_genpy laser_segmentation_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_segmentation_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_segmentation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_segmentation
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(laser_segmentation_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(laser_segmentation_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_segmentation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_segmentation
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(laser_segmentation_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(laser_segmentation_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_segmentation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_segmentation
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(laser_segmentation_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(laser_segmentation_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_segmentation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_segmentation
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(laser_segmentation_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(laser_segmentation_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_segmentation)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_segmentation\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_segmentation
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(laser_segmentation_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(laser_segmentation_generate_messages_py geometry_msgs_generate_messages_py)
endif()
