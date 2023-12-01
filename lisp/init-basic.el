;;; emacs基础配置

;; 安装并配置use-package包
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
;; (tool-bar-mode -1)
;; (menu-bar-mode -1)
(global-display-line-numbers-mode t)
;; (global-linum-mode 1) ;; 始终显示行号
(message "Hello, Kola!")
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

;; 组合按键提示
;; 很奇怪， 没有配这个的时候就有组合按键的提示，???...
;;(use-package which-key
;;  :delight
;;  :config
;;  (which-key-mode))


(provide 'init-basic)
