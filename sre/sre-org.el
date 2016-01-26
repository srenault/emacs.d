(require 'org-install)

(define-key global-map "\C-cl" 'org-store-link)

(define-key global-map "\C-ca" 'org-agenda)

(setq org-agenda-files (list "~/data/Dropbox/Home/org-mode/birthdate.org"
                             "~/data/Dropbox/Home/org-mode/sre.org"))

(require 'remember)
(require 'org-remember)

(setq org-directory "~/data/Dropbox/Home/org-mode")
(setq org-default-notes-file "~/data/Dropbox/Home/org-mode/notes.org")

(define-key global-map [(control meta ?r)] 'org-capture)

(setq org-agenda-custom-commands
      '(("P" "prismic.io"
         ((agenda)
          (tags-todo "PRISMICIO")))
        ("C" "cheminot.org"
         ((agenda)
          (tags-todo "CHEMINOT")))
        ("D" "Daily Action List"
         ((agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up))))
                      (org-deadline-warning-days 0)))))))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/data/Dropbox/Home/org-mode/sre.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("r" "Read it later" entry (file+headline "~/data/Dropbox/Home/org-mode/sre.org" "Read it later")
         "* TODO %?\n  %i\n  %a")
        ("v" "View it later" entry (file+headline "~/data/Dropbox/Home/org-mode/sre.org" "View it later")
         "* TODO %?\n  %i\n  %a")
        ("n" "Notes" entry (file+headline "~/data/Dropbox/Home/org-mode/notes.org" "Notes")
         "* TODO %?\n  %i\n  %a")))

(setq org-refile-targets '((org-agenda-files :level . 1)))

(provide 'sre-org)
