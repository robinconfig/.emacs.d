;;; 通用编程配置

(use-package highlight-parentheses
  :ensure t
  ;; 指定从melpa仓库中读取
  :pin melpa
  ;; 在编程语言模式中启用此mode
  :hook (prog-mode . highlight-parentheses-mode)
  :config 
  (setq hl-paren-background-colors '("orangered4"))
  (setq hl-paren-colors '("black")))

(provide 'bbt-programming)
