(require 'ohai-package)

(setq make-backup-files nil)

;; stop creating those #auto-save# files
(setq auto-save-default nil)

(setq create-lockfiles nil)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(use-package web-mode
  :mode (("\\.jsx?$" . web-mode)
         ("\\.es6\\'" . web-mode)
         ("\\.js\\'" . web-mode)
         ("\\.ejs\\'" . web-mode)))

;; Enable clipboard
(setq x-select-enable-clipboard t)

;; Enable { cut, copy, paste, Undo }
(cua-mode 1)

;; unbind right alt
(setq ns-right-alternate-modifier nil)

(use-package helm
  :config
  (require 'helm-config)
  (require 'helm)
  ;; Activate Helm.
  (helm-mode 1)
  (setq-default helm-M-x-fuzzy-match nil
                helm-buffers-fuzzy-matching nil
                helm-recentf-fuzzy-match nil
                helm-apropos-fuzzy-match nil)
  (with-eval-after-load "ohai-project"
    (use-package helm-projectile
      :bind (("C-c f" . helm-projectile-find-file)
             ("C-c g" . helm-projectile-ag)))))

(use-package projectile
  :bind ("C-c f" . projectile-find-file))

(use-package graphql-mode)

(use-package typescript-mode)

(use-package stylus-mode)

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C-<" . mc/mark-previous-like-this)
         ("C->" . mc/mark-next-like-this)
         ("C-M-'" . mc/mark-more-like-this-extended)
         ("C-M-=" . 'mc/mark-next-like-this-word)
         ("C-M-:" . mc/mark-all-like-this-dwim)
         ("M-<mouse-1>" . mc/add-cursor-on-click)))

(global-unset-key (kbd "M-<down-mouse-1>"))

;; scala
(use-package scala-mode)
(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(add-hook 'scala-mode-hook '(lambda ()
                              ;; use sbt-run-previous-command to re-compile your code after changes
                              (local-set-key (kbd "C-x '") 'sbt-run-previous-command)
                              ))

;; (use-package lsp-mode
;;   ;; Optional - enable lsp-mode automatically in scala files
;;   :hook (scala-mode . lsp)
;;   :config (setq lsp-prefer-flymake nil))

;; (use-package lsp-ui)

;; ;; Add company-lsp backend for metals
;; (use-package company-lsp)

;; pass
(use-package pass)
(use-package helm-pass)

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; org
(use-package org
  :config
  (global-set-key (kbd "C-c c") 'org-capture)
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (define-key global-map [(control meta ?r)] 'org-capture)
  (global-set-key (kbd "C-c o") (lambda () (interactive) (find-file "/Users/sre/srebox/org-mode/sre.org")))
  (setq org-directory "/Users/sre/srebox/org-mode")
  (setq org-agenda-files (list "/Users/sre/srebox/org-mode/sre.org"))
  (setq org-default-notes-file "/Users/sre/srebox/org-mode/notes.org")
  (setq org-agenda-custom-commands
        '(("P" "prismic.io"
           ((agenda)
            (tags-todo "PRISMICIO")))
          ("D" "Daily Action List"
           ((agenda "" ((org-agenda-ndays 1)
                        (org-agenda-sorting-strategy
                         (quote ((agenda time-up priority-down tag-up))))
                        (org-deadline-warning-days 0)))))))

  (setq org-capture-templates
        '(("b" "Backlog" entry (file+headline "/Users/sre/srebox/org-mode/sre.org" "backlog")
           "* TODO %?\n  %i\n")
          ("p" "prismic.io" entry (file+headline "/Users/sre/srebox/org-mode/sre.org" "prismic")
           "* TODO %? :PRISMIC:\n  %i\n")
          ("m" "house" entry (file+headline "/Users/sre/srebox/org-mode/sre.org" "maison")
           "* TODO %? :HOUSE:\n  %i\n")
          ("r" "Read it later" entry (file+headline "/Users/sre/srebox/org-mode/sre.org" "Read it later")
           "* TODO %?\n  %i\n")
          ("v" "View it later" entry (file+headline "/Users/sre/srebox/org-mode/sre.org" "View it later")
           "* TODO %?\n  %i\n")
          ("n" "Notes" entry (file+headline "/Users/sre/srebox/org-mode/notes.org" "Notes")
           "* TODO %?\n  %i\n")))

  (setq org-todo-keywords
        '((sequence "TODO" "QUEUED" "STAGE" "EXP"))))

(provide 'sre-init)
