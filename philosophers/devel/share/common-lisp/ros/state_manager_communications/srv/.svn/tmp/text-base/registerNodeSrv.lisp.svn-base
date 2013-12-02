; Auto-generated. Do not edit!


(cl:in-package state_manager_communications-srv)


;//! \htmlinclude registerNodeSrv-request.msg.html

(cl:defclass <registerNodeSrv-request> (roslisp-msg-protocol:ros-message)
  ((nodeName
    :reader nodeName
    :initarg :nodeName
    :type cl:string
    :initform ""))
)

(cl:defclass registerNodeSrv-request (<registerNodeSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <registerNodeSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'registerNodeSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name state_manager_communications-srv:<registerNodeSrv-request> is deprecated: use state_manager_communications-srv:registerNodeSrv-request instead.")))

(cl:ensure-generic-function 'nodeName-val :lambda-list '(m))
(cl:defmethod nodeName-val ((m <registerNodeSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_manager_communications-srv:nodeName-val is deprecated.  Use state_manager_communications-srv:nodeName instead.")
  (nodeName m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <registerNodeSrv-request>) ostream)
  "Serializes a message object of type '<registerNodeSrv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'nodeName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'nodeName))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <registerNodeSrv-request>) istream)
  "Deserializes a message object of type '<registerNodeSrv-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<registerNodeSrv-request>)))
  "Returns string type for a service object of type '<registerNodeSrv-request>"
  "state_manager_communications/registerNodeSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'registerNodeSrv-request)))
  "Returns string type for a service object of type 'registerNodeSrv-request"
  "state_manager_communications/registerNodeSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<registerNodeSrv-request>)))
  "Returns md5sum for a message object of type '<registerNodeSrv-request>"
  "fa90f177c62ffd4f5a57999c98f4104f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'registerNodeSrv-request)))
  "Returns md5sum for a message object of type 'registerNodeSrv-request"
  "fa90f177c62ffd4f5a57999c98f4104f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<registerNodeSrv-request>)))
  "Returns full string definition for message of type '<registerNodeSrv-request>"
  (cl:format cl:nil "string nodeName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'registerNodeSrv-request)))
  "Returns full string definition for message of type 'registerNodeSrv-request"
  (cl:format cl:nil "string nodeName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <registerNodeSrv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'nodeName))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <registerNodeSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'registerNodeSrv-request
    (cl:cons ':nodeName (nodeName msg))
))
;//! \htmlinclude registerNodeSrv-response.msg.html

(cl:defclass <registerNodeSrv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass registerNodeSrv-response (<registerNodeSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <registerNodeSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'registerNodeSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name state_manager_communications-srv:<registerNodeSrv-response> is deprecated: use state_manager_communications-srv:registerNodeSrv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <registerNodeSrv-response>) ostream)
  "Serializes a message object of type '<registerNodeSrv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <registerNodeSrv-response>) istream)
  "Deserializes a message object of type '<registerNodeSrv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<registerNodeSrv-response>)))
  "Returns string type for a service object of type '<registerNodeSrv-response>"
  "state_manager_communications/registerNodeSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'registerNodeSrv-response)))
  "Returns string type for a service object of type 'registerNodeSrv-response"
  "state_manager_communications/registerNodeSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<registerNodeSrv-response>)))
  "Returns md5sum for a message object of type '<registerNodeSrv-response>"
  "fa90f177c62ffd4f5a57999c98f4104f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'registerNodeSrv-response)))
  "Returns md5sum for a message object of type 'registerNodeSrv-response"
  "fa90f177c62ffd4f5a57999c98f4104f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<registerNodeSrv-response>)))
  "Returns full string definition for message of type '<registerNodeSrv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'registerNodeSrv-response)))
  "Returns full string definition for message of type 'registerNodeSrv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <registerNodeSrv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <registerNodeSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'registerNodeSrv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'registerNodeSrv)))
  'registerNodeSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'registerNodeSrv)))
  'registerNodeSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'registerNodeSrv)))
  "Returns string type for a service object of type '<registerNodeSrv>"
  "state_manager_communications/registerNodeSrv")