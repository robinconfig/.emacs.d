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
	       (set-face-attribute 'default nil :font "Fira Mono 16")
	       ;; Chinese Font
	       (dolist (charset '(kana han symbol cjk-misc bopomofo))
		 (set-fontset-font (frame-parameter nil 'font)
				   charset (font-spec :family "Noto Sans CJK SC" :size 16)))))


(use-package ace-window
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; https://github.com/ema2159/centaur-tabs
(use-package centaur-tabs
  :ensure t
  :config
  (setq centaur-tabs-set-modified-marker t ;; 文件变化显示
	centaur-tabs-height 32
	centaur-tabs-set-bar 'under
        centaur-tabs-show-count nil
        ;; centaur-tabs-label-fixed-length 15
        ;; centaur-tabs-gray-out-icons 'buffer
        x-underline-at-descent-line t
        centaur-tabs-left-edge-margin nil)
  (centaur-tabs-mode t)
  :hook
  (dashboard-mode . centaur-tabs-local-mode)
  ;; (dired-mode . centaur-tabs-local-mode) ;; dired-mode下禁用tab
  :bind
  (:map evil-normal-state-map
	("g t" . centaur-tabs-forward)
	("g T" . centaur-tabs-backward))
  ;; PgUp 与 PgDown (Emacs的键码分别对应 <prior> 及 <next>)
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward)
  )

(provide 'ui/bbt-ui-basic)
