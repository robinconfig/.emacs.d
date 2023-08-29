(use-package all-the-icons
  :if (display-graphic-p))


(add-to-list 'after-make-frame-functions
	     (lambda (new-frame)
	       (select-frame new-frame)
		;; English Font
		(set-face-attribute 'default nil :font "Fira Mono 12")
		;; Chinese Font
		(dolist (charset '(kana han symbol cjk-misc bopomofo))
		  (set-fontset-font (frame-parameter nil 'font)
				    charset (font-spec :family "Noto Sans CJK SC" :size 16)))))


(provide 'ui/init-ui-basic)
