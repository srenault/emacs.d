;; sre-editing.el

;; Highlight current line
(global-hl-line-mode 1)

;; Always use UTF-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Indenting
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Brace
(show-paren-mode 1)

;; Multiple cursors!
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-'") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-*") 'mc/mark-all-like-this-dwim)

(provide 'sre-editing)
