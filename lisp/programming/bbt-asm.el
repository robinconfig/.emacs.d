;; -*- lexical-binding: t -*-

;;(setq debug-on-error t)
;;(use-package masm-mode
;;  :ensure t)
(use-package x86-lookup
  :ensure t
  :config
  (setq  x86-lookup-pdf "~/Desktop/325462-sdm-vol-1-2abcd-3abcd-4.pdf")
  (global-set-key (kbd "C-h x") #'x86-lookup))

(use-package nasm-mode
  :ensure t
  :config
  (add-hook 'asm-mode-hook 'nasm-mode))


(provide 'programming/bbt-asm)
