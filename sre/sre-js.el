;; sre-js.el

(package-require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(package-require 'js3-mode)

'(js3-auto-indent-p t)
'(js3-enter-indents-newline t)
'(js3-indent-on-enter-key t)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

(setq js2-cleanup-whitespace t)
(setq-default js2-basic-offset 2)
(setq js2-enter-indents-newline nil)
(setq js2-indent-on-enter-key nil)
(setq js2-mirror-mode nil)
(setq js2-mode-indent-ignore-first-tab t)
(setq js2-global-externs
      '("module" "require" "__dirname" "process" "console" "define"
        "JSON" "$" "_"))

(provide 'sre-js)
