;;; --- 主题配置
;; (setq custom-safe-themes t)
(require 'bbt-custom)

(defun use-doom-themes ()
  ;; 使用doom-theme
  (use-package doom-themes
    :ensure t
    :config
    ;; Global settings (defaults)
    (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
          doom-themes-enable-italic t) ; if nil, italics is universally disabled
    (load-theme 'doom-one t)
    ;; (load-theme 'doom-one-light t)

    ;; Enable flashing mode-line on errors
    (doom-themes-visual-bell-config)
    ;; Enable custom neotree theme (all-the-icons must be installed!)
    ;; (doom-themes-neotree-config)
    ;; or for treemacs users
    (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
    (doom-themes-treemacs-config)
    ;; Corrects (and improves) org-mode's native fontification.
    (doom-themes-org-config)))


(defun use-atom-one-themes ()
  ;; 使用atom-one-dark主题
  (use-package atom-one-dark-theme
    :ensure t
    :config
    (load-theme 'atom-one-dark t)))

(defun use-modus-themes ()
  ;;; 使用modus主题
  (use-package modus-themes
    :ensure t
    :init
    ;; Add all your customizations prior to loading the themes
    (setq modus-themes-italic-constructs t
          modus-themes-bold-constructs nil)

    :config
    (if (eq bbt-theme-style 'dark)
	;; 加载深色主题
	(load-theme 'modus-vivendi)
      ;; 加载浅色主题
      (load-theme 'modus-operandi-tinted))))

(defun use-vscode-theme ()
  (use-package vscode-dark-plus-theme
    :ensure t
    :config
    (load-theme 'vscode-dark-plus t)))

(defun bbt/load-theme (_args)
  (interactive "P")
  (pcase bbt-theme
    ('doom-themes
     (use-doom-themes))
    ('modus-themes
     (use-modus-themes))
    ('atom-one-themes
     (use-atom-one-themes))
    ('vscode
     (use-vscode-theme))))

(bbt/load-theme ())

(provide 'ui/bbt-themes)
