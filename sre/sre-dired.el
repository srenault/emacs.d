;; sre-dired.el

;; Auto refresh buffers
(global-auto-revert-mode 1)

(package-require 'dired+)

(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(toggle-diredp-find-file-reuse-dir 1)

(provide 'sre-dired)
