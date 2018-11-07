
(cl:in-package :asdf)

(defsystem "laser_features-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Featured_segments" :depends-on ("_package_Featured_segments"))
    (:file "_package_Featured_segments" :depends-on ("_package"))
    (:file "Segment_featured" :depends-on ("_package_Segment_featured"))
    (:file "_package_Segment_featured" :depends-on ("_package"))
  ))