;;; sre-helm.el

(package-require 'helm)

(require 'helm-config)
(global-set-key (kbd "C-c c") 'helm-swoop)

(global-set-key (kbd "<print>") 'helm-mini)

;; Projectile support
(package-require 'helm-projectile)
(global-set-key (kbd "C-c <print>") 'helm-projectile)

(global-set-key (kbd "C-c f") 'projectile-find-file)

;; Backup
;; (package-require 'helm-backup)
;; (add-hook 'after-save-hook 'helm-backup-versioning)
;; (global-set-key (kbd "C-c b") 'helm-backup)
;; (setq helm-backup-path "~/.emacs.d/.helm-backup")

(provide 'sre-helm)
