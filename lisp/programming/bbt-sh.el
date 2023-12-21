;; -*- lexical-binding: t -*-
;;(setq debug-on-error t)

;; auto completion

;; error linting
;; flycheck识别到是shell脚本之后会默认调用shellcheck来完成语法静态分析
;; 各平台如何安装shellcheck,请查阅shellcheck文档
(use-package flycheck
  :ensure t
  :hook (sh-mode . flycheck-mode))

;; code snippets

;; code navigation

;; unit test

;; debug

(provide 'programming/bbt-sh)
