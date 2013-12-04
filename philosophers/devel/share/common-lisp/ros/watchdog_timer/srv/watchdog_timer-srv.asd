
(cl:in-package :asdf)

(defsystem "watchdog_timer-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "watchdogSrv" :depends-on ("_package_watchdogSrv"))
    (:file "_package_watchdogSrv" :depends-on ("_package"))
  ))