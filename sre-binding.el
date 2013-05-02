;; sre-binding.el

(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)

(global-set-key (kbd "C-x f") 'fuzzy-find-in-project)

(provide 'sre-binding)
