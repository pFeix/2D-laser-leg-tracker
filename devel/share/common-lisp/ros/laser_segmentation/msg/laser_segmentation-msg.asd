
(cl:in-package :asdf)

(defsystem "laser_segmentation-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "PointCloudSegmented" :depends-on ("_package_PointCloudSegmented"))
    (:file "_package_PointCloudSegmented" :depends-on ("_package"))
    (:file "Segment" :depends-on ("_package_Segment"))
    (:file "_package_Segment" :depends-on ("_package"))
  ))