;;; Package --- Summary
;;; Commentary:
(require 'package)

;;; Code:
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(package-initialize)

;; Evil Mode
(require 'evil)
(evil-mode 1)

;; Themes
;; (require 'monokai-theme)
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme `gruvbox t)
;; (load-theme 'no-frils-monokai t)
(load-theme 'solarized-light t)

;; Org Mode
(require 'org)
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELLED" "MOVED")))
(setq org-log-done 'time)
(evil-define-key 'normal org-mode-map (kbd "t") 'org-todo)
(evil-define-key 'normal org-mode-map (kbd "TAB") 'org-cycle)

;; Agenda Mode
(load-library "find-lisp")
(setq org-agenda-files (find-lisp-find-files "~/org" "\.org$"))
(setq org-agenda-custom-commands
      '(("d" "Daily agenda and all TODOs"
	 ((agenda "" ((org-agenda-ndays 7)))
	  (alltodo "" ((org-agenda-skip-function
			'(org-agenda-skip-if nil '(scheduled deadline)))))))))

(defun air-pop-to-org-agenda (&optional split)
  "Visit the org agenda, in the current window or a SPLIT."
  (interactive "P")
  (org-agenda nil "d")
  (when (not split)
    (delete-other-windows)))
(evil-define-key 'normal org-mode-map (kbd "C-c p") 'air-pop-to-org-agenda)

;; Company Mode
(require 'company)
(require 'company-go)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'go-mode-hook (lambda ()
			  (set (make-local-variable 'company-backends) '(company-go))
			  (company-mode)))
(setq company-tooltip-limit 20)
(setq company-idle-delay .3)
(setq company-echo-delay 0)
(setq company-begin-commands '(self-insert-command))
(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))

;; Flycheck Mode
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Go Mode
(setq gofmt-command "goimports")
(add-hook 'go-mode-hook
	  (lambda ()
	    (add-hook 'before-save-hook 'gofmt-before-save)
	    (setq tab-width 4)
	    (setq indent-tabs-mode 1)
	    (defvar go-use-gometalinter t)))

(with-eval-after-load 'go-mode
    (define-key go-mode-map (kbd "C-c t") #'go-tag-add)
    (define-key-after go-mode-map (kbd "C-c T") #'go-tag-remove))
(defvar go-tag-args (list "-transform" "snakecase"))
(defvar flycheck-gometalinter-vendor t)
(defvar flycheck-gometalinter-errors-only t)
(defvar flycheck-gometalinter-fast t)

;; Anaconda Mode
(add-hook 'python-mode-hook 'anaconda-mode)

;; Neotree
(require 'neotree)
(global-set-key (kbd "C-x t") 'neotree-toggle)
;; Neotree keybindings for evil mode
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "|") 'neotree-enter-vertical-split)
(evil-define-key 'normal neotree-mode-map (kbd "-") 'neotree-enter-horizontal-split)

;; ledger-mode configuration
(require 'ledger-mode)
(setq ledger-clear-whole-transactions 1)
(add-to-list 'auto-mode-alist '("\\.dat\\'" . ledger-mode))
(add-to-list 'evil-emacs-state-modes 'ledger-report-mode)
(setq ledger-post-amount-alignment-column 62)

;; Ivy
(ivy-mode 1)
(defvar ivy-use-virtual-buffers t)
(defvar ivy-count-format "(%d%d) ")

;; Font
(set-face-attribute 'default nil :family "Source Code Pro" :weight 'normal)

;; nlinum-relative
(require 'nlinum-relative)
(nlinum-relative-setup-evil)
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(add-hook 'text-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-redisplay-delay 0)
(setq nlinum-relative-current-symbol "")
(setq nlinum-relative-offset 0)

;; Circadian
;;(use-package solarized-theme :ensure :defer)
;;(use-package circadian
;;  :ensure t
;;  :config
;;  (setq circadian-themes '(("8:00" . solarized-light)
;;			  ("20:00" . solarized-dark)))
;;  (circadian-setup))

;; Misc settings
(electric-pair-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
;; (global-linum-mode t)
;; (setq linum-format "%2d ")
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-screen t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a2549994584674df556cb9262d98e672c78880c11530910e8fd10a6632df090f" "c10b864fbfa36e29005672d4a21b784e30e329b99597aaaea627b3a96262194f" "6cdea8c1e42655a78a33d4450e8559c28614ac3aa1839f5d26c6d8dfd08400c3" "50a3c7cf0c1c6d4c455e33ec783af370ed2378492f7da6970bae95c66eccbb1e" "ba2fc98c567f6ca08b937a5be868963fb79af08b4d38f04ed39bc814adf1a52e" "1a7989c2d7d47474aa584e94b504033317ad21ab7a13b4a12afbc8463b500c10" default)))
 '(package-selected-packages
   (quote
    (use-package circadian nlinum-relative solarized-theme gruvbox-theme pipenv company-anaconda anaconda-mode flycheck-gometalinter flycheck magit ivy ledger-mode neotree company company-go go-dlv go-mode go-tag evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#282828" :foreground "#fdf4c1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "bB  " :family "Fira Code")))))

(provide 'init)
;;; init.el ends here
