; Auto-generated. Do not edit!


(cl:in-package remote_counter-srv)


;//! \htmlinclude countingSrv-request.msg.html

(cl:defclass <countingSrv-request> (roslisp-msg-protocol:ros-message)
  ((count
    :reader count
    :initarg :count
    :type cl:integer
    :initform 0))
)

(cl:defclass countingSrv-request (<countingSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <countingSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'countingSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name remote_counter-srv:<countingSrv-request> is deprecated: use remote_counter-srv:countingSrv-request instead.")))

(cl:ensure-generic-function 'count-val :lambda-list '(m))
(cl:defmethod count-val ((m <countingSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader remote_counter-srv:count-val is deprecated.  Use remote_counter-srv:count instead.")
  (count m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <countingSrv-request>) ostream)
  "Serializes a message object of type '<countingSrv-request>"
  (cl:let* ((signed (cl:slot-value msg 'count)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <countingSrv-request>) istream)
  "Deserializes a message object of type '<countingSrv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'count) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<countingSrv-request>)))
  "Returns string type for a service object of type '<countingSrv-request>"
  "remote_counter/countingSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'countingSrv-request)))
  "Returns string type for a service object of type 'countingSrv-request"
  "remote_counter/countingSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<countingSrv-request>)))
  "Returns md5sum for a message object of type '<countingSrv-request>"
  "e776d1b0a056e00bb655e610bce156ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'countingSrv-request)))
  "Returns md5sum for a message object of type 'countingSrv-request"
  "e776d1b0a056e00bb655e610bce156ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<countingSrv-request>)))
  "Returns full string definition for message of type '<countingSrv-request>"
  (cl:format cl:nil "int64 count~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'countingSrv-request)))
  "Returns full string definition for message of type 'countingSrv-request"
  (cl:format cl:nil "int64 count~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <countingSrv-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <countingSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'countingSrv-request
    (cl:cons ':count (count msg))
))
;//! \htmlinclude countingSrv-response.msg.html

(cl:defclass <countingSrv-response> (roslisp-msg-protocol:ros-message)
  ((ok
    :reader ok
    :initarg :ok
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass countingSrv-response (<countingSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <countingSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'countingSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name remote_counter-srv:<countingSrv-response> is deprecated: use remote_counter-srv:countingSrv-response instead.")))

(cl:ensure-generic-function 'ok-val :lambda-list '(m))
(cl:defmethod ok-val ((m <countingSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader remote_counter-srv:ok-val is deprecated.  Use remote_counter-srv:ok instead.")
  (ok m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <countingSrv-response>) ostream)
  "Serializes a message object of type '<countingSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ok) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <countingSrv-response>) istream)
  "Deserializes a message object of type '<countingSrv-response>"
    (cl:setf (cl:slot-value msg 'ok) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<countingSrv-response>)))
  "Returns string type for a service object of type '<countingSrv-response>"
  "remote_counter/countingSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'countingSrv-response)))
  "Returns string type for a service object of type 'countingSrv-response"
  "remote_counter/countingSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<countingSrv-response>)))
  "Returns md5sum for a message object of type '<countingSrv-response>"
  "e776d1b0a056e00bb655e610bce156ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'countingSrv-response)))
  "Returns md5sum for a message object of type 'countingSrv-response"
  "e776d1b0a056e00bb655e610bce156ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<countingSrv-response>)))
  "Returns full string definition for message of type '<countingSrv-response>"
  (cl:format cl:nil "bool ok~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'countingSrv-response)))
  "Returns full string definition for message of type 'countingSrv-response"
  (cl:format cl:nil "bool ok~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <countingSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <countingSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'countingSrv-response
    (cl:cons ':ok (ok msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'countingSrv)))
  'countingSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'countingSrv)))
  'countingSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'countingSrv)))
  "Returns string type for a service object of type '<countingSrv>"
  "remote_counter/countingSrv")