;; 中文输入法配置
(use-package pyim
  :ensure t
  :demand t
  :config
  ;; 激活 basedict 拼音词库
  (use-package pyim-basedict
    :ensure t
    :config (pyim-basedict-enable))

  (setq default-input-method "pyim")
  (pyim-default-scheme 'quanpin)

  ;; 选词框跟随光标，使用posframe来绘制选词框
  (use-package posframe
    :ensure t
    :config
      (setq pyim-page-tooltip 'posframe))

  ;;候选词数量设置
  (setq pyim-page-length 5)
  ;;开启拼音搜索
  (pyim-isearch-mode 1)
  ;;绑定快捷键
  (global-set-key (kbd "C-\\") 'toggle-input-method))


(provide 'init-chinese)