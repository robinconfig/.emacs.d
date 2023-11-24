;;; EARLY-INIT ---  -*- lexical-binding: t -*-
;;
;; Author: RobinVanYang <thehappyone@163.com>
;; Copyright © 2023 RobinVanYang. all rights reserved.
;; URL: robinvanyang.github.io
;; Created at: 24 十一月 2023
;;
;;; Commentary:
;;
;; 
;;
;;; Code:

;;(setq debug-on-error t)

(unless (>= emacs-major-version 29)
  (error "Only Emacs v29+ is supported!"))

;; 启动时将内存gc的阈值设为最大以加速启动速度
;; 启动完成后将阈值重设为默认值800000 bytes
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-threshold 800000)))

;; Clean GUI
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))


(provide 'early-init)
;;; early-init.el ends here
