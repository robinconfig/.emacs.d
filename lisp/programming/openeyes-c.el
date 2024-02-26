;;; --- c/c++ config -*- lexical-binding: t -*-

;;(setq debug-on-error t)

(use-package lsp-mode
  :hook (
	 (c-mode . lsp-deferred)
	 (c++-mode . lsp-deferred)))

(use-package cmake-mode
  :ensure t)

(use-package cc-mode
  :bind (:map c-mode-base-map
	      ("C-c c" . compile))
  :hook (c-mode-common . (lambda () (c-set-style "stroustrup")))
  :init (setq-default c-basic-offset 4)
  )

(provide 'programming/openeyes-c)
