(use-package yasnippet
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
  (yas-global-mode 1))

(defun nega/yas-cmake-bp ()
  (interactive)
  (yas-expand-snippet (yas-lookup-snippet "cmake_minimum_required" 'cmake-mode)))

(use-package autoinsert
  :config
  (setq auto-insert-query nil)
  (auto-insert-mode 1)
  (add-hook 'find-file-hook 'auto-insert)
  (setq auto-insert-alist nil) ;; remove this like to restore defaults
  (add-to-list 'auto-insert-alist  '("CMakeLists\\.txt$" . [nega/yas-cmake-bp])))

(use-package yasnippet-snippets
  :ensure t)

(provide 'init-yasnippet)
