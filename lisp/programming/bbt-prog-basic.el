;;; 通用编程配置

;; 错误/警告提示引擎, 目前方案使用flycheck
;; flycheck 是一个更「现代」的引擎，功能更多，呈现样式更丰富，同时和 lsp-mode 结合最好

(use-package flycheck
  :ensure t
  :init 
  (setq flycheck-emacs-lisp-load-path 'inherit)
  :config
  (setq truncate-lines nil) ; 如果单行信息很长会自动换行
  :hook
  (progn 
    (prog-mode . flycheck-mode)
    (sh-mode . (lambda () (flycheck-list-errors)))))


;; (use-package highlight-parentheses
;;   :ensure t
;;   :pin melpa
;;   :hook (prog-mode . highlight-parentheses-mode)
;;   )

(use-package smartparens
  :diminish nil
  :config
  (sp-use-smartparens-bindings))

(use-package smartparens-config
  :diminish nil
  :ensure smartparens
  :config (progn (show-smartparens-global-mode t)))

(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)

(use-package paren
  :ensure t
  :config
  (setq show-paren-delay 0.1
        show-paren-when-point-in-periphery t))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'programming/bbt-prog-basic)
