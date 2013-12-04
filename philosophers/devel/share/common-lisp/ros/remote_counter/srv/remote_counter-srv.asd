
(cl:in-package :asdf)

(defsystem "remote_counter-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "countingSrv" :depends-on ("_package_countingSrv"))
    (:file "_package_countingSrv" :depends-on ("_package"))
  ))