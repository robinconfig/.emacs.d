(require 'openeyes-utils)

(use-package go-mode
  :config
  (progn
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)
    ))

;; 如果你使用的是 MacOS 系统，那么需要使用 exec-path-from-shell 让 Emacs 读取系统的环境变量，不然 Emacs 可能找不到你安装的 go。
(when openeyes/is-macOS
  (use-package exec-path-from-shell
    :straight t
    :config
    (setq exec-path-from-shell-arguments '("-l"))
    (add-hook 'after-init-hook #'exec-path-from-shell-initialize)
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
