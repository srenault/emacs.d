;; sre-defuns.el

(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun file-string (file)
    "Read the contents of a file and return as a string."
    (with-current-buffer (find-file-noselect file)
      (buffer-string)))

(autoload 'zap-up-to-char "misc"
   "Kill up to, but not including ARGth occurrence of CHAR.
 
 \(fn arg char)"
   'interactive)

(global-set-key "\M-Z" 'zap-up-to-char)

(defun join-region (beg end)
  "Apply join-line over region."
  (interactive "r")
  (if mark-active
          (let ((beg (region-beginning))
                        (end (copy-marker (region-end))))
                (goto-char beg)
                (while (< (point) end)
                  (join-line 1)))))

(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive)
    (revert-buffer t t))

(provide 'sre-defuns)
