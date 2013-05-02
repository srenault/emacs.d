;; sre-theme.el

(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))

(color-theme-initialize)

(require 'zenburn-theme)
(load-file "~/site-lisp/themes/color-theme-blackboard.el")
(color-theme-blackboard)
;(load-theme 'zenburn t)

(provide 'sre-theme)
