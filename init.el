;;; Emacs配置入口

;; 检查emacs版本, 如果太老,提示更新
(let ((minver "26.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "27.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; 将lisp文件夹添加到加载路径(path)中.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; measure startup time
;; (require 'init-benchmarking)

(require 'bbt-elpa)
(require 'bbt-basic)
(require 'bbt-custom)
 
;; 视觉相关配置
(require 'ui/bbt-ui-basic)
(require 'ui/bbt-themes)
(require 'ui/bbt-font)
(require 'ui/bbt-mode-line)

(require 'bbt-ivy)
(require 'bbt-evil)
;; (require 'init-file-manage)
(require 'init-completion)
(require 'init-yasnippet)
(require 'init-format)
(require 'init-autoinsert)

(require 'init-minibuffer)

(require 'lang/init-lsp)
(require 'init-hint)
(require 'init-vcs)
(require 'bbt-formatter)

;; 特定Major Mode配置
(require 'bbt-programming)
(require 'init-org)
(require 'init-elisp)
(require 'lang/init-golang)
(require 'lang/init-python)
(require 'lang/bbt-rust)

(provide 'init)
