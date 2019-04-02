;; Java related stuff


;; gradle and other java
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)

(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))
;; This does work with Aquamacs
(add-to-list 'auto-mode-alist (cons "\\.gradle\\'" 'groovy-mode))
(add-to-list 'auto-mode-alist (cons "\\.groovy\\'" 'groovy-mode))
;; This _might_ not work with Aquamacs (not sure what value it offers)
;(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
;(add-to-list 'interpreter-mode-alist '("gradle" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))
(require 'gradle)
