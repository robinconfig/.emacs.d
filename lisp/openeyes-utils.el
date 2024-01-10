;;; -*- lexical-binding: t -*-

;;(setq debug-on-error t)

(defconst openeyes/is-macOS
  (eq system-type 'darwin))

(defconst openeyes/is-linux
  (eq system-type 'gun/linux))

(defconst openeyes/is-windows
  (memq system-type '(ms-dos windows-nt cygwin)))

(provide 'openeyes-utils)
