(add-to-list 'load-path  "~/.emacs.d/site-lisp/mu/mu4e")

(require 'mu4e)
(require 'mu4e-contrib)

(setq mail-user-agent 'mu4e-user-agent)

;; Maildir setup
(setq
 mu4e-mu-binary "/usr/local/bin/mu"
 mu4e-maildir "~/data/Dropbox/Mail"
 mu4e-sent-folder "/Sent"
 mu4e-drafts-folder "/Drafts"
 mu4e-trash-folder "/Trash"
 mu4e-refile-folder "/Archive"
 mu4e-get-mail-command "offlineimap"
 mu4e-update-interval nil
 mu4e-sent-messages-behavior 'delete
 mu4e-headers-include-related t
 mu4e-headers-skip-duplicates t
 mu4e-confirm-quit nil
 mu4e-maildir-shortcuts
 '(("/INBOX" . ?i)))

;; User info
(setq
 user-mail-address "srenault@openmailbox.org"
 user-full-name "Sebastien Renault"
 mu4e-compose-signature "Sebastien Renault <srenault@openmailbox.org>\n"
 mu4e-user-mail-address-list '("srenault@openmailbox.org.org")
 mu4e-attachment-dir "~/Downloads/Mail")

;; SMTP
(package-require 'async)
(require 'smtpmail-async)
(setq
 send-mail-function 'async-smtpmail-send-it
 message-send-mail-function 'async-smtpmail-send-it
 smtpmail-stream-type 'starttls
 smtpmail-default-smtp-server "imap.openmailbox.org"
 smtpmail-smtp-user "srenault@openmailbox.org"
 smtpmail-smtp-server "imap.openmailbox.org"
 smtpmail-smtp-service 143
 smtpmail-queue-mail nil
 smtpmail-queue-dir "~/data/Dropbox/Mail/Queue/cur")

(provide 'sre-mail)
