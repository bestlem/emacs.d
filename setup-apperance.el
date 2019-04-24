;; Visual appearance
;; Note Aquamacs is stuck with old color themes not the cusomisable ones

(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-high-contrast)))

;; remove toolbar
(tool-bar-mode 0)

;; display standard Emacs (and not standard Mac) modifier symbols
(setq ns-use-mac-modifier-symbols  nil)
