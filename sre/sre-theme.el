;; sre-theme.el

;(add-to-list 'load-path "~/.emacs.d/site-lisp/base16-emacs")
;(add-to-list 'custom-theme-load-path "~/.emacs.d/site-lisp/themes/")
;(require 'base16-solarized-theme)

(require 'color-theme)
;(color-theme-initialize)

;(require 'color-theme-solarized)
;(color-theme-solarized-dark)

;; (defun zenburn-init ()
;;   (load-theme 'zenburn)
;; )
;; (add-hook 'after-init-hook 'zenburn-init)


(package-require 'darkburn-theme)
(load-theme 'darkburn t)

(provide 'sre-theme)
