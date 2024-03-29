(require 'openeyes-utils)

(use-package go-mode
  :config
  (progn
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)
    ))

;; 使用 exec-path-from-shell 让 Emacs 读取系统的环境变量，不然 Emacs 可能找不到你安装的 go。
(when (not openeyes/is-windows)
  (use-package exec-path-from-shell
    :straight t
    :config
    (with-eval-after-load "go-mode"
      (with-eval-after-load "exec-path-from-shell"
	(exec-path-from-shell-copy-envs '("GOPATH" "GO111MODULE" "GOPROXY"))))
    ))

(use-package lsp-mode
  :hook (
	 (go-mode . lsp-deferred)))


(use-package company-go
  :init
  (progn
    (setq company-go-show-annotation t)
    (setq company-tooltip-limit 20)                      ; bigger popup window
    (add-hook 'go-mode-hook 
              (lambda ()
                (set (make-local-variable 'company-backends) '(company-go))
                (company-mode)))
    )
  )


(provide 'programming/bbt-golang)
