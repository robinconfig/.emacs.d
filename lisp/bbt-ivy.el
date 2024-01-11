;;; ivy/swiper/counsel配置，因为目前还不清楚这三个包起作用的范围是哪里，所以暂时放在这个文件里

;;(setq debug-on-error t)

(use-package counsel
  :after ivy
  :config (counsel-mode))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :hook (after-init . ivy-mode))

(use-package ivy-rich
  :after ivy
  :custom
  (ivy-virtual-abbreviate 'full
                          ivy-rich-switch-buffer-align-virtual-buffer t
                          ivy-rich-path-style 'abbrev)
  :config
  (defun ivy-rich-switch-buffer-icon (candidate)
    (with-current-buffer
	(get-buffer candidate)
      (let ((icon (all-the-icons-icon-for-mode major-mode)))
	(if (symbolp icon)
            (all-the-icons-icon-for-mode 'fundamental-mode)
          icon))))
  (setq ivy-rich-display-transformers-list
	'(ivy-switch-buffer
          (:columns
           ((ivy-rich-switch-buffer-icon (:width 2))
            (ivy-rich-candidate (:width 30))
            (ivy-rich-switch-buffer-size (:width 7))
            (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
            (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))
            (ivy-rich-switch-buffer-project (:width 15 :face success))
            (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))
           :predicate
           (lambda (cand) (get-buffer cand)))))
  )

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(provide 'bbt-ivy)
