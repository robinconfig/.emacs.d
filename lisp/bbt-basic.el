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



;; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(global-auto-revert-mode t)
;; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
(delete-selection-mode t)
(display-time-mode t)
(column-number-mode t)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)
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

(use-package command-log-mode
  :ensure t
  :init
  (command-log-mode))


(provide 'bbt-basic)
