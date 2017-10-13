(require 'org-install)

(global-set-key (kbd "C-c o") 
                (lambda () (interactive) (find-file "/Users/sre/srebox/org-mode/sre.org")))

(global-set-key (kbd "C-c c") 'org-capture)

(define-key global-map "\C-cl" 'org-store-link)

(define-key global-map "\C-ca" 'org-agenda)


(setq org-directory "/Users/sre/srebox/org-mode")
(setq org-agenda-files (list "/Users/sre/srebox/org-mode/sre.org"))
(setq org-default-notes-file "/Users/sre/srebox/org-mode/notes.org")

(define-key global-map [(control meta ?r)] 'org-capture)

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
      '(("t" "Todo" entry (file+headline "/Users/sre/srebox/org-mode/sre.org" "Backlog")
         "* TODO %?\n  %i")
        ("r" "Read it later" entry (file+headline "/Users/sre/srebox/org-mode/sre.org" "Read it later")
         "* TODO %?\n  %i\n")
        ("v" "View it later" entry (file+headline "/Users/sre/srebox/org-mode/sre.org" "View it later")
         "* TODO %?\n  %i\n")
        ("n" "Notes" entry (file+headline "/Users/sre/srebox/org-mode/notes.org" "Notes")
         "* TODO %?\n  %i\n")))


(setq org-publish-project-alist
      '(
        ("sre-org"
         :base-directory "/Users/sre/srebox/org-mode"
         :base-extension "org"
         :publishing-directory "/Users/sre/srebox/www"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t)))

(setq org-refile-targets '((org-agenda-files . (:maxlevel . 2))))

(setq org-completion-use-ido t)

;; (when (executable-find "hunspell")
;;   (setq-default ispell-program-name "hunspell")
;;   (setq ispell-really-hunspell t))

;; (add-hook 'org-mode-hook 'turn-on-flyspell)

(defun auto-publish-hook ()
  "Auto publish on save"
  (save-excursion (org-publish-current-file)
                  (message "auto published") nil))

;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook 'auto-publish-hook nil nil)))

(provide 'sre-org)
