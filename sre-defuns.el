;; sre-defuns.el

(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(autoload 'zap-up-to-char "misc"
   "Kill up to, but not including ARGth occurrence of CHAR.
 
 \(fn arg char)"
   'interactive)

(global-set-key "\M-Z" 'zap-up-to-char)

(defun sre-tabs-to-tabs ()
  "TABS is TABS."
  (interactive)
  (setq-default indent-tabs-mode t))

(defun sre-tabs-as-spaces ()
  "TABS is TABS."
  (interactive)
  (setq-default indent-tabs-mode nil))

(provide 'sre-defuns)
