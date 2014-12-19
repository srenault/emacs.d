;; sre-hack.el

(setq compile-command "hh_client")
(global-set-key (kbd "M-RET") 'compile)

(if (boundp 'hack-for-hiphop-root)
  (setq compile-command (concat "hh_client --from emacs " hack-for-hiphop-root))

  ;; Compute the path to www whenever a php file is opened
  (add-hook 'php-mode-hook
    (lambda()
      (set (make-local-variable 'compile-command) (concat "hh_client "
        (locate-dominating-file (file-truename (buffer-name)) ".hhconfig")))))
)

;; Shortcut keys
(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])
(global-set-key [(meta up)] 'next-error)
(global-set-key [(meta down)] 'previous-error)

(provide 'sre-hack)
