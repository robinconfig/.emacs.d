;; 补全相关配置
;; 文本补全
;; 使用： *company-mode*, 支持多backend.
(use-package company
  :ensure t
  ;; 等价于 (add-hook 'after-init-hook #'global-company-mode)
  :hook (after-init . global-company-mode)
  :config
  ;; setq 可以像这样连着设置多个变量的值
  (setq company-tooltip-align-annotations t ; 注释贴右侧对齐
        company-tooltip-limit 20            ; 菜单里可选项数量
        company-show-numbers t              ; 显示编号（然后可以用 M-数字 快速选定某一项）
        company-idle-delay .2               ; 延时多少秒后弹出
        company-minimum-prefix-length 1     ; 至少几个字符后开始补全
        ))


;; 其他
;; Auto Pair Bracket, use autopair before, now in Emacs 24.4 and after, use electric-pair-mode instead.
(electric-pair-mode 1)
(setq electric-pair-pairs '(
			    (?\" . ?\")
			    (?\` . ?\`)
			    (?\( . ?\))
			    (?\{ . ?\})
			    ))


(provide 'init-completion)