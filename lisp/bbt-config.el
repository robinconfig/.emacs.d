;;; 配置文件
(require 'bbt-constant)

(setq user-full-name "RobinVanYang")
(setq user-mail-address "thehappyone@163.com")
(defvar user-website "robinvanyang.github.io"
  "用户个人网站")


(defgroup bbt ()
  "Short for berry black tea, my personal Emacs Config."
  :prefix "bbt-"
  :group 'applications)

(defcustom bbt-theme 'ef-themes
  "主题配置"
  :tag "Theme"
  :group 'bbt
  :type '(choice
	  (const :tag "modus-themes" modus-themes)
	  (const :tag "doom-themes" doom-themes)
	  (const :tag "atom-one-themes" atom-one-themes)
	  (const :tag "VSCode Dark" vscode)
	  (const :tag "Nord" nord)
	  (const :tag "Gruvbox" gruvbox)
	  (const :tag "Solarized" solarized)
	  (const :tag "ef themes" ef-themes)
	  (const :tag "Sanityinc Tomorrow" sanityinc-tomorrow)))


(defcustom bbt-theme-style 'white
  "深浅主题配置"
  :tag "Theme Style"
  :group 'bbt
  :type '(choice
	  (const :tag "Light" light)
	  (const :tag "Dark" dark)
	  (const :tag "White" white)))

(defconst openeyes/project-path (if sys/windows '("E:/workspace/.config/.emacs.d/" "E:/workspace/code/python" "E:/workspace/code/golang") '("~/workspace/code")))

(provide 'bbt-config)
