;;; --- 配置Emacs Lisp

;; 禁用flycheck在ELisp Mode的checkdoc提示
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;; brace-pattern highlight
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


;;; IELM(Interactive Emacs Lisp Mode, 交互式ELisp Shell)配置

;; 在IELM中显示eldoc
(defun my-ielm-mode-defaults ()
  (turn-on-eldoc-mode))
  
(add-hook 'ielm-mode-hook (lambda()(run-hooks 'my-ielm-mode-defaults)))


(provide 'init-elisp)
