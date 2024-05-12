;; -*- lexical-binding: t -*-

;;(setq debug-on-error t)

(use-package masm-mode
  :straight '(masm-mode
	      :type git
	      :host github
	      :repo "YiGeeker/masm-mode")
  :config
  (add-hook 'asm-mode-hook 'masm-mode)
    (setq masm-program-win64 t)
    (setq masm-win32-executable-path "D:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/MSVC/14.39.33519/bin/Hostx86/x86")
    (setq masm-win32-include-path (list "D:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/MSVC/14.39.33519/include"))
    (setq masm-win32-library-path (list "D:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/MSVC/14.39.33519/lib/x86"))

    (setq masm-win64-executable-path "D:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/MSVC/14.39.33519/bin/Hostx64/x64")
    ;; (setq masm-win64-compile-args '("/link" "/subsystem:console" "/entry:main"))
    (setq masm-win64-include-path (list "D:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/MSVC/14.39.33519/include"))
    (setq masm-win64-library-path (list "D:/Windows Kits/10/Lib/10.0.22621.0/ucrt/x64" "D:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/MSVC/14.39.33519/lib/x64" "D:/Windows Kits/10/Lib/10.0.22621.0/um/x64"))
    ;; (setq MASM_HOME "D:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/MSVC/14.39.33519/")
    ;; (setq masm-win32-executable-path (concat MASM_HOME "bin/Hostx86/x86"))
    ;; (setq masm-win32-include-path (list (concat MASM_HOME "include")))
    ;; (setq masm-win32-library-path (list (concat MASM_HOME "lib/x86")))
    ;; (setq masm-win64-executable-path (concat MASM_HOME "bin/Hostx64/x64"))
    ;; (setq masm-win64-include-path (list (concat MASM_HOME "include")))
    ;; (setq masm-win64-library-path (list "D:/Windows Kits/10/Lib/10.0.22621.0/ucrt/x64"))
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
