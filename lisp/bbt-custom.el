;; custumize

(setq user-full-name "RobinVanYang")
(setq user-mail-address "thehappyone@163.com")
(setq user-website "robinvanyang.github.io")


(defgroup bbt ()
  "Short for berry black tea, my personal Emacs Config."
  :prefix "bbt-"
  :group 'applications)

(defcustom bbt-theme 'modus-themes
  "主题配置"
  :tag "Theme"
  :group 'bbt
  :type '(choice
	  (const :tag "modus-themes" modus-themes)
	  (const :tag "doom-themes" doom-themes)
	  (const :tag "atom-one-themes" atom-one-themes)
	  (const :tag "VSCode Dark" vscode)))


(defcustom bbt-theme-style 'light
  "深浅主题配置"
  :tag "Theme Style"
  :group 'bbt
  :type '(choice
	  (const :tag "Light" light)
	  (const :tag "Dark" dark)))

(provide 'bbt-custom)
