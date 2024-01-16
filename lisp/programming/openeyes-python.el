(require 'openeyes-utils)
;; TODO:: 自动格式化文件

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred))))  ; or lsp

(use-package lsp-mode
  :hook (
	 (python-mode . lsp-deferred)))


;;; (setq lsp-pyls-server-command "D:\ProgramFiles\Python\Scripts")
;;; (if (eq system-type 'darwin)
;;;     (message "mac")
;;;   )

(setq lsp-pyls-server-command
      (cond
       (openeyes/is-windows
	"D:/ProgramFiles/Python/Scripts/pylsp.exe")
       (openeyes/is-linux
	"/home/robin/.local/bin/pylsp")))



(provide 'programming/openeyes-python)
