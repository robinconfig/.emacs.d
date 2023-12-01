;;; INIT-ELISP --- 配置Elisp -*- lexical-binding: t -*-
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

;; 禁用flycheck在Elisp Mode的checkdoc提示
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;; brace-pattern highlight
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-elisp)
;;; init-elisp.el ends here
