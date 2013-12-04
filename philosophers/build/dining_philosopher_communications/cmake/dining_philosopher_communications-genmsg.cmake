# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "dining_philosopher_communications: 1 messages, 0 services")

set(MSG_I_FLAGS "-Idining_philosopher_communications:/home/mike/philosophers_experiments/philosophers/src/dining_philosopher_communications/msg;-Istd_msgs:/opt/ros/hydro/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(dining_philosopher_communications_generate_messages ALL)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(dining_philosopher_communications
  "/home/mike/philosophers_experiments/philosophers/src/dining_philosopher_communications/msg/hungerMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dining_philosopher_communications
)

### Generating Services

### Generating Module File
_generate_module_cpp(dining_philosopher_communications
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dining_philosopher_communications
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(dining_philosopher_communications_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(dining_philosopher_communications_generate_messages dining_philosopher_communications_generate_messages_cpp)

# target for backward compatibility
add_custom_target(dining_philosopher_communications_gencpp)
add_dependencies(dining_philosopher_communications_gencpp dining_philosopher_communications_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dining_philosopher_communications_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(dining_philosopher_communications
  "/home/mike/philosophers_experiments/philosophers/src/dining_philosopher_communications/msg/hungerMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dining_philosopher_communications
)

### Generating Services

### Generating Module File
_generate_module_lisp(dining_philosopher_communications
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dining_philosopher_communications
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(dining_philosopher_communications_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(dining_philosopher_communications_generate_messages dining_philosopher_communications_generate_messages_lisp)

# target for backward compatibility
add_custom_target(dining_philosopher_communications_genlisp)
add_dependencies(dining_philosopher_communications_genlisp dining_philosopher_communications_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dining_philosopher_communications_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(dining_philosopher_communications
  "/home/mike/philosophers_experiments/philosophers/src/dining_philosopher_communications/msg/hungerMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dining_philosopher_communications
)

### Generating Services

### Generating Module File
_generate_module_py(dining_philosopher_communications
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dining_philosopher_communications
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(dining_philosopher_communications_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(dining_philosopher_communications_generate_messages dining_philosopher_communications_generate_messages_py)

# target for backward compatibility
add_custom_target(dining_philosopher_communications_genpy)
add_dependencies(dining_philosopher_communications_genpy dining_philosopher_communications_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dining_philosopher_communications_generate_messages_py)


debug_message(2 "dining_philosopher_communications: Iflags=${MSG_I_FLAGS}")


if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dining_philosopher_communications)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dining_philosopher_communications
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(dining_philosopher_communications_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dining_philosopher_communications)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dining_philosopher_communications
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(dining_philosopher_communications_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dining_philosopher_communications)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dining_philosopher_communications\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dining_philosopher_communications
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(dining_philosopher_communications_generate_messages_py std_msgs_generate_messages_py)
