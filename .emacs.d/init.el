;;; Package --- Summary
;;; Commentary:
(require 'package)

;;; Code:
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)

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

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(provide 'init)
;;; init.el ends here

