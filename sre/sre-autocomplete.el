(package-require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "site-lisp/auto-complete/dict"))
(setq ac-auto-start nil)
(define-key ac-mode-map (kbd "C-\\") 'auto-complete-selective)
(define-key ac-completing-map (kbd "TAB") nil)
(define-key ac-completing-map (kbd "RET") 'ac-complete)
(define-key ac-completing-map (kbd "C-\\") 'ac-complete)

(eval-after-load "yasnippet"
  '(setq-default ac-sources (append '(ac-source-yasnippet) ac-sources)))

(setq ac-modes (append '(typescript-mode html-mode) ac-modes))

(package-require 'tss)
(eval-after-load 'tss
  '(progn
     (tss-config-default)))

(provide 'sre-autocomplete)
