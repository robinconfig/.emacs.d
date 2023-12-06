;;; 字体配置
;;(setq debug-on-error t)

(use-package cnfonts
  :ensure t
  :config
  (cnfonts-mode 1)
  ;; 添加两个字号增大缩小的快捷键
  ;; todo:: 不起作用
  (define-key cnfonts-mode-map (kbd "C--") #'cnfonts-decrease-fontsize)
  (define-key cnfonts-mode-map (kbd "C-=") #'cnfonts-increase-fontsize))

(defvar cabins-os-win (memq system-type '(ms-dos windows-nt cygwin)))
(defvar cabins-os-mac (eq system-type 'darwin))
(defvar cabins-fonts-default '("Courier Prime" "Jetbrains Mono" "Roboto Mono" "Cascadia Code PL" "Menlo" "Consolas"))
(defvar cabins-fonts-unicode '("Segoe UI Symbol" "Symbola" "Symbol"))
(defvar cabins-fonts-emoji '("Apple Color Emoji" "Segoe UI Emoji" "Noto Color Emoji" "Noto Emoji"))
(defvar cabins-fonts-cjk '("KaiTi" "STKaiTi" "WenQuanYi Micro Hei"))

;;;###autoload
(defun cabins-find-font (custom-fonts default-fonts)
  "Get the first installed font from CUSTOM-FONTS and DEFAULT-FONTS."

  (catch 'font
    (dolist (f (append custom-fonts default-fonts))
      (when (find-font (font-spec :family f))
	(throw 'font f)))))

;;;###autoload
(defun cabins-font-setup (&rest args)
  "Setup fonts from ARGS, The accepted args are :default :unicode :emoji :cjk."

  (interactive)
  (when (display-graphic-p)
    (let ((f-def (cabins-find-font (plist-get args :default) cabins-fonts-default))
	  (f-uni (cabins-find-font (plist-get args :unicode) cabins-fonts-unicode))
	  (f-emo (cabins-find-font (plist-get args :emoji) cabins-fonts-emoji))
	  (f-cjk (cabins-find-font (plist-get args :cjk) cabins-fonts-cjk)))
      (set-face-attribute 'default nil :family f-def)
      (setq face-font-rescale-alist `((,f-cjk . 1.2)))
      (dolist (pair `((unicode  . ,f-uni)
		      (emoji    . ,f-emo)
		      (kana     . ,f-cjk)
		      (han      . ,f-cjk)
		      (bopomofo . ,f-cjk)
		      (cjk-misc . ,f-cjk)))
	(set-fontset-font t (car pair) (font-spec :family (cdr pair)) nil 'prepend)))))

;; (add-hook 'after-init-hook #'cabins-font-setup)
;; (when (daemonp)
;;   (add-hook 'after-make-frame-functions
;; 	    (lambda (frame)
;; 	      (with-selected-frame frame (cabins-font-setup)))))

(provide 'ui/bbt-font)
