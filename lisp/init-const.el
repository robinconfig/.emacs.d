;;; INIT-CONST ---  -*- lexical-binding: t -*-
;;
;; Author: RobinVanYang <thehappyone@163.com>
;; Copyright © 2023 RobinVanYang. all rights reserved.
;; URL: robinvanyang.github.io
;; Created at: 30 八月 2023
;;
;;; Commentary:
;;
;; 
;;
;;; Code:

;;(setq debug-on-error t)
(defconst *is-mac* (eq system-type 'darwin))
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

(provide 'init-const)
;;; init-const.el ends here
