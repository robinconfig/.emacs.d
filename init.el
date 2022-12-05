;;; init.el --- entry

;;; Commentary:
;;
;; 配置入口
;;

;;; Code:

;; 检查emacs版本, 如果太老,提示更新
(let ((minver "26.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "27.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; 将lisp文件夹添加到加载路径(path)中.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; measure startup time
(require 'init-benchmarking)
 
(require 'init-elpa)
(require 'init-basic)
 
;; 视觉相关配置
(require 'ui/init-ui-basic)
(require 'ui/init-themes)
(require 'ui/init-mode-line)
 
(require 'init-evil)
;; (require 'init-file-manage)
(require 'init-completion)
(require 'init-yasnippet)
(require 'init-format)

(require 'lang/init-lsp)
(require 'init-hint)
(require 'lang/init-golang)
(require 'lang/init-python)

(provide 'init)

;;; init.el ends here
