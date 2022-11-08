;;; init-themes.el --- 主题配置

;;; Commentary:

;;; Code:

(setq custom-safe-themes t)

;; enable doom theme
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t
 doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (if (display-graphic-p)
progn
 (doom-themes-neotree-config)
 (setq doom-themes-treemacs-theme "doom-colors")
 (doom-themes-treemacs-config)
 ))

  (doom-themes-org-config)
  )

(if (string-equal system-type "darwin")
    (use-package darkokai-theme
ensure t
config (load-theme 'darkokai t))
  (use-package doom-themes
    :ensure t
    :config (load-theme 'doom-nord))
  )

(provide 'init-themes)
;;; init-themes.el ends here