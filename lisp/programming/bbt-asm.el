;; -*- lexical-binding: t -*-

;;(setq debug-on-error t)

(use-package masm-mode
  :straight '(masm-mode
	      :type git
	      :host github
	      :repo "YiGeeker/masm-mode")
  :config
  (add-hook 'asm-mode-hook 'masm-mode)
    (setq masm-program-win64 nil)
    (setq VC_TOOLS_DIR "D:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/MSVC/14.39.33519/")
    (setq WIN_KITS_DIR "D:/Windows Kits/10/Lib/10.0.22621.0/")

    (setq masm-win32-executable-path (concat VC_TOOLS_DIR "bin/Hostx86/x86"))
    (setq masm-win32-include-path (list (concat VC_TOOLS_DIR "include")))
    (setq masm-win32-library-path (list (concat WIN_KITS_DIR "um/x86") (concat WIN_KITS_DIR "ucrt/x86") (concat VC_TOOLS_DIR "lib/x86")))
    ;; (setq masm-win32-executable-path "D:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/MSVC/14.39.33519/bin/Hostx86/x86")
    ;; (setq masm-win32-include-path (list "D:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/MSVC/14.39.33519/include"))
    ;; (setq masm-win32-library-path (list "D:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/MSVC/14.39.33519/lib/x86"))

    ;; (setq masm-win64-compile-args '("/link" "/subsystem:console" "/entry:main"))
    (setq masm-win64-executable-path (concat VC_TOOLS_DIR "bin/Hostx64/x64"))
    (setq masm-win64-include-path (list (concat VC_TOOLS_DIR "include")))
    (setq masm-win64-library-path (list (concat WIN_KITS_DIR "um/x64") (concat WIN_KITS_DIR "ucrt/x64") (concat VC_TOOLS_DIR "lib/x64")))
    )

;; (use-package x86-lookup
;;   :ensure t
;;   :config
;;   (setq  x86-lookup-pdf "~/Desktop/325462-sdm-vol-1-2abcd-3abcd-4.pdf")
;;   (global-set-key (kbd "C-h x") #'x86-lookup))

;; (use-package nasm-mode
;;   :ensure t
;;   :config
;;   (add-hook 'asm-mode-hook 'nasm-mode))


(provide 'programming/bbt-asm)
