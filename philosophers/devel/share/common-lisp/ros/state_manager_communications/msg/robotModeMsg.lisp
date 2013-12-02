; Auto-generated. Do not edit!


(cl:in-package state_manager_communications-msg)


;//! \htmlinclude robotModeMsg.msg.html

(cl:defclass <robotModeMsg> (roslisp-msg-protocol:ros-message)
  ((nodeName
    :reader nodeName
    :initarg :nodeName
    :type cl:string
    :initform "")
   (mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0)
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0))
)

(cl:defclass robotModeMsg (<robotModeMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robotModeMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robotModeMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name state_manager_communications-msg:<robotModeMsg> is deprecated: use state_manager_communications-msg:robotModeMsg instead.")))

(cl:ensure-generic-function 'nodeName-val :lambda-list '(m))
(cl:defmethod nodeName-val ((m <robotModeMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_manager_communications-msg:nodeName-val is deprecated.  Use state_manager_communications-msg:nodeName instead.")
  (nodeName m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <robotModeMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_manager_communications-msg:mode-val is deprecated.  Use state_manager_communications-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <robotModeMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_manager_communications-msg:type-val is deprecated.  Use state_manager_communications-msg:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<robotModeMsg>)))
    "Constants for message type '<robotModeMsg>"
  '((:MODE_OFF . 0)
    (:MODE_NORMAL . 1)
    (:TYPE_TRANSITION . 0)
    (:TYPE_START . 1)
    (:TYPE_REQUEST . 3)
    (:TYPE_ACK . 4))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'robotModeMsg)))
    "Constants for message type 'robotModeMsg"
  '((:MODE_OFF . 0)
    (:MODE_NORMAL . 1)
    (:TYPE_TRANSITION . 0)
    (:TYPE_START . 1)
    (:TYPE_REQUEST . 3)
    (:TYPE_ACK . 4))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robotModeMsg>) ostream)
  "Serializes a message object of type '<robotModeMsg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'nodeName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'nodeName))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robotModeMsg>) istream)
  "Deserializes a message object of type '<robotModeMsg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nodeName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'nodeName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robotModeMsg>)))
  "Returns string type for a message object of type '<robotModeMsg>"
  "state_manager_communications/robotModeMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robotModeMsg)))
  "Returns string type for a message object of type 'robotModeMsg"
  "state_manager_communications/robotModeMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robotModeMsg>)))
  "Returns md5sum for a message object of type '<robotModeMsg>"
  "f72c1608aab809dbbc4df281d3ec0dfa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robotModeMsg)))
  "Returns md5sum for a message object of type 'robotModeMsg"
  "f72c1608aab809dbbc4df281d3ec0dfa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robotModeMsg>)))
  "Returns full string definition for message of type '<robotModeMsg>"
  (cl:format cl:nil "string nodeName~%~%uint8 mode~%uint8 MODE_OFF = 0~%uint8 MODE_NORMAL = 1~%~%~%uint8 type~%uint8 TYPE_TRANSITION = 0~%uint8 TYPE_START = 1~%uint8 TYPE_REQUEST = 3~%uint8 TYPE_ACK = 4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robotModeMsg)))
  "Returns full string definition for message of type 'robotModeMsg"
  (cl:format cl:nil "string nodeName~%~%uint8 mode~%uint8 MODE_OFF = 0~%uint8 MODE_NORMAL = 1~%~%~%uint8 type~%uint8 TYPE_TRANSITION = 0~%uint8 TYPE_START = 1~%uint8 TYPE_REQUEST = 3~%uint8 TYPE_ACK = 4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robotModeMsg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'nodeName))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robotModeMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'robotModeMsg
    (cl:cons ':nodeName (nodeName msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':type (type msg))
))
