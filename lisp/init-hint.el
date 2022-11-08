;; 错误/警告提示引擎, 目前方案使用flycheck
;; flycheck 是一个更「现代」的引擎，功能更多，呈现样式更丰富，同时和 lsp-mode 结合最好

(use-package flycheck
  :init ;; 在 (require) 之前需要执行的
  (setq flycheck-emacs-lisp-load-path 'inherit)
  :config
  (global-flycheck-mode))


(provide 'init-hint)