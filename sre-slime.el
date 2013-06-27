;; sre-slime.el

(setq inferior-lisp-program "/usr/local/bin/sbcl")
(add-to-list 'load-path "~/.emacs.d/site-lisp/slime/")  ; your SLIME directory
(require 'slime-autoloads)
(slime-setup '(slime-repl))

(provide 'sre-slime)
