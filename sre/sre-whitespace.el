;; Whitespace mode

(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))

(setq whitespace-display-mappings
 '(
   (space-mark 32 [183] [95]) ; normal space
   (space-mark 160 [164] [95])
   (space-mark 2208 [2212] [95])
   (space-mark 2336 [2340] [95])
   (space-mark 3616 [3620] [95])
   (space-mark 3872 [3876] [95])
   (newline-mark 10 [9166 10]) ; newlne, ¶
   (tab-mark 9 [9655 9] [92 9]) ; tab, ▷
))

(global-whitespace-mode 1)

(provide 'sre-whitespace)
