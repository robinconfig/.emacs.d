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
  (prog-mode . flycheck-mode)
  (sh-mode . (lambda () (flycheck-list-errors))))


(use-package highlight-parentheses
  :ensure t
  ;; 指定从melpa仓库中读取
  :pin melpa
  ;; 在编程语言模式中启用此mode
  :hook (prog-mode . highlight-parentheses-mode)
  :config 
  (setq hl-paren-background-colors '("orangered4"))
  (setq hl-paren-colors '("black")))

(provide 'programming/bbt-prog-basic)
