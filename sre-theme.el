;; sre-theme.el

(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))

(color-theme-initialize)
(load-file "~/site-lisp/themes/color-theme-blackboard.el")
(color-theme-blackboard)

(provide 'sre-theme)
