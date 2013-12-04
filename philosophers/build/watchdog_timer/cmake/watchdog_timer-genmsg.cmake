# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "watchdog_timer: 2 messages, 1 services")

set(MSG_I_FLAGS "-Iwatchdog_timer:/home/mike/philosophers_experiments/philosophers/src/watchdog_timer/msg;-Istd_msgs:/opt/ros/hydro/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(watchdog_timer_generate_messages ALL)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(watchdog_timer
  "/home/mike/philosophers_experiments/philosophers/src/watchdog_timer/msg/wdtTimeoutNotificationMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/watchdog_timer
)
_generate_msg_cpp(watchdog_timer
  "/home/mike/philosophers_experiments/philosophers/src/watchdog_timer/msg/watchdogResetMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/watchdog_timer
)

### Generating Services
_generate_srv_cpp(watchdog_timer
  "/home/mike/philosophers_experiments/philosophers/src/watchdog_timer/srv/watchdogSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/watchdog_timer
)

### Generating Module File
_generate_module_cpp(watchdog_timer
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/watchdog_timer
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(watchdog_timer_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(watchdog_timer_generate_messages watchdog_timer_generate_messages_cpp)

# target for backward compatibility
add_custom_target(watchdog_timer_gencpp)
add_dependencies(watchdog_timer_gencpp watchdog_timer_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS watchdog_timer_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(watchdog_timer
  "/home/mike/philosophers_experiments/philosophers/src/watchdog_timer/msg/wdtTimeoutNotificationMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/watchdog_timer
)
_generate_msg_lisp(watchdog_timer
  "/home/mike/philosophers_experiments/philosophers/src/watchdog_timer/msg/watchdogResetMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/watchdog_timer
)

### Generating Services
_generate_srv_lisp(watchdog_timer
  "/home/mike/philosophers_experiments/philosophers/src/watchdog_timer/srv/watchdogSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/watchdog_timer
)

### Generating Module File
_generate_module_lisp(watchdog_timer
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/watchdog_timer
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(watchdog_timer_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(watchdog_timer_generate_messages watchdog_timer_generate_messages_lisp)

# target for backward compatibility
add_custom_target(watchdog_timer_genlisp)
add_dependencies(watchdog_timer_genlisp watchdog_timer_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS watchdog_timer_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(watchdog_timer
  "/home/mike/philosophers_experiments/philosophers/src/watchdog_timer/msg/wdtTimeoutNotificationMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/watchdog_timer
)
_generate_msg_py(watchdog_timer
  "/home/mike/philosophers_experiments/philosophers/src/watchdog_timer/msg/watchdogResetMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/watchdog_timer
)

### Generating Services
_generate_srv_py(watchdog_timer
  "/home/mike/philosophers_experiments/philosophers/src/watchdog_timer/srv/watchdogSrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/watchdog_timer
)

### Generating Module File
_generate_module_py(watchdog_timer
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/watchdog_timer
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(watchdog_timer_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(watchdog_timer_generate_messages watchdog_timer_generate_messages_py)

# target for backward compatibility
add_custom_target(watchdog_timer_genpy)
add_dependencies(watchdog_timer_genpy watchdog_timer_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS watchdog_timer_generate_messages_py)


debug_message(2 "watchdog_timer: Iflags=${MSG_I_FLAGS}")


if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/watchdog_timer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/watchdog_timer
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(watchdog_timer_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/watchdog_timer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/watchdog_timer
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(watchdog_timer_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/watchdog_timer)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/watchdog_timer\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/watchdog_timer
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(watchdog_timer_generate_messages_py std_msgs_generate_messages_py)
