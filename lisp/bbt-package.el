;;; 配置package的repo

(require 'package)

;; 配置镜像
(cond
 ;; 官方源
 ((string= package-mirror "official")
  (progn
    (message "mirror is official")
    (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
    (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/packages/"))
    (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))))
 ;; 清华源
 ((string= package-mirror "tuna")
  (progn
    (message "mirror is tsinghua")
    (setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			     ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
			     ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			     ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/stable-melpa/")))))
 ;; 中科大源
 ((string= package-mirror "ustc")
  (progn
    (message "mirror is ustc")
    (setq package-archives '(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
			     ("nongnu" . "https://mirrors.ustc.edu.cn/elpa/nongnu/")
			     ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
			     ("melpa-stable" . "https://mirrors.ustc.edu.cn/elpa/stable-melpa/"))))))

;; 安装straight包管理器
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; 安装并配置use-package包
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(setq warning-minimum-level :emergency)

;; package自动更新配置
(use-package auto-package-update
  :config
  (auto-package-update-maybe)
  (setq auto-package-update-delete-old-versions t)
  ;; 隐藏更新结果
  ;;(setq auto-package-update-hide-results t)
  ;; 配置某些禁止自动更新的包
  ;; (setq auto-package-update-excluded-packages '(magit ivy))
  )

;; 可以单独或者和user-package结合来配置minor mode包在modeline上的显示.
(use-package diminish :ensure t)


(provide 'bbt-package)
