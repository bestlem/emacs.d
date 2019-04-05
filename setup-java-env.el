;; Java related stuff


;; gradle and other java
;; from http://www.coli.uni-saarland.de/~slemaguer/emacs/main.html#orgac34543

(use-package groovy-mode
  :ensure t
  :mode ("\.groovy$" "\.gradle$")
  :interpreter ("gradle" "groovy")
  :config
  (autoload 'run-groovy "inf-groovy" "Run an inferior Groovy process")
  (autoload 'inf-groovy-keys "inf-groovy" "Set local key defs for inf-groovy in groovy-mode")

  ;; Some keys for
  (add-hook 'groovy-mode-hook
            '(lambda ()
               (inf-groovy-keys))))

;; Subpackages
(use-package groovy-imports :ensure t)


;; ;; This does work with Aquamacs
;; (add-to-list 'auto-mode-alist (cons "\\.gradle\\'" 'groovy-mode))
;; (add-to-list 'auto-mode-alist (cons "\\.groovy\\'" 'groovy-mode))
;; ;; This _might_ not work with Aquamacs (not sure what value it offers)
;; ;(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
;; ;(add-to-list 'interpreter-mode-alist '("gradle" . groovy-mode))

;; ;;; make Groovy mode electric by default.
;; (add-hook 'groovy-mode-hook
;;           '(lambda ()
;;              (require 'groovy-electric)
;;              (groovy-electric-mode)))
;; (require 'gradle)

(use-package gradle-mode
  :ensure t
   :delight
;  :quelpa (gradle-mode :repo "seblemaguer/emacs-gradle-mode" :fetcher github)
  :config
  (setq gradle-gradlew-executable "./gradlew"
        gradle-use-gradlew t)
  (gradle-mode))
