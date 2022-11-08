;; 快捷键配置(<s)
(add-hook 'org-mode-hook
;; enable traditional < s tab keybinding
(lambda ()
(require 'org-tempo)))

;; 配置Org-mode要支持哪些语言的code blocks
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t)
   (python . t)
   (js . t)
   (css .t )))

;; Code Blocks Behaviors
;; Org-mode中的code block有它们独特的行为规范,例如,缩进的空格数量,是否能使用shift+方向键选中文本,是否使用编程语言所属mode的原生tab行为以及语法高亮等等. 对于这些行为规范,我们也能做出改变.
 ;; Let's have pretty source code blocks
(setq org-edit-src-content-indentation 0
  org-src-tab-acts-natively t
  org-src-fontify-natively t
  org-confirm-babel-evaluate nil
  org-support-shift-select 'always)

(use-package org-bullets
  :config
  (progn
    (setq org-bullets-bullet-list '("☯" "✿" "✚" "◉" "❀"))
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
    ))
(setq org-src-fontify-natively t)

(use-package valign
  :config
  (progn
    (add-hook 'org-mode-hook #'valign-mode)
    )
  )

;; Tangle Org files when we save them
(defun tangle-on-save-org-mode-file()
  (when (string= (message "%s" major-mode) "org-mode")
    (org-babel-tangle)))

(add-hook 'after-save-hook 'tangle-on-save-org-mode-file)

;; Enable the auto-revert mode globally. This is quite useful when you have 
;; multiple buffers opened that Org-mode can update after tangling.
;; All the buffers will be updated with what changed on the disk.
(global-auto-revert-mode)  

;; Add Org files to the agenda when we save them
(defun to-agenda-on-save-org-mode-file()
  (when (string= (message "%s" major-mode) "org-mode")
    (org-agenda-file-to-front)))

(add-hook 'after-save-hook 'to-agenda-on-save-org-mode-file)

;; 两个问题: 1. imgs文件夹必须先存在; 2. 没有判断是否是mac系统
(defun my-org-screenshot (basename)
  "Take a screenshot into a time stamped unique-named file in the same directory as the org-buffer and insert a link to this file."
  (interactive "sScreenshot name: ")
  (if (equal basename "")
	  (setq basename (format-time-string "%Y%m%d_%H%M%S")))
  (setq filename
	  (concat (file-name-directory (buffer-file-name))
		  "imgs/"
		  (file-name-base (buffer-file-name))
		  "_"
		  basename
		  ".png"))
  (call-process "screencapture" nil nil nil "-s" filename)
  (insert "#+CAPTION:")
  (insert basename)
  (insert "\n")
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images))

(provide 'init-org)