;;; --- 主题配置
;; (setq custom-safe-themes t)

(defun oe/use-doom-themes ()
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


(defun oe/use-atom-one-themes ()
  ;; 使用atom-one-dark主题
  (use-package atom-one-dark-theme
    :ensure t
    :config
    (load-theme 'atom-one-dark t)))

(defun oe/use-modus-themes ()
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

(defun oe/use-vscode-theme ()
  (use-package vscode-dark-plus-theme
    :ensure t
    :config
    (load-theme 'vscode-dark-plus t)))

(defun oe/use-sanityinc-tomorrow-theme ()
  (use-package color-theme-sanityinc-tomorrow
    :ensure t
    :config
    (if (eq bbt-theme-style 'dark)
	(load-theme 'color-theme-sanityinc-tomorrow-bright)
      (load-theme 'color-theme-sanityinc-tomorrow-day))))

(defun oe/use-nord-theme ()
  (use-package nord-theme
    :ensure t
    :config
    (load-theme 'nord t)))


(defun oe/use-gruvbox-theme ()
  (use-package gruvbox-theme
    :ensure t
    :config
    (if (eq bbt-theme-style 'dark)
	(load-theme 'gruvbox-dark-hard)
      (load-theme 'gruvbox-light-hard))))

(defun oe/use-solarized-theme ()
  (use-package solarized-theme
    :ensure t
    :config
    (load-theme
     (pcase bbt-theme-style
       ('dark 'solarized-dark)
       ('light 'solarized-light)
       ('white 'solarized-selenized-white)) t)))

(defun oe/use-ef-themes ()
  (use-package ef-themes
    :ensure t
    :config
    (setq ef-themes-to-toggle '(ef-summer ef-winter))
    ;; Disable all other themes to avoid awkward blending:
    (mapc #'disable-theme custom-enabled-themes)
    (ef-themes-load-random)
    (define-key global-map (kbd "<f5>") #'ef-themes-select-light)

    ;; Load the theme of choice:
    ;; (load-theme 'ef-summer :no-confirm)

    ;; OR use this to load the theme which also calls `ef-themes-post-load-hook':
    ;; (ef-themes-select 'ef-summer)

    ;; The themes we provide are recorded in the `ef-themes-dark-themes', `ef-themes-light-themes'.
    ))

(defun bbt/load-theme (_args)
  (interactive "P")
  (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
  (pcase bbt-theme
    ('doom-themes
     (oe/use-doom-themes))
    ('modus-themes
     (oe/use-modus-themes))
    ('atom-one-themes
     (oe/use-atom-one-themes))
    ('vscode
     (oe/use-vscode-theme))
    ('nord
     (oe/use-nord-theme))
    ('gruvbox
     (oe/use-gruvbox-theme))
    ('solarized
     (oe/use-solarized-theme))
    ('ef-themes
     (oe/use-ef-themes))
    ('sanityinc-tomorrow
     (oe/use-sanityinc-tomorrow-theme))))

(bbt/load-theme ())

(provide 'ui/bbt-themes)
