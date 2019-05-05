;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messags* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

;; The order of files is site-start.el cusomizations.el Preferences.el


;;(load "init.el") ; This should check for config.el and .org and make sure we have the latest
(load "init/config.el")

(message "Emacs init-time %s" (emacs-init-time) )
