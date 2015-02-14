;; sre-editing.el

;; Save & restore opened files
(desktop-save-mode 1)

(setq x-select-enable-clipboard t)

;; Enable { cut, copy, paste, Undo }
(cua-mode 1)

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

;; Enforce proper whitespace
(setq mode-require-final-newline nil)
(package-require 'ethan-wspace)
(global-ethan-wspace-mode 1)

;; Brace
(package-require 'mic-paren)
(paren-activate)
(show-paren-mode 1)

;;CTAGS
(setq path-to-ctags "/opt/local/bin/ctags")
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "ctags -f %s -e -R %s" path-to-ctags (directory-file-name dir-name))))

(custom-set-variables
  '(ac-etags-requires 1))

(eval-after-load "etags"
  '(progn
      (ac-etags-setup)))

;;(ac-set-trigger-key "TAB")

(add-hook 'scala-mode-hook 'ac-etags-ac-setup)

;; Multiple cursors!
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-'") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-*") 'mc/mark-all-like-this-dwim)

(package-require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(package-require 'golden-ratio)
(golden-ratio-mode 1)

(package-require 'helm-swoop)

(provide 'sre-editing)
