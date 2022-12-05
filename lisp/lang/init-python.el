(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred))))  ; or lsp

;;; (setq lsp-pyls-server-command "D:\ProgramFiles\Python\Scripts")
;;; (if (eq system-type 'darwin)
;;;     (message "mac")
;;;   )


(provide 'lang/init-python)
;;; init-python.el ends here
