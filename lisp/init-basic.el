;;; init-basic.el --- emacs基础配置

;;; Commentary:
;;
;; emacs基础配置
;;

;;; Code:

;; 安装并配置use-package package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(setq warning-minimum-level :emergency)


(set-frame-font "Menlo 16" nil t)

(display-time-mode 1)
(column-number-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(global-linum-mode 1) ;;始终显示行号
;;  (toggle-frame-fullscreen)

;; Encoding and Envs
(prefer-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")

;; 设置自定义配置文件
(if (file-exists-p "~/.emacs.d/emacs-custom.el") nil
  (write-region "" nil "~/.emacs.d/emacs-custom.el"))
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

;; package自动更新配置
(use-package auto-package-update
  :config
  (auto-package-update-maybe)
  (setq auto-package-update-delete-old-versions t)
  ;; 隐藏更新结果
  ;;(setq auto-package-update-hide-results t)
  ;; 配置某些禁止自动更新的包
  ;; (setq auto-package-update-excluded-packages '(magit ivy))
)

(provide 'init-basic)
;;; init-basic.el ends here
