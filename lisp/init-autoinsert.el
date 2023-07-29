;;; init-autoinsert.el --- auto-insert配置           -*- lexical-binding: t; -*-

;; Copyright (C) 2023

;; Author:  <Robin@DESKTOP-RI8ASKM>
;; Keywords:

;;; Commentary:

;; 

;;; Code:

(require 'init-yasnippet)

(defun openeyes/yas-cmake-bp ()
  (interactive)
  (yas-expand-snippet (yas-lookup-snippet "cmake_minimum_required" 'cmake-mode)))


(defun openeyes/autoinsert-yas-expand()
  "Auto-insert自动插入新文件的内容作为模板来进行扩展."
  (yas-expand-snippet (buffer-string) (point-min) (point-max)))

(use-package autoinsert
  :init
  ;; 应该是插入前禁用提示
  (setq auto-insert-query nil)
  (auto-insert-mode 1)
  (setq auto-insert-directory (locate-user-emacs-file "templates"))
  (setq auto-insert-alist nil) ;; remove this like to restore defaults
  :hook (find-file . auto-insert)
  :config
  (add-to-list 'auto-insert-alist  '("CMakeLists\\.txt$" . [openeyes/yas-cmake-bp]))
  (define-auto-insert "\\.el$" ["elisp-skeleton.el" openeyes/autoinsert-yas-expand]))


(provide 'init-autoinsert)
;;; init-autoinsert.el ends here
