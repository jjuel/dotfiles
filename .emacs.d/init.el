;;; Package --- Summary
;;; Commentary:
(require 'package)

;;; Code:
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)

;; Set up Use-Package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Misc Settings
(electric-pair-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-linum-mode t)
(setq linum-format "%2d ")
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-screen t)

;; Font Settings
(set-face-attribute 'default nil
		    :family "Operator Mono"
		    :height (* 14 10))

;; -------- ;;
;; Packages
;; -------- ;;

;; Magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

;; LSP
(use-package lsp-mode :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)

;; Dap
(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

;; Company
(use-package company
  :ensure t
  :defer t
  :init (global-company-mode))
  
;; Ivy
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d%d) ")
  (global-set-key (kbd "C-c C-r") 'ivy-resume))

;; Swiper
(use-package swiper
  :ensure t
  :config
  (global-set-key "\C-s" 'swiper))

;; Projectile
(use-package projectile :ensure t)

;; --------- ;;
;; Languages
;; --------- ;;

;; Java
(use-package lsp-java
  :ensure t
  :after lsp
  :config
  (add-hook 'java-mode-hook 'lsp)
  (add-hook 'java-mode-hook #'lsp-java-boot-lens-mode))

;; Rust
(use-package rust-mode
  :ensure t
  :hook (rust-mode . lsp)
  :config
  (setq rust-format-on-save t))

(setq custom-file "~/.emacs.d/custom.el")

(provide 'init)
;;; init.el ends here

(put 'erase-buffer 'disabled nil)
