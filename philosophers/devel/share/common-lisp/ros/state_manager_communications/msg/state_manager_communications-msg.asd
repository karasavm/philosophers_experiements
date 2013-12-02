
(cl:in-package :asdf)

(defsystem "state_manager_communications-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "robotModeMsg" :depends-on ("_package_robotModeMsg"))
    (:file "_package_robotModeMsg" :depends-on ("_package"))
  ))