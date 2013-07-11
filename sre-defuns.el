;; sre-defuns.el

(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun replace-tabs-by-spaces ()
  "Replace tabs by spaces."
  (interactive)
  (replace-string "	" "    "))

(defun replace-spaces-by-tabs ()
  "Replace spaces by tabs."
  (interactive)
  (replace-string "...." "	"))

(defun file-string (file)
    "Read the contents of a file and return as a string."
    (with-current-buffer (find-file-noselect file)
      (buffer-string)))

(autoload 'zap-up-to-char "misc"
   "Kill up to, but not including ARGth occurrence of CHAR.
 
 \(fn arg char)"
   'interactive)

(global-set-key "\M-Z" 'zap-up-to-char)

(defun sre-tabs-as-tabs ()
  "TABS as TABS."
  (interactive)
  (setq-default indent-tabs-mode t))

(defun sre-tabs-as-spaces ()
  "TABS as spaces."
  (interactive)
  (setq-default indent-tabs-mode nil))

(provide 'sre-defuns)
