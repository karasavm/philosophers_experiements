; Auto-generated. Do not edit!


(cl:in-package dining_philosopher_communications-msg)


;//! \htmlinclude hungerMsg.msg.html

(cl:defclass <hungerMsg> (roslisp-msg-protocol:ros-message)
  ((hungerLevel
    :reader hungerLevel
    :initarg :hungerLevel
    :type cl:float
    :initform 0.0)
   (faulty
    :reader faulty
    :initarg :faulty
    :type cl:fixnum
    :initform 0))
)

(cl:defclass hungerMsg (<hungerMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <hungerMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'hungerMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dining_philosopher_communications-msg:<hungerMsg> is deprecated: use dining_philosopher_communications-msg:hungerMsg instead.")))

(cl:ensure-generic-function 'hungerLevel-val :lambda-list '(m))
(cl:defmethod hungerLevel-val ((m <hungerMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dining_philosopher_communications-msg:hungerLevel-val is deprecated.  Use dining_philosopher_communications-msg:hungerLevel instead.")
  (hungerLevel m))

(cl:ensure-generic-function 'faulty-val :lambda-list '(m))
(cl:defmethod faulty-val ((m <hungerMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dining_philosopher_communications-msg:faulty-val is deprecated.  Use dining_philosopher_communications-msg:faulty instead.")
  (faulty m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <hungerMsg>) ostream)
  "Serializes a message object of type '<hungerMsg>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'hungerLevel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'faulty)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <hungerMsg>) istream)
  "Deserializes a message object of type '<hungerMsg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'hungerLevel) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'faulty) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<hungerMsg>)))
  "Returns string type for a message object of type '<hungerMsg>"
  "dining_philosopher_communications/hungerMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'hungerMsg)))
  "Returns string type for a message object of type 'hungerMsg"
  "dining_philosopher_communications/hungerMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<hungerMsg>)))
  "Returns md5sum for a message object of type '<hungerMsg>"
  "40140d6023099e34d518ba49c1fc4b55")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'hungerMsg)))
  "Returns md5sum for a message object of type 'hungerMsg"
  "40140d6023099e34d518ba49c1fc4b55")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<hungerMsg>)))
  "Returns full string definition for message of type '<hungerMsg>"
  (cl:format cl:nil "~%float64 hungerLevel~%int16 faulty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'hungerMsg)))
  "Returns full string definition for message of type 'hungerMsg"
  (cl:format cl:nil "~%float64 hungerLevel~%int16 faulty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <hungerMsg>))
  (cl:+ 0
     8
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <hungerMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'hungerMsg
    (cl:cons ':hungerLevel (hungerLevel msg))
    (cl:cons ':faulty (faulty msg))
))
