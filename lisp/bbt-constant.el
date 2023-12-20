;;; 常量定义

(defconst sys/win32p
  (eq system-type 'windows-nt)
  "Are we running on a WinTel System?")

(defconst sys/windows
	(memq system-type '(ms-dos windows-nt cygwin))
	"Are we running on a Windows System?")

(defconst sys/linuxp
  (eq system-type 'gnu/linux)
  "Are we running on a GNU/Linux System?")

(defconst sys/macp
  (eq system-type 'darwin)
  "Are we running on a MacOS?")


(provide 'bbt-constant)
