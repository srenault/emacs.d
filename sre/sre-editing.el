;; sre-editing.el

(setq x-select-enable-clipboard t)

;; Enable { cut, copy, paste, Undo }
(cua-mode 1)

(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)

;; Display line number
(linum-mode 1)
(global-linum-mode 1)

;; Stop creating backup~ files
(setq make-backup-files nil)
;; Stop creating #autosave# files
(setq auto-save-default nil)

;; Highlight current line
(global-hl-line-mode 1)
(setq column-number-mode t)

;; Always use UTF-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Indenting
(set-default 'indent-tabs-mode nil)
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default sgml-basic-offset 2)
;; Javascript
(setq-default js2-basic-offset 2)
;; JSON
(setq-default js-indent-level 2)
;; Typescript
(setq typescript-indent-level 2
      typescript-expr-indent-offset 2)
;; XML
(setq-default nxml-child-indent 2)
;; Default formatting style for C based modes
(setq c-default-style "java")
(setq-default c-basic-offset 2)
(setq sentence-end-double-space nil)
(setq-default css-indent-offset 4)
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))

(setq whitespace-display-mappings
 '((space-mark 32 [183] [95]) ; normal space
   (space-mark 160 [164] [95])
   (space-mark 2208 [2212] [95])
   (space-mark 2336 [2340] [95])
   (space-mark 3616 [3620] [95])
   (space-mark 3872 [3876] [95])
   (newline-mark 10 [9166 10]) ; newline
   (tab-mark 9 [9655 9] [92 9])))

;; Parens
(package-require 'mic-paren)
(paren-activate)
(show-paren-mode 1)

;; Multiple cursors!
(package-require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-'") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-M-=") 'mc/mark-next-like-this-word)
(global-set-key (kbd "C-M-:") 'mc/mark-all-like-this-dwim)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(package-require 'helm-swoop)

(provide 'sre-editing)
