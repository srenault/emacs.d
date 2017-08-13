;;; Emacs by Sébastien RENAULT

;; Mode line
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

(setq-default mode-line-buffer-identification
              (list 'buffer-file-name
                    (propertized-buffer-identification "%12f")
                    (propertized-buffer-identification "%12b")))

;; Disable tools bar
(dolist (mode '(tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Add .emacs.d to load-path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Package
(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(setq package-user-dir (concat dotfiles-dir "elpa"))
(require 'package)
(dolist (source '(("melpa" . "http://melpa.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; Load modules
(add-to-list 'load-path (concat dotfiles-dir "sre"))
(setq sre-pkg-desktop
      '(sre-defuns
        sre-editing
        sre-desktop
        sre-extension
        sre-dired
        sre-git
        sre-terminal
        sre-org
        sre-ido
        sre-helm
        sre-scala
        sre-php
        sre-theme
        sre-js
        sre-csharp
        ;sre-mail
        sre-markdown))

(setq sre-pkg-server
      '(sre-defuns

        sre-editing
        sre-extension
        sre-dired
        sre-git
        sre-ido
        sre-helm))

(dolist (file sre-pkg-desktop)
  (require file))
