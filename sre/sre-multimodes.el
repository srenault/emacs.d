(package-require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;; (package-require 'mmm-mode)
;; (require 'mmm-mode)
;; (setq mmm-global-mode 1)

;; (mmm-add-classes
;;  '((any-html
;;    :submode html-mode
;;    :face mmm-code-submode-face
;;    :front "<"
;;    :back ">")))

;; ;; Define active classes
;; (setq mmm-mode-ext-classes-alist
;;       '(;; JS inside HTML
;;         (html-mode nil html-js)
;;         (js2-mode nil any-html)
;;         ;; CSS inside HTML
;;         (html-mode nil html-css)))

;; (mmm-add-to-major-mode-preferences 'javascript 'js2-mode t)

(provide 'sre-multimodes)
