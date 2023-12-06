(use-package all-the-icons
  :if (display-graphic-p))

(use-package dashboard
  :ensure t
  :init
  (dashboard-setup-startup-hook)
  :config
  (setq dashboard-set-footer nil))


(add-to-list 'after-make-frame-functions
	     (lambda (new-frame)
	       (select-frame new-frame)
	       ;; English Font
	       (set-face-attribute 'default nil :font "Fira Mono 12")
	       ;; Chinese Font
	       (dolist (charset '(kana han symbol cjk-misc bopomofo))
		 (set-fontset-font (frame-parameter nil 'font)
				   charset (font-spec :family "Noto Sans CJK SC" :size 16)))))


(use-package ace-window
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(provide 'ui/bbt-ui-basic)
