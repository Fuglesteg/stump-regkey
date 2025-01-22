(defpackage :stump-regkey
  (:use :cl :stumpwm)
  (:export :register-keysym
           :register-character))

(in-package :stump-regkey)

(defun list->2d-array (list)
  (make-array (list (length list)
                    (length (first list)))
              :initial-contents list))

(defun change-keyboard-mapping-row (row keycode)
  (xlib:change-keyboard-mapping *display* (list->2d-array (list row)) :first-keycode keycode))

(defvar *used-keycodes* nil)

(defun used-keycode (keycode)
  (member keycode *used-keycodes* :test #'=))

(defun empty-keycodes ()
  (let ((empty-keycodes (multiple-value-list (xlib:keysym->keycodes *display* 0))))
    (remove-if #'used-keycode empty-keycodes)))

(defun empty-keycode ()
  (first (empty-keycodes)))

(defun register-keysym (keysym)
  (let ((empty-keycode (empty-keycode)))
    (change-keyboard-mapping-row (list keysym 0 0 0 0 0 0 0 0 0 0 0 0 0 0) empty-keycode)
    (pushnew empty-keycode *used-keycodes*)))

(defun register-character (character)
  (register-keysym (first (xlib:character->keysyms character))))