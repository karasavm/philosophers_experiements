# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "remote_counter: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/hydro/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(remote_counter_generate_messages ALL)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(remote_counter
  "/home/mike/svn/nasia/trunk/philosophers/src/remote_counter/srv/countingSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/remote_counter
)

### Generating Module File
_generate_module_cpp(remote_counter
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/remote_counter
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(remote_counter_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(remote_counter_generate_messages remote_counter_generate_messages_cpp)

# target for backward compatibility
add_custom_target(remote_counter_gencpp)
add_dependencies(remote_counter_gencpp remote_counter_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS remote_counter_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(remote_counter
  "/home/mike/svn/nasia/trunk/philosophers/src/remote_counter/srv/countingSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/remote_counter
)

### Generating Module File
_generate_module_lisp(remote_counter
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/remote_counter
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(remote_counter_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(remote_counter_generate_messages remote_counter_generate_messages_lisp)

# target for backward compatibility
add_custom_target(remote_counter_genlisp)
add_dependencies(remote_counter_genlisp remote_counter_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS remote_counter_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(remote_counter
  "/home/mike/svn/nasia/trunk/philosophers/src/remote_counter/srv/countingSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/remote_counter
)

### Generating Module File
_generate_module_py(remote_counter
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/remote_counter
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(remote_counter_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(remote_counter_generate_messages remote_counter_generate_messages_py)

# target for backward compatibility
add_custom_target(remote_counter_genpy)
add_dependencies(remote_counter_genpy remote_counter_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS remote_counter_generate_messages_py)


debug_message(2 "remote_counter: Iflags=${MSG_I_FLAGS}")


if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/remote_counter)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/remote_counter
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(remote_counter_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/remote_counter)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/remote_counter
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(remote_counter_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/remote_counter)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/remote_counter\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/remote_counter
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(remote_counter_generate_messages_py std_msgs_generate_messages_py)
