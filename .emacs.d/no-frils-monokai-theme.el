;;; no-frils-monokai.el --- A dark minimalistic theme with hints of Monokai colors.

;; Copyright (C) 2018 Jordan Juel

;; Author: Jordan Juel <jordan.juel [at] gmail.com>
;; Keywords: color, theme, minimal, monokai

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; A minimalistic color theme with hints of Monokai colors.
;; Based on minimal theme.

;;; Code:
(deftheme no-frils-monokai "no frils monoki theme.")

(let* ((class '((class color) (min-colors 89)))
       (foreground "grey90")
       (background "grey10")
       (cursor "white")
       (border "grey10")
       (minibuffer cursor)
       (region "grey20")
       (comment "grey25")
       (constant foreground)
       (string "grey70")
       (modeline-foreground background)
       (modeline-background "grey95")
       (modeline-foreground-inactive comment)
       (modeline-background-inactive background)
       (hl-background region)
       (hl-face-background nil)
       (failure "red")
       (org-background "grey8")
       (monokai-green "#A6E22E")
       (monokai-pink "#F92672")
       (monokai-orange "#FD971F")
       (monokai-blue "#66D9EF")
       (monokai-yellow "#E6DB74")
       (monokai-red "#F92672")
       (monokai-violet "#AE81FF")
       (monokai-highlight-line "#3C3D37")
       (monokai-highlight-alt "#3E3D31")
       (monokai-highlight "#49483E")
       (monokai-emphasis "#F8F8F0")
       (monokai-gray "#64645E")
       (monokai-comments "#75715E")
       (monokai-background "#272822")
       (monokai-cyan "#56B6C2")
       )
  (setq fci-rule-color comment)
  (custom-theme-set-faces
   'no-frils-monokai

   ;; basic stuff
   `(default ((,class (:background ,background :foreground ,foreground))))
   `(cursor ((,class (:background ,cursor :inverse-video t))))
   `(vertical-border ((,class (:foreground ,border))))

   ;; minibuffer
   `(minibuffer-prompt ((,class (:foreground ,minibuffer :weight bold))))

   ;; region
   `(region ((,class (:background ,region))))
   `(secondary-selection ((,class (:background ,region))))

   ;; faces
   `(font-lock-builtin-face ((,class (:foreground ,foreground :weight bold))))
   `(font-lock-constant-face ((,class (:foreground ,foreground :weight bold))))
   `(font-lock-keyword-face ((,class (:foreground ,foreground))))
   `(font-lock-type-face ((,class (:foreground ,foreground :weight bold))))
   `(font-lock-function-name-face ((,class (:foreground ,foreground :weight bold))))
   `(font-lock-variable-name-face ((,class (:foreground ,foreground))))

   `(font-lock-comment-delimiter-face ((,class (:foreground ,monokai-blue))))
   `(font-lock-comment-face ((,class (:foreground ,monokai-blue))))
   `(font-lock-doc-face ((,class (:inherit (font-lock-comment-face)))))
   `(font-lock-string-face ((,class (:foreground ,foreground :foreground ,string))))

   ;; faces used by isearch
   `(isearch ((,class (:foreground ,foreground :background ,region :weight normal))))
   `(isearch-fail ((,class (:foreground ,failure :bold t))))
   `(lazy-highlight
     ((,class (:foreground ,foreground :background ,region))))

   ;; ido-mode
   `(ido-subdir ((,class (:foreground ,foreground :weight bold))))
   `(ido-only-match ((,class (:foreground ,foreground :weight bold))))

   ;; show-paren
   `(show-paren-match
     ((,class (:background ,region))))
   `(show-paren-mismatch
     ((,class (:foreground ,failure :weight bold))))

   ;; modeline
   `(mode-line
       ((,class (:inverse-video unspecified
                                :overline ,border
                                :underline nil
                                :foreground ,modeline-foreground
                                :background ,modeline-background
                                :box (:line-width 1 :color ,background :style unspecified)
                                ))))
     `(mode-line-buffer-id ((,class (:weight bold))))
     `(mode-line-inactive
       ((,class (:inverse-video unspecified
                                :overline ,border
                                :underline nil
                                :foreground ,modeline-foreground-inactive
                                :background ,modeline-background-inactive
                                :box (:line-width 1 :color ,border :style unspecified)
                                ))))

      ;; hl-line-mode
     `(hl-line ((,class (:background ,hl-background))))
     `(hl-line-face ((,class (:background ,hl-face-background))))

     ;; org-mode
     `(org-level-1 ((,class (:foreground ,foreground :height 1.3 :weight bold))))
     `(org-level-2 ((,class (:foreground ,foreground :height 1.2))))
     `(org-level-3 ((,class (:foreground ,foreground :height 1.15))))
     `(org-level-4 ((,class (:foreground ,foreground :height 1.1))))
     `(org-level-5 ((,class (:foreground ,foreground :height 0.8))))
     `(org-level-6 ((,class (:foreground ,foreground))))
     `(org-level-7 ((,class (:foreground ,foreground))))
     `(org-level-8 ((,class (:foreground ,foreground))))

     ;; outline
     `(outline-1 ((,class (:inherit org-level-1))))
     `(outline-2 ((,class (:inherit org-level-2))))
     `(outline-3 ((,class (:inherit org-level-3))))
     `(outline-4 ((,class (:inherit org-level-4))))
     `(outline-5 ((,class (:inherit org-level-5))))
     `(outline-6 ((,class (:inherit org-level-6))))
     `(outline-7 ((,class (:inherit org-level-7))))
     `(outline-8 ((,class (:inherit org-level-8))))

     `(org-document-title ((,class (:foreground ,foreground))))

     `(org-link ((,class (:background ,org-background :foreground ,foreground :underline t))))
     `(org-tag ((,class (:background ,background :foreground ,monokai-violet))))
     `(org-warning ((,class (:background ,org-background :foreground ,foreground :weight bold))))
     `(org-todo ((,class (:background ,background :foreground ,monokai-pink :weight bold))))
     `(org-done ((,class (:background ,background :foreground ,monokai-green :weight bold))))

     `(org-table ((,class (:background ,org-background))))
     `(org-code ((,class (:background ,org-background))))
     `(org-date ((,class (:background ,org-background :underline t))))
     `(org-block ((,class (:background ,org-background))))
     `(org-block-background ((,class (:background ,org-background :foreground ,foreground))))
     `(org-block-begin-line
       ((,class (:background ,org-background :foreground ,monokai-blue :weight bold))))
     `(org-block-end-line
       ((,class (:background ,org-background :foreground ,monokai-blue :weight bold))))

     ;; company-mode
     `(company-tooltip ((,class (:background ,monokai-highlight-line :foreground ,monokai-emphasis))))
     `(company-tooltip-selection ((,class(:background ,monokai-blue :foreground ,monokai-background))))
     `(company-tooltip-mouse ((,class (:background ,monokai-blue :foreground ,monokai-background))))
     `(company-tooltip-common ((,class (:foreground ,monokai-blue :underline t))))
     `(company-tooltip-common-selection ((,class (:background ,monokai-blue :foreground ,monokai-background :underline t))))
     `(company-preview ((,class (:background ,monokai-highlight-line :foreground ,monokai-emphasis))))
     `(company-preview-common ((,class (:foreground ,monokai-blue :underline t))))
     `(company-scrollbar-bg ((,class (:background ,monokai-gray))))
     `(company-scrollbar-fg ((,class (:background ,monokai-comments))))
     `(company-tooltip-annotation ((,class (:background ,monokai-highlight-line :foreground ,monokai-green))))
     `(company-template-field ((,class (:background ,monokai-highlight-line :foreground ,monokai-blue))))
     
     ;; js2-mode
     `(js2-external-variable ((,class (:inherit base-faces :weight bold))))
     `(js2-function-param ((,class (:inherit base-faces))))
     `(js2-instance-member ((,class (:inherit base-faces))))
     `(js2-jsdoc-html-tag-delimiter ((,class (:inherit base-faces))))
     `(js2-jsdoc-html-tag-name ((,class (:inherit base-faces))))
     `(js2-jsdoc-tag ((,class (:inherit base-faces))))
     `(js2-jsdoc-type ((,class (:inherit base-faces :weight bold))))
     `(js2-jsdoc-value ((,class (:inherit base-faces))))
     `(js2-magic-paren ((,class (:underline t))))
     `(js2-private-function-call ((,class (:inherit base-faces))))
     `(js2-private-member ((,class (:inherit base-faces))))
   ))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'no-frils-monokai)
