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
(set-frame-parameter nil 'fullscreen 'fullboth)

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

(setq sre-pkg-full
      '(sre-defuns
        sre-erc
        sre-editing
        sre-scala
        sre-whitespace
        sre-binding
        sre-extension
        sre-linum
        sre-dired
        sre-ido
        sre-markdown
        sre-haskell
        sre-terminal
        sre-hack
        sre-theme
        sre-autocomplete
        sre-helm
        sre-js))

(dolist (file sre-pkg-full)
  (require file))
(put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-etags-requires 1)
 '(custom-safe-themes (quote ("c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "e56f1b1c1daec5dbddc50abd00fcd00f6ce4079f4a7f66052cf16d96412a09a9" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "c3e567dedaa800e869d879c4df8478237d6ea31fd04464086fd674c864fe4d71" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "769bb56fb9fd7e73459dcdbbfbae1f13e734cdde3cf82f06a067439568cdaa95" "146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
