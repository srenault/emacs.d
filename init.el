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

(package-require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(add-to-list 'load-path "/usr/local/bin") (add-to-list 'exec-path "/usr/local/bin")

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
        sre-yaml
        sre-mail
        sre-gpg
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (epa-file shell-here password-store yaml-mode web-mode use-package typescript-mode smex scala-mode sbt-mode php-mode multiple-cursors mic-paren markdown-mode magit json-mode js2-mode ido-vertical-mode ido-ubiquitous helm-swoop helm-projectile helm-git-grep flycheck exec-path-from-shell editorconfig dired+ csharp-mode blank-mode base16-theme add-node-modules-path))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
