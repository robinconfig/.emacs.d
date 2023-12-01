(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (after-init . ivy-mode))

;; 组合按键提示
(use-package which-key
  :delight
  :config
  (which-key-mode))


(provide 'init-minibuffer)
