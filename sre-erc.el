;; sre-erc

(require 'erc)

(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
          '(("irc.zxt.fr" "#zenexity")))

(defun sre-erc ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.zxt.fr:6667") ;; ERC already active?
    (erc-track-switch-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      (erc :server "irc.zxt.fr" :port 6667 :nick "sre" :full-name "Sébastien Renault" :password **sre-irc-password**))))

(provide 'sre-erc)
