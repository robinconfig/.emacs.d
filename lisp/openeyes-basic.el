;;; emacs基础配置

(require 'openeyes-utils)

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

(use-package command-log-mode
  :ensure t
  :init
  (command-log-mode))

;;; config emacs to run external command by recognize system path.
(when openeyes/is-macOS
  (use-package exec-path-from-shell
    :straight t
    :config
    (setq exec-path-from-shell-arguments '("-l"))
    (add-hook 'after-init-hook #'exec-path-from-shell-initialize)))


(provide 'openeyes-basic)
