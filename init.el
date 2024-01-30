;;; Emacs配置入口

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)

;; 检查emacs版本, 如果太老,提示更新
(let ((minver "26.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "27.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))


;; 设置自定义配置文件
;;(if (file-exists-p "~/.emacs.d/emacs-custom.el") nil
;;  (write-region "" nil "~/.emacs.d/emacs-custom.el"))
(setq custom-file (concat user-emacs-directory "custom.el"))


;; 将lisp文件夹添加到加载路径(path)中.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; measure startup time
;; (require 'init-benchmarking)

(require 'openeyes-utils)
(require 'bbt-package)
(require 'openeyes-basic)
(require 'bbt-config)
(require 'openeyes-encoding)
(require 'openeyes-keybinding)
(require 'openeyes-tools)

(require 'bbt-evil)
(require 'init-vcs)

;; 视觉相关配置
(require 'ui/bbt-ui-basic)
(require 'ui/bbt-themes)
(require 'ui/bbt-font)
(require 'ui/bbt-mode-line)

(require 'bbt-ivy)
(require 'init-minibuffer)

(require 'openeyes-project)
(require 'openeyes-better-edit)

;; 特定Major Mode配置
;; (require 'lang/bbt--tree-sitter)
(require 'init-org)
(require 'programming/bbt-prog-basic)
(require 'programming/bbt-asm)
(require 'programming/bbt-lsp)
(require 'programming/bbt-sh)
(require 'programming/bbt-elisp)
(require 'programming/bbt-golang)
(require 'programming/openeyes-python)
(require 'programming/openeyes-rust)
(require 'programming/openeyes-web)

(load custom-file :noerror)


(provide 'init)
