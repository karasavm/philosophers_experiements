; Auto-generated. Do not edit!


(cl:in-package watchdog_timer-msg)


;//! \htmlinclude wdtTimeoutNotificationMsg.msg.html

(cl:defclass <wdtTimeoutNotificationMsg> (roslisp-msg-protocol:ros-message)
  ((wdtName
    :reader wdtName
    :initarg :wdtName
    :type cl:string
    :initform "")
   (lastReset
    :reader lastReset
    :initarg :lastReset
    :type cl:real
    :initform 0)
   (nodeName
    :reader nodeName
    :initarg :nodeName
    :type cl:string
    :initform ""))
)

(cl:defclass wdtTimeoutNotificationMsg (<wdtTimeoutNotificationMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <wdtTimeoutNotificationMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'wdtTimeoutNotificationMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name watchdog_timer-msg:<wdtTimeoutNotificationMsg> is deprecated: use watchdog_timer-msg:wdtTimeoutNotificationMsg instead.")))

(cl:ensure-generic-function 'wdtName-val :lambda-list '(m))
(cl:defmethod wdtName-val ((m <wdtTimeoutNotificationMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader watchdog_timer-msg:wdtName-val is deprecated.  Use watchdog_timer-msg:wdtName instead.")
  (wdtName m))

(cl:ensure-generic-function 'lastReset-val :lambda-list '(m))
(cl:defmethod lastReset-val ((m <wdtTimeoutNotificationMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader watchdog_timer-msg:lastReset-val is deprecated.  Use watchdog_timer-msg:lastReset instead.")
  (lastReset m))

(cl:ensure-generic-function 'nodeName-val :lambda-list '(m))
(cl:defmethod nodeName-val ((m <wdtTimeoutNotificationMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader watchdog_timer-msg:nodeName-val is deprecated.  Use watchdog_timer-msg:nodeName instead.")
  (nodeName m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <wdtTimeoutNotificationMsg>) ostream)
  "Serializes a message object of type '<wdtTimeoutNotificationMsg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'wdtName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'wdtName))
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'lastReset)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'lastReset) (cl:floor (cl:slot-value msg 'lastReset)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'nodeName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'nodeName))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <wdtTimeoutNotificationMsg>) istream)
  "Deserializes a message object of type '<wdtTimeoutNotificationMsg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wdtName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'wdtName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lastReset) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nodeName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'nodeName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<wdtTimeoutNotificationMsg>)))
  "Returns string type for a message object of type '<wdtTimeoutNotificationMsg>"
  "watchdog_timer/wdtTimeoutNotificationMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'wdtTimeoutNotificationMsg)))
  "Returns string type for a message object of type 'wdtTimeoutNotificationMsg"
  "watchdog_timer/wdtTimeoutNotificationMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<wdtTimeoutNotificationMsg>)))
  "Returns md5sum for a message object of type '<wdtTimeoutNotificationMsg>"
  "de0cd651d29e337cc351e29b0a447494")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'wdtTimeoutNotificationMsg)))
  "Returns md5sum for a message object of type 'wdtTimeoutNotificationMsg"
  "de0cd651d29e337cc351e29b0a447494")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<wdtTimeoutNotificationMsg>)))
  "Returns full string definition for message of type '<wdtTimeoutNotificationMsg>"
  (cl:format cl:nil "string wdtName~%time lastReset~%string nodeName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'wdtTimeoutNotificationMsg)))
  "Returns full string definition for message of type 'wdtTimeoutNotificationMsg"
  (cl:format cl:nil "string wdtName~%time lastReset~%string nodeName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <wdtTimeoutNotificationMsg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'wdtName))
     8
     4 (cl:length (cl:slot-value msg 'nodeName))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <wdtTimeoutNotificationMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'wdtTimeoutNotificationMsg
    (cl:cons ':wdtName (wdtName msg))
    (cl:cons ':lastReset (lastReset msg))
    (cl:cons ':nodeName (nodeName msg))
))
