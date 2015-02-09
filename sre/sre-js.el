;; sre-js.el

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

(setq js2-cleanup-whitespace t)
(setq-default js2-basic-offset 2)
(setq js2-enter-indents-newline nil)
(setq js2-indent-on-enter-key nil)
(setq js2-mirror-mode nil)
(setq js2-mode-indent-ignore-first-tab t)
(setq js2-global-externs
      '("module" "require" "__dirname" "process" "console" "define"
        "JSON" "$" "_"))

;; Use plain old js-mode for JSON, js2-mode doth protest too much
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

(provide 'sre-js)
