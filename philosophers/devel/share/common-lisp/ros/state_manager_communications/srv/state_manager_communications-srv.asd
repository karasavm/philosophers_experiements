
(cl:in-package :asdf)

(defsystem "state_manager_communications-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "registerNodeSrv" :depends-on ("_package_registerNodeSrv"))
    (:file "_package_registerNodeSrv" :depends-on ("_package"))
  ))