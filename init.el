;;; Emacs by Sébastien RENAULT

;; Disable tools bar
(dolist (mode '(tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Always use UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Disable backup files
(setq make-backup-files nil)

;; Add .emacs.d to load-path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

;; Add every subdirectory of ~/.emacs.d/site-lisp to the load path
(dolist
    (project (directory-files (concat dotfiles-dir "site-lisp") t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Package management
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Highlight current line
(global-hl-line-mode 1)

;; Encoding
(setq locale-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Indenting
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Brace
(show-paren-mode 1)

;; Push some bin to PATH
;(push "/Users/litig/bin/" exec-path)

(setq sre-pkg-full
      '(sre-defuns
        sre-scala
        sre-whitespace
        sre-binding
        sre-extension
        sre-linum
        sre-dired
        sre-theme
        sre-ido
        sre-markdown
        sre-haskell
        sre-fuzzy
        sre-project
        sre-golden
        sre-js))

(dolist (file sre-pkg-full)
  (require file))
