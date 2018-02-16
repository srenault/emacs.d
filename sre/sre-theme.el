;; sre-theme.el

;; No splash screen
(setq inhibit-startup-message t)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

(package-require 'base16-theme)
(package-require 'darkburn-theme)
(package-require 'cyberpunk-theme)
(package-require 'monokai-theme)
(package-require 'zenburn-theme)

(load-theme 'darkburn t)

(provide 'sre-theme)
