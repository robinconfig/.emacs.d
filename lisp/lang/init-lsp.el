(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp-deferred)
	 (go-mode . lsp-deferred)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

;; optionally
(use-package lsp-ui
  :ensure t
  :require lsp-mode flycheck
  :after (lsp-mode)
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; The path to lsp-mode needs to be added to load-path as well as the
;; path to the `clients' subdirectory.
(add-to-list 'load-path (expand-file-name "lib/lsp-mode" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lib/lsp-mode/clients" user-emacs-directory))

;; optionally if you want to use debugger
;; https://github.com/emacs-lsp/dap-mode
;; What is dap-mode:
;; Emacs client/library for Debug Adapter Protocol is a wire protocol for communication between client and Debug Server.
;; It’s similar to the LSP but provides integration with debug server.
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(setq lsp-go-analyses '((shadow . t)
                        (simplifycompositelit . :json-false)))

(provide 'lang/init-lsp)
