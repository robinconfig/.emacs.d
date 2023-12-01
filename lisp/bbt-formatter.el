;;; 代码格式化配置

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(global-set-key (kbd "M-<RET>") 'editorconfig-format-buffer)

(provide 'bbt-formatter)
