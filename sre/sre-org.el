(require 'org-install)

(define-key global-map "\C-cl" 'org-store-link)

(define-key global-map "\C-ca" 'org-agenda)

(setq org-agenda-files (list "~/data/Dropbox/Home/org-mode/meeting.org"
                             "~/data/Dropbox/Home/org-mode/birthdate.org"
                             "~/data/Dropbox/Home/org-mode/sre.org"))

(require 'remember)
(require 'org-remember)

(setq org-directory "~/data/Dropbox/Home/org-mode")
(setq org-default-notes-file "~/data/Dropbox/Home/org-mode/notes.org")
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)

(define-key global-map [(control meta ?r)] 'remember)

(setq org-agenda-custom-commands
      '(("P" "prismic.io"
         ((agenda)
          (tags-todo "PRISMICIO")))
        ("D" "Daily Action List"
         ((agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up))))
                      (org-deadline-warning-days 0)))))))

(setq org-remember-templates
      '(("Tasks" ?t "* TODO %?\n  %i\n  %a" "~/data/Dropbox/Home/org-mode/sre.org" "Tasks")
        ("Movies" ?m "* TODO %?\n  %i\n  %a" "~/data/Dropbox/Home/org-mode/movie.org" "Movies")
        ("Meeting" ?g "* Meeting: %?\n%^T\n%i\n  %a" "~/data/Dropbox/Home/org-mode/meeting.org" "Meeting")))

(provide 'sre-org)
