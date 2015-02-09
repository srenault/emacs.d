;; sre-terminal.el

(global-set-key (kbd "C-x C-m") 'multi-term)
(global-set-key (kbd "C-x m") 'multi-term-next)

;; Don't try to enable autopair in term-mode, it remaps the return key!
(add-hook 'term-mode-hook (lambda () (autopair-mode 0)))

(provide 'sre-terminal)
