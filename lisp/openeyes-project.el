;;; --- 工程管理组件配置 -*- lexical-binding: t -*-

;;(setq debug-on-error t)
(require 'bbt-config)

;; 项目列表、项目内文件跳转、 ag 、 make 等等
(use-package projectile
  :ensure t
  :init
  ;; 全局enable这个 minor mode
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map))
  :config
  ;; 把它的缓存挪到 ~/.emacs.d/.cache/ 文件夹下，让 gitignore 好做
  (setq projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory))
  (setq projectile-project-search-path openeyes/project-path))


(use-package counsel-projectile
  :ensure t
  :after (projectile)
  :init (counsel-projectile-mode))

;;| 快捷键      | 功能                     | 场景                                                                         |
;;|-------------+--------------------------+------------------------------------------------------------------------------|
;;| C-c C-p p   | 在历史项目中切换         | 打开 ~/Projects/elixir/ex_faxtu 项目的文件列表： C-c C-p p pro ex fa RET     |
;;| C-c C-p f   | 查找当前项目的文件       | 在上述项目里时， C-c C-p f test conn RET 打开 test/support/conn_case.ex 文件 |
;;| C-c C-p s s | 用 ag 查找项目文件的内容 | 查找所有 User 的出现位置： C-c C-p s s User 。Helm 可以再搭配 C-x C-s 把搜索结果保存起来 |


(provide 'openeyes-project)
