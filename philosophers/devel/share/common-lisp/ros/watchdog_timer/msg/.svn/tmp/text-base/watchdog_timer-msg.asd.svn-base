
(cl:in-package :asdf)

(defsystem "watchdog_timer-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "watchdogResetMsg" :depends-on ("_package_watchdogResetMsg"))
    (:file "_package_watchdogResetMsg" :depends-on ("_package"))
    (:file "wdtTimeoutNotificationMsg" :depends-on ("_package_wdtTimeoutNotificationMsg"))
    (:file "_package_wdtTimeoutNotificationMsg" :depends-on ("_package"))
  ))