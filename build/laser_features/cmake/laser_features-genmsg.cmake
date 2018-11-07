# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "laser_features: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ilaser_features:/home/pfeix/robot_host_ws/src/laser_features/msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(laser_features_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_features/msg/Featured_segments.msg" NAME_WE)
add_custom_target(_laser_features_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser_features" "/home/pfeix/robot_host_ws/src/laser_features/msg/Featured_segments.msg" "geometry_msgs/Point32:laser_features/Segment_featured:std_msgs/Header"
)

get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg" NAME_WE)
add_custom_target(_laser_features_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser_features" "/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg" "geometry_msgs/Point32"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(laser_features
  "/home/pfeix/robot_host_ws/src/laser_features/msg/Featured_segments.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_features
)
_generate_msg_cpp(laser_features
  "/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_features
)

### Generating Services

### Generating Module File
_generate_module_cpp(laser_features
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_features
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(laser_features_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(laser_features_generate_messages laser_features_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_features/msg/Featured_segments.msg" NAME_WE)
add_dependencies(laser_features_generate_messages_cpp _laser_features_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg" NAME_WE)
add_dependencies(laser_features_generate_messages_cpp _laser_features_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_features_gencpp)
add_dependencies(laser_features_gencpp laser_features_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_features_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(laser_features
  "/home/pfeix/robot_host_ws/src/laser_features/msg/Featured_segments.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_features
)
_generate_msg_eus(laser_features
  "/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_features
)

### Generating Services

### Generating Module File
_generate_module_eus(laser_features
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_features
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(laser_features_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(laser_features_generate_messages laser_features_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_features/msg/Featured_segments.msg" NAME_WE)
add_dependencies(laser_features_generate_messages_eus _laser_features_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg" NAME_WE)
add_dependencies(laser_features_generate_messages_eus _laser_features_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_features_geneus)
add_dependencies(laser_features_geneus laser_features_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_features_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(laser_features
  "/home/pfeix/robot_host_ws/src/laser_features/msg/Featured_segments.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_features
)
_generate_msg_lisp(laser_features
  "/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_features
)

### Generating Services

### Generating Module File
_generate_module_lisp(laser_features
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_features
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(laser_features_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(laser_features_generate_messages laser_features_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_features/msg/Featured_segments.msg" NAME_WE)
add_dependencies(laser_features_generate_messages_lisp _laser_features_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg" NAME_WE)
add_dependencies(laser_features_generate_messages_lisp _laser_features_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_features_genlisp)
add_dependencies(laser_features_genlisp laser_features_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_features_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(laser_features
  "/home/pfeix/robot_host_ws/src/laser_features/msg/Featured_segments.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_features
)
_generate_msg_nodejs(laser_features
  "/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_features
)

### Generating Services

### Generating Module File
_generate_module_nodejs(laser_features
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_features
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(laser_features_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(laser_features_generate_messages laser_features_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_features/msg/Featured_segments.msg" NAME_WE)
add_dependencies(laser_features_generate_messages_nodejs _laser_features_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg" NAME_WE)
add_dependencies(laser_features_generate_messages_nodejs _laser_features_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_features_gennodejs)
add_dependencies(laser_features_gennodejs laser_features_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_features_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(laser_features
  "/home/pfeix/robot_host_ws/src/laser_features/msg/Featured_segments.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_features
)
_generate_msg_py(laser_features
  "/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_features
)

### Generating Services

### Generating Module File
_generate_module_py(laser_features
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_features
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(laser_features_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(laser_features_generate_messages laser_features_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_features/msg/Featured_segments.msg" NAME_WE)
add_dependencies(laser_features_generate_messages_py _laser_features_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pfeix/robot_host_ws/src/laser_features/msg/Segment_featured.msg" NAME_WE)
add_dependencies(laser_features_generate_messages_py _laser_features_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_features_genpy)
add_dependencies(laser_features_genpy laser_features_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_features_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_features)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_features
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(laser_features_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(laser_features_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_features)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/laser_features
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(laser_features_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(laser_features_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_features)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_features
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(laser_features_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(laser_features_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_features)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/laser_features
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(laser_features_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(laser_features_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_features)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_features\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_features
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(laser_features_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(laser_features_generate_messages_py std_msgs_generate_messages_py)
endif()
