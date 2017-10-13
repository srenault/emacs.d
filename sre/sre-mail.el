;; brew install automake
;; brew install libtool
;; brew install autoconf-archive
;; brew install glib
;; brew install gmime

(add-to-list 'load-path  "/usr/local/Cellar/mu/0.9.18_1/share/emacs/site-lisp/mu/mu4e")

(require 'mu4e)
(require 'mu4e-contrib)

(setq mail-user-agent 'mu4e-user-agent)

(global-set-key (kbd "C-x C-u") 'mu4e-update-mail-and-index)

;; Maildir setup
(setq
 mu4e-mu-binary "/usr/local/bin/mu"
 mu4e-maildir "~/srebox/sre/mail/srenault@openmailbox.org"
 mu4e-sent-folder "/Sent"
 mu4e-drafts-folder "/Drafts"
 mu4e-trash-folder "/Trash"
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
 mu4e-user-mail-address-list '("srenault@openmailbox.org" "srebin@eopenmailbox.org")
 mu4e-attachment-dir "~/Downloads/Mail")

(setq mu4e-html2text-command "/usr/local/bin/html2text -utf8 -width 72")

;; SMTP
(package-require 'async)
(require 'smtpmail-async)

(setq
 send-mail-function 'smtpmail-send-it ; 'async-smtpmail-send-it
 message-send-mail-function 'smtpmail-send-it ; 'async-smtpmail-send-it
 smtpmail-stream-type 'ssl
 smtpmail-default-smtp-server "smtp.ombx.io"
 smtpmail-smtp-user "srenault@openmailbox.org"
 smtpmail-smtp-server "smtp.ombx.io"
 smtpmail-smtp-service 465
 smtpmail-queue-mail nil
 smtpmail-queue-dir "~/srebox/sre/mail/srenault@openmailbox.org/Queue/cur")

(provide 'sre-mail)
