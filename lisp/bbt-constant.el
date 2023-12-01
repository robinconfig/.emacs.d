;;; 常量定义

(defconst *is-mac* (eq system-type 'darwin))
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-windows* (memq system-type '(ms-dos windows-nt cygwin)))

(provide 'bbt-constant)
