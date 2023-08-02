;;; INIT-VCS --- 版本控制配置文件 -*- lexical-binding: t -*-
;;
;; Author: RobinVanYang <thehappyone@163.com>
;; Copyright © 2023 RobinVanYang. all rights reserved.
;; URL: robinvanyang.github.io
;; Created at:  3 八月 2023
;;
;;; Commentary:
;;
;; git svn等有关版本管理的配置
;;
;;; Code:

;;(setq debug-on-error t)

;; 据说很好用,有待探究
(use-package magit)

;; 侧边栏显示改动状态
(use-package git-gutter
  :ensure t
  ;; :hook
  ;; (prog-mode . git-gutter-mode)
  :config
  (global-git-gutter-mode t)
  (setq git-gutter:update-interval 0.02))


(provide 'init-vcs)
;;; init-vcs.el ends here
