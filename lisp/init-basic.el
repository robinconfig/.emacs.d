;;; init-basic.el --- emacs基础配置
;;; Commentary:

;;; Code:

(set-frame-font "Menlo 16" nil t)

(display-time-mode 1)
(column-number-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
;;  (toggle-frame-fullscreen)

;; Encoding and Envs
(prefer-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")

(if (file-exists-p "~/.emacs.d/emacs-custom.el") nil
  (write-region "" nil "~/.emacs.d/emacs-custom.el"))
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(provide 'init-basic)
;;; init-basic.el ends here
