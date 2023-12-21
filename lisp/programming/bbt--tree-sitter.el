;;; tree-sitter官网: https://tree-sitter.github.io/tree-sitter/
;;; 此文件配置参考以下网址:
;;; TreeSit API 详解[[https://manateelazycat.github.io/2023/09/02/treesit/]]
;;; https://manateelazycat.github.io/2023/09/02/treesit/
;;; Building tree-sitter languages for Emacs[[https://www.nathanfurnal.xyz/posts/building-tree-sitter-langs-emacs/]]

;;(setq debug-on-error t)

;;; treesit 是 Emacs 内部对 tree-sitter 的模块实现。
;;; 更多，请参考: https://manateelazycat.github.io/2023/09/02/treesit/

(require 'treesit)

(setq treesit-language-source-alist
      '((bash       . ("https://github.com/tree-sitter/tree-sitter-bash"))
	(c          . ("https://github.com/tree-sitter/tree-sitter-c"))
	(cpp        . ("https://github.com/tree-sitter/tree-sitter-cpp"))
	(css        . ("https://github.com/tree-sitter/tree-sitter-css"))
	(cmake      . ("https://github.com/uyha/tree-sitter-cmake"))
	(csharp     . ("https://github.com/tree-sitter/tree-sitter-c-sharp.git"))
	(dockerfile . ("https://github.com/camdencheek/tree-sitter-dockerfile"))
	(elisp      . ("https://github.com/Wilfred/tree-sitter-elisp"))
	(go         . ("https://github.com/tree-sitter/tree-sitter-go"))
	(gomod      . ("https://github.com/camdencheek/tree-sitter-go-mod.git"))
	(html       . ("https://github.com/tree-sitter/tree-sitter-html"))
	(java       . ("https://github.com/tree-sitter/tree-sitter-java.git"))
	(javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
	(json       . ("https://github.com/tree-sitter/tree-sitter-json"))
	(lua        . ("https://github.com/Azganoth/tree-sitter-lua"))
	(make       . ("https://github.com/alemuller/tree-sitter-make"))
	(markdown   . ("https://github.com/MDeiml/tree-sitter-markdown" nil "tree-sitter-markdown/src"))
	(ocaml      . ("https://github.com/tree-sitter/tree-sitter-ocaml" nil "ocaml/src"))
	(org        . ("https://github.com/milisims/tree-sitter-org"))
	(python     . ("https://github.com/tree-sitter/tree-sitter-python"))
	(php        . ("https://github.com/tree-sitter/tree-sitter-php"))
	(typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "typescript/src"))
	(tsx        . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "tsx/src"))
	(ruby       . ("https://github.com/tree-sitter/tree-sitter-ruby"))
	(rust       . ("https://github.com/tree-sitter/tree-sitter-rust"))
	(sql        . ("https://github.com/m-novikov/tree-sitter-sql"))
	(vue        . ("https://github.com/merico-dev/tree-sitter-vue"))
	(yaml       . ("https://github.com/ikatyang/tree-sitter-yaml"))
	(toml       . ("https://github.com/tree-sitter/tree-sitter-toml"))
	(zig        . ("https://github.com/GrayJack/tree-sitter-zig"))))

(add-to-list 'major-mode-remap-alist '(sh-mode         . bash-ts-mode))
(add-to-list 'major-mode-remap-alist '(c-mode          . c-ts-mode))
(add-to-list 'major-mode-remap-alist '(c++-mode        . c++-ts-mode))
(add-to-list 'major-mode-remap-alist '(c-or-c++-mode   . c-or-c++-ts-mode))
(add-to-list 'major-mode-remap-alist '(css-mode        . css-ts-mode))
(add-to-list 'major-mode-remap-alist '(js-mode         . js-ts-mode))
(add-to-list 'major-mode-remap-alist '(java-mode       . java-ts-mode))
(add-to-list 'major-mode-remap-alist '(js-json-mode    . json-ts-mode))
(add-to-list 'major-mode-remap-alist '(makefile-mode   . cmake-ts-mode))
(add-to-list 'major-mode-remap-alist '(python-mode     . python-ts-mode))
(add-to-list 'major-mode-remap-alist '(ruby-mode       . ruby-ts-mode))
(add-to-list 'major-mode-remap-alist '(rust-mode       . rust-ts-mode))
(add-to-list 'major-mode-remap-alist '(rustic-mode     . rust-ts-mode))
(add-to-list 'major-mode-remap-alist '(conf-toml-mode  . toml-ts-mode))

(setq treesit-font-lock-level 4)

(add-hook 'markdown-mode-hook #'(lambda () (treesit-parser-create 'markdown)))
(add-hook 'emacs-lisp-mode-hook #'(lambda () (treesit-parser-create 'elisp)))
(add-hook 'ielm-mode-hook #'(lambda () (treesit-parser-create 'elisp)))
(add-hook 'json-mode-hook #'(lambda () (treesit-parser-create 'json)))
(add-hook 'go-mode-hook #'(lambda () (treesit-parser-create 'go)))
(add-hook 'java-mode-hook #'(lambda () (treesit-parser-create 'java)))
(add-hook 'java-ts-mode-hook #'(lambda () (treesit-parser-create 'java)))
(add-hook 'php-mode-hook #'(lambda () (treesit-parser-create 'php)))
(add-hook 'php-ts-mode-hook #'(lambda () (treesit-parser-create 'php)))

(add-hook 'web-mode-hook #'(lambda ()
                             (let ((file-name (buffer-file-name)))
			       (when file-name
                                 (treesit-parser-create
                                  (pcase (file-name-extension file-name)
                                    ("vue" 'vue)
                                    ("html" 'html)
                                    ("php" 'php))))
			       )))




;; (use-package treesit-auto
;;   :ensure t
;;   :custom
;;   (treesit-auto-install 'prompt)
;;   :config
;;   (treesit-auto-add-to-auto-mode-alist 'all)
;;   (global-treesit-auto-mode))

(provide 'programming/bbt--tree-sitter)
