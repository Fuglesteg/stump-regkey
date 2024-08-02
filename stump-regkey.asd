(asdf:defsystem #:stump-regkey
  :description "Register keysyms for X keyboard mapping"
  :author "Andreas Fuglesteg Dale <andreasfdale@gmail.com>"
  :license "GPL3"
  :depends-on (#:stumpwm #:xlib)
  :components ((:file "stump-regkey")))