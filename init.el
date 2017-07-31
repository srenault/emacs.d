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
                  ("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)

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
        sre-mail
        sre-multimodes
        sre-markdown))

(setq sre-pkg-server
      '(sre-defuns
        sre-path
        sre-editing
        sre-extension
        sre-dired
        sre-git
        sre-ido
        sre-helm))

(dolist (file sre-pkg-desktop)
  (require file))
(put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-etags-requires 1)
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "e24679edfdea016519c0e2d4a5e57157a11f928b7ef4361d00c23a7fe54b8e01" "3fb38c0c32f0b8ea93170be4d33631c607c60c709a546cb6199659e6308aedf7" "f21caace402180ab3dc5157d2bb843c4daafbe64aadc362c9f4558ac17ce43a2" "76bd62f6ce376bf0597fab7f478eaa98cd94a7b41f0ae46de63a958fbe99c1d9" "f2503f0a035c2122984e90eb184185769ee665de5864edc19b339856942d2d2d" "e8e744a1b0726814ac3ab86ad5ccdf658b9ff1c5a63c4dc23841007874044d4a" "f245c9f24b609b00441a6a336bcc556fe38a6b24bfc0ca4aedd4fe23d858ba31" "1462969067f2ff901993b313085d47e16badeec58b63b9ed67fa660cebaaddae" "cdfb22711f64d0e665f40b2607879fcf2607764b2b70d672ddaa26d2da13049f" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "ce557950466bf42096853c6dac6875b9ae9c782b8665f62478980cc5e3b6028d" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (typescript-mode elscreen use-package yasnippet yaml-mode web-mode stylus-mode smex smart-mode-line-powerline-theme scala-mode2 scala-mode sbt-mode rainbow-mode php-mode offlineimap nginx-mode multiple-cursors multi-term mmm-mode mic-paren markdown-mode magit lua-mode jsx-mode json-mode js3-mode js2-mode jade-mode ido-vertical-mode ido-ubiquitous helm-swoop helm-projectile helm-git-grep gradle-mode flycheck exec-path-from-shell ethan-wspace etags-table etags-select editorconfig-core editorconfig dockerfile-mode dired+ darkburn-theme cypher-mode cyberpunk-theme ctags-update ctags company color-theme-solarized base16-theme autopair applescript-mode ag ace-jump-mode ac-etags)))
 '(send-mail-function (quote mailclient-send-it))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
