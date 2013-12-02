; Auto-generated. Do not edit!


(cl:in-package watchdog_timer-msg)


;//! \htmlinclude watchdogResetMsg.msg.html

(cl:defclass <watchdogResetMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (watchdogName
    :reader watchdogName
    :initarg :watchdogName
    :type cl:string
    :initform ""))
)

(cl:defclass watchdogResetMsg (<watchdogResetMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <watchdogResetMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'watchdogResetMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name watchdog_timer-msg:<watchdogResetMsg> is deprecated: use watchdog_timer-msg:watchdogResetMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <watchdogResetMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader watchdog_timer-msg:header-val is deprecated.  Use watchdog_timer-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'watchdogName-val :lambda-list '(m))
(cl:defmethod watchdogName-val ((m <watchdogResetMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader watchdog_timer-msg:watchdogName-val is deprecated.  Use watchdog_timer-msg:watchdogName instead.")
  (watchdogName m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <watchdogResetMsg>) ostream)
  "Serializes a message object of type '<watchdogResetMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'watchdogName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'watchdogName))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <watchdogResetMsg>) istream)
  "Deserializes a message object of type '<watchdogResetMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'watchdogName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'watchdogName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<watchdogResetMsg>)))
  "Returns string type for a message object of type '<watchdogResetMsg>"
  "watchdog_timer/watchdogResetMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'watchdogResetMsg)))
  "Returns string type for a message object of type 'watchdogResetMsg"
  "watchdog_timer/watchdogResetMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<watchdogResetMsg>)))
  "Returns md5sum for a message object of type '<watchdogResetMsg>"
  "1bb90b315b32366dc56c06df15e3ea9f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'watchdogResetMsg)))
  "Returns md5sum for a message object of type 'watchdogResetMsg"
  "1bb90b315b32366dc56c06df15e3ea9f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<watchdogResetMsg>)))
  "Returns full string definition for message of type '<watchdogResetMsg>"
  (cl:format cl:nil "Header header~%string watchdogName~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'watchdogResetMsg)))
  "Returns full string definition for message of type 'watchdogResetMsg"
  (cl:format cl:nil "Header header~%string watchdogName~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <watchdogResetMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'watchdogName))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <watchdogResetMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'watchdogResetMsg
    (cl:cons ':header (header msg))
    (cl:cons ':watchdogName (watchdogName msg))
))
