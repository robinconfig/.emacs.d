
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

(cond ((eq system-type 'windows-nt)
       ;; Windows-specific code goes here
       (setq lsp-pyls-server-command "D:/ProgramFiles/Python/Scripts/pylsp.exe")
       )
      ((eq system-type 'gnu/linux)
       ;; Linux-specific code goes here
       (setq lsp-pyls-server-command "/home/robin/.local/bin/pylsp")
       )
      )


(provide 'programming/openeyes-python)
