;;; Emacs配置入口

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

(require 'bbt-constant)
(require 'bbt-package)
(require 'bbt-basic)
(require 'bbt-config)
(require 'openeyes-encoding)
(require 'openeyes-keybinding)
(require 'openeyes-tools)
 
;; 视觉相关配置
(require 'ui/bbt-ui-basic)
(require 'ui/bbt-themes)
(require 'ui/bbt-font)
(require 'ui/bbt-mode-line)

(require 'bbt-evil)
(require 'bbt-ivy)
;; (require 'init-file-manage)
(require 'init-autoinsert)

(require 'init-minibuffer)

(require 'init-vcs)
(require 'bbt-formatter)

(require 'openeyes-project)

;; 特定Major Mode配置
;; (require 'lang/bbt--tree-sitter)
(require 'init-org)
(require 'programming/bbt-prog-basic)
(require 'init-completion)
(require 'init-yasnippet)
(require 'init-format)
(require 'programming/bbt-asm)
(require 'programming/bbt-lsp)
(require 'programming/bbt-sh)
(require 'programming/bbt-elisp)
(require 'programming/bbt-golang)
(require 'programming/bbt-python)
(require 'programming/bbt-rust)

(load custom-file :noerror)


(provide 'init)
