;;; Emacs by Sébastien RENAULT

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

;; Fullscreen
;(set-frame-parameter nil 'fullscreen 'fullboth)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Disable backup files
(setq make-backup-files nil)

;; Add .emacs.d to load-path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfiles-dir "sre"))

(add-to-list 'load-path (concat dotfiles-dir "utils"))

;; Add every subdirectory of ~/.emacs.d/site-lisp to the load path
(dolist
    (project (directory-files (concat dotfiles-dir "site-lisp") t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(dolist
    (project (directory-files (concat dotfiles-dir "elpa") t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Package management
(require 'package)
(add-to-list 'package-archives
            '("melpa" . "http://melpa.milkbox.net/packages/") t)

 (package-initialize)

;; Push some bin to PATH
;(push "/Users/litig/bin/" exec-path)

(setq sre-pkg-desktop
      '(sre-defuns
        sre-editing
        sre-desktop
        sre-extension
        sre-dired
        sre-git
        sre-terminal
        sre-theme
        sre-org
        sre-ido
        sre-autocomplete
        sre-markdown
        sre-helm
        sre-scala
        sre-php
        sre-haskell
        sre-mail
        sre-js))

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
(put 'narrow-to-region 'disabled nil)
