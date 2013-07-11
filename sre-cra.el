(require 'request)
(require 'json)
(require 'sre-secret)
(require 'sre-defuns)

(defun sre-cra-load ()
  (append (json-read-from-string (file-string "~/cra")) nil))

(defun sre-cra ()
  (interactive)
  (dolist (entry (sre-cra-load))
    (request
     "http://cra.zenexity.com/entries"
     :type "POST"
     :data (json-encode entry)
     :headers `(("Cookie" . ,**sre-cra-session**)(Content-Type . "application/json"))
     :parser 'json-read
     :success (function*
               (lambda (&key data &allow-other-keys)
                 (message "CRA DONE!"))))))

(provide 'sre-cra)
