
(cl:in-package :asdf)

(defsystem "dining_philosopher_communications-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "hungerMsg" :depends-on ("_package_hungerMsg"))
    (:file "_package_hungerMsg" :depends-on ("_package"))
  ))