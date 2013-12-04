# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "remote_mutex: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/hydro/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(remote_mutex_generate_messages ALL)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(remote_mutex
  "/home/mike/philosophers_experiments/philosophers/src/remote_mutex/srv/mutexSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/remote_mutex
)

### Generating Module File
_generate_module_cpp(remote_mutex
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/remote_mutex
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(remote_mutex_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(remote_mutex_generate_messages remote_mutex_generate_messages_cpp)

# target for backward compatibility
add_custom_target(remote_mutex_gencpp)
add_dependencies(remote_mutex_gencpp remote_mutex_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS remote_mutex_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(remote_mutex
  "/home/mike/philosophers_experiments/philosophers/src/remote_mutex/srv/mutexSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/remote_mutex
)

### Generating Module File
_generate_module_lisp(remote_mutex
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/remote_mutex
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(remote_mutex_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(remote_mutex_generate_messages remote_mutex_generate_messages_lisp)

# target for backward compatibility
add_custom_target(remote_mutex_genlisp)
add_dependencies(remote_mutex_genlisp remote_mutex_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS remote_mutex_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(remote_mutex
  "/home/mike/philosophers_experiments/philosophers/src/remote_mutex/srv/mutexSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/remote_mutex
)

### Generating Module File
_generate_module_py(remote_mutex
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/remote_mutex
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(remote_mutex_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(remote_mutex_generate_messages remote_mutex_generate_messages_py)

# target for backward compatibility
add_custom_target(remote_mutex_genpy)
add_dependencies(remote_mutex_genpy remote_mutex_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS remote_mutex_generate_messages_py)


debug_message(2 "remote_mutex: Iflags=${MSG_I_FLAGS}")


if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/remote_mutex)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/remote_mutex
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(remote_mutex_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/remote_mutex)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/remote_mutex
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(remote_mutex_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/remote_mutex)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/remote_mutex\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/remote_mutex
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(remote_mutex_generate_messages_py std_msgs_generate_messages_py)
