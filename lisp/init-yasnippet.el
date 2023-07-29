(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :config
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets")))

;; 加载AndreaCrotti维护的snippets, 至于如何使用,有待挖掘.
;;(use-package yasnippet-snippets
;;  :ensure t)

(provide 'init-yasnippet)
