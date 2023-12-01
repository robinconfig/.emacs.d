;;; BBT-IELM --- IELM(交互式ELisp Shell) -*- lexical-binding: t -*-
;;
;; Author: RobinVanYang <thehappyone@163.com>
;; Copyright © 2023 RobinVanYang. all rights reserved.
;; URL: robinvanyang.github.io
;; Created at: 29 十一月 2023
;;
;;; Commentary:
;;
;; IELM(Interactive Emacs Lisp Mode)
;;
;;; Code:

;;(setq debug-on-error t)

;; 在IELM中显示eldoc
(defun my-ielm-mode-defaults ()
  (turn-on-eldoc-mode))
  

(add-hook 'ielm-mode-hook (lambda()(run-hooks 'my-ielm-mode-defaults)))


(provide 'bbt-ielm)
;;; bbt-ielm.el ends here
