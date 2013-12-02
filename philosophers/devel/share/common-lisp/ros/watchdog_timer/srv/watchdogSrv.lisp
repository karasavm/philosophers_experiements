; Auto-generated. Do not edit!


(cl:in-package watchdog_timer-srv)


;//! \htmlinclude watchdogSrv-request.msg.html

(cl:defclass <watchdogSrv-request> (roslisp-msg-protocol:ros-message)
  ((watchdogName
    :reader watchdogName
    :initarg :watchdogName
    :type cl:string
    :initform "")
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0)
   (timeoutDuration
    :reader timeoutDuration
    :initarg :timeoutDuration
    :type cl:real
    :initform 0))
)

(cl:defclass watchdogSrv-request (<watchdogSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <watchdogSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'watchdogSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name watchdog_timer-srv:<watchdogSrv-request> is deprecated: use watchdog_timer-srv:watchdogSrv-request instead.")))

(cl:ensure-generic-function 'watchdogName-val :lambda-list '(m))
(cl:defmethod watchdogName-val ((m <watchdogSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader watchdog_timer-srv:watchdogName-val is deprecated.  Use watchdog_timer-srv:watchdogName instead.")
  (watchdogName m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <watchdogSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader watchdog_timer-srv:type-val is deprecated.  Use watchdog_timer-srv:type instead.")
  (type m))

(cl:ensure-generic-function 'timeoutDuration-val :lambda-list '(m))
(cl:defmethod timeoutDuration-val ((m <watchdogSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader watchdog_timer-srv:timeoutDuration-val is deprecated.  Use watchdog_timer-srv:timeoutDuration instead.")
  (timeoutDuration m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<watchdogSrv-request>)))
    "Constants for message type '<watchdogSrv-request>"
  '((:TYPE_STOP . 0)
    (:TYPE_START . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'watchdogSrv-request)))
    "Constants for message type 'watchdogSrv-request"
  '((:TYPE_STOP . 0)
    (:TYPE_START . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <watchdogSrv-request>) ostream)
  "Serializes a message object of type '<watchdogSrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'watchdogName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'watchdogName))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'timeoutDuration)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'timeoutDuration) (cl:floor (cl:slot-value msg 'timeoutDuration)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <watchdogSrv-request>) istream)
  "Deserializes a message object of type '<watchdogSrv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'watchdogName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'watchdogName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timeoutDuration) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<watchdogSrv-request>)))
  "Returns string type for a service object of type '<watchdogSrv-request>"
  "watchdog_timer/watchdogSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'watchdogSrv-request)))
  "Returns string type for a service object of type 'watchdogSrv-request"
  "watchdog_timer/watchdogSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<watchdogSrv-request>)))
  "Returns md5sum for a message object of type '<watchdogSrv-request>"
  "df769c8ebbf1228924a2ae49d71f0000")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'watchdogSrv-request)))
  "Returns md5sum for a message object of type 'watchdogSrv-request"
  "df769c8ebbf1228924a2ae49d71f0000")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<watchdogSrv-request>)))
  "Returns full string definition for message of type '<watchdogSrv-request>"
  (cl:format cl:nil "string watchdogName~%uint8 type~%uint8 TYPE_STOP = 0~%uint8 TYPE_START = 1~%duration timeoutDuration~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'watchdogSrv-request)))
  "Returns full string definition for message of type 'watchdogSrv-request"
  (cl:format cl:nil "string watchdogName~%uint8 type~%uint8 TYPE_STOP = 0~%uint8 TYPE_START = 1~%duration timeoutDuration~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <watchdogSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'watchdogName))
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <watchdogSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'watchdogSrv-request
    (cl:cons ':watchdogName (watchdogName msg))
    (cl:cons ':type (type msg))
    (cl:cons ':timeoutDuration (timeoutDuration msg))
))
;//! \htmlinclude watchdogSrv-response.msg.html

(cl:defclass <watchdogSrv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass watchdogSrv-response (<watchdogSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <watchdogSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'watchdogSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name watchdog_timer-srv:<watchdogSrv-response> is deprecated: use watchdog_timer-srv:watchdogSrv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <watchdogSrv-response>) ostream)
  "Serializes a message object of type '<watchdogSrv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <watchdogSrv-response>) istream)
  "Deserializes a message object of type '<watchdogSrv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<watchdogSrv-response>)))
  "Returns string type for a service object of type '<watchdogSrv-response>"
  "watchdog_timer/watchdogSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'watchdogSrv-response)))
  "Returns string type for a service object of type 'watchdogSrv-response"
  "watchdog_timer/watchdogSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<watchdogSrv-response>)))
  "Returns md5sum for a message object of type '<watchdogSrv-response>"
  "df769c8ebbf1228924a2ae49d71f0000")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'watchdogSrv-response)))
  "Returns md5sum for a message object of type 'watchdogSrv-response"
  "df769c8ebbf1228924a2ae49d71f0000")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<watchdogSrv-response>)))
  "Returns full string definition for message of type '<watchdogSrv-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'watchdogSrv-response)))
  "Returns full string definition for message of type 'watchdogSrv-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <watchdogSrv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <watchdogSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'watchdogSrv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'watchdogSrv)))
  'watchdogSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'watchdogSrv)))
  'watchdogSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'watchdogSrv)))
  "Returns string type for a service object of type '<watchdogSrv>"
  "watchdog_timer/watchdogSrv")