(defpackage :stump-regkey
  (:use :cl :stumpwm)
  (:export register-keysym))

(in-package :stump-regkey)

(defun list->2d-array (list)
  (make-array (list (length list)
                    (length (first list)))
              :initial-contents list))

(defun change-keyboard-mapping-row (row keycode)
  (xlib:change-keyboard-mapping *display* (list->2d-array (list row)) :first-keycode keycode))

(defun register-keysym (keysym)
  (let ((empty-keycode (xlib:keysym->keycodes *display* 0)))
    (change-keyboard-mapping-row (list keysym 0 0 0 0 0 0 0 0 0 0 0 0 0 0) empty-keycode)))