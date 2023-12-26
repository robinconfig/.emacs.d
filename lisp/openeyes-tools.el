;;; -*- lexical-binding: t -*-
;;(setq debug-on-error t)

;; 统计命令(快捷键)使用频率
;; https://github.com/dacap/keyfreq
;; keyfreq-show 在buffer中显示结果
;;; keyfreq-html 将结果保存到网页

(use-package keyfreq
  :ensure t
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)
  ;;(setq keyfreq-excluded-commands
  ;;	'(self-insert-command
  ;;        forward-char
  ;;        backward-char
  ;;        previous-line
  ;;        next-line))
  )

(provide 'openeyes-tools)
