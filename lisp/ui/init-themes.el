;;; init-themes.el --- 主题配置

;;; Commentary:

;;; Code:

;; ;; 使用doom-theme
;; (setq custom-safe-themes t)

;; ;; enable doom theme
;; (use-package doom-themes
;;   :config
;;   ;; Global settings (defaults)
;;   (setq doom-themes-enable-bold t
;; 	doom-themes-enable-italic t)
;;   (doom-themes-visual-bell-config)
;;   (if (display-graphic-p)
;;       (progn
;; 	(doom-themes-neotree-config)
;; 	(setq doom-themes-treemacs-theme "doom-colors")
;; 	(doom-themes-treemacs-config)))

;;   (doom-themes-org-config))

;; (if (string-equal system-type "darwin")
;;     (use-package darkokai-theme
;;       :ensure t
;;       :config (load-theme 'darkokai t))
;;   (use-package doom-themes
;;     :ensure t
;;     :config (load-theme 'doom-nord))
;;   )

;; 使用atom-one-dark主题
(use-package atom-one-dark-theme
  :ensure t
  :config
  (load-theme 'atom-one-dark t))


(provide 'ui/init-themes)
;;; init-themes.el ends here
