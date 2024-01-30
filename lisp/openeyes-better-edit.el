;;; -*- lexical-binding: t -*-

;;; https://zhuanlan.zhihu.com/p/467681146

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 自动完成框架
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company-mode. company: complete-anything
;; 支持多backend.
(use-package company
  :ensure t
  ;; 等价于 (add-hook 'after-init-hook #'global-company-mode)
  :hook (after-init . global-company-mode)
  :config
  ;; setq 可以像这样连着设置多个变量的值
  (setq company-tooltip-align-annotations t      ; 注释贴右侧对齐
        company-tooltip-limit 10                 ; 菜单里可选项数量
        company-show-quick-access t              ; 显示编号（然后可以用 M-数字 快速选定某一项）
        company-idle-delay 0.0                   ; 延时多少秒后弹出
        company-minimum-prefix-length 1          ; 1个字符就开始补全
	company-global-modes '(not eshell-mode)  ; eshell-mode禁用company
        ))

;;; company的icon支持， 显示doc.
;; (use-package company-box
;;   :ensure t
;;   :if window-system
;;   :hook (company-mode . company-box-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 基于机器学习的自动补全.
;;; 需重启 Emacs，输入命令：M-x company-tabnine-install-binary，来安装 TabNine 的后台程序。之后就可以正常使用了。
;;; 但是总的来说，AI 插件会导致偶尔的高 CPU 占用.
;;; 如果电脑硬件性能不佳，建议尽量关闭后台训练功能，或者是直接使用传统补全插件就好
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package company-tabnine
;;   :ensure t
;;   :after company
;;   :init (add-to-list 'company-backends #'company-tabnine))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 格式化配置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(global-set-key (kbd "M-<RET>") 'editorconfig-format-buffer)


;; (use-package format-all
;;   :preface
;;   (defun ian/format-code ()
;;     "Auto-format whole buffer."
;;     (interactive)
;;     (if (derived-mode-p 'prolog-mode)
;;         (prolog-indent-buffer)
;;       (format-all-buffer)))
;;   :config
;;   (global-set-key (kbd "M-F") #'ian/format-code)
;;   (add-hook 'prog-mode-hook #'format-all-ensure-formatter))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 代码片段配置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :after company
  :config
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets"))
  ;; add company-yasnippet to company-backends
  (defun company-mode/backend-with-yas (backend)
    (if (and (listp backend) (member 'company-yasnippet backend))
	backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  ;; unbind <TAB> completion
  ;; (define-key yas-minor-mode-map [(tab)]        nil)
  ;; (define-key yas-minor-mode-map (kbd "TAB")    nil)
  ;; (define-key yas-minor-mode-map (kbd "<tab>")  nil)
  ;; ;; :bind
  ;; (:map yas-minor-mode-map ("S-<tab>" . yas-expand))
  )

;; 加载AndreaCrotti维护的snippets, 至于如何使用,有待挖掘.
(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; autoinsert
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun openeyes/yas-cmake-bp ()
  (interactive)
  (yas-expand-snippet (yas-lookup-snippet "cmake_minimum_required" 'cmake-mode)))

(defun openeyes/autoinsert-yas-expand()
  "Auto-insert自动插入新文件的内容作为模板来进行扩展."
  (yas-expand-snippet (buffer-string) (point-min) (point-max)))

(use-package autoinsert
  :init
  ;; 应该是插入前禁用提示
  (setq auto-insert-query nil)
  (auto-insert-mode 1)
  (setq auto-insert-directory (locate-user-emacs-file "templates"))
  (setq auto-insert-alist nil) ;; remove this like to restore defaults
  :hook (find-file . auto-insert)
  :config
  (add-to-list 'auto-insert-alist  '("CMakeLists\\.txt$" . [openeyes/yas-cmake-bp]))
  (define-auto-insert "\\.el$" ["elisp-skeleton.el" openeyes/autoinsert-yas-expand]))


;; Auto Pair Bracket, use autopair before, now in Emacs 24.4 and after, use electric-pair-mode instead.
(electric-pair-mode 1)
(setq electric-pair-pairs '(
			    (?" . ?")
			    (?` . ?`)
			    (?( . ?))
			    (?{ . ?})
			    ))


(provide 'openeyes-better-edit)
