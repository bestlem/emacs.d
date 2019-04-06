;; aquamacs setup
;; In init.el so more standard emacs name.
;; In Aquamacs loded from Preferences
;; If used in non Aquamacs needs custom.el sorted out.

;; From gnu site-start.el should not be used it is loaded before init Should use defaults.el loaded after init
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html

;; Manipulate garbage collection from https://github.com/jwiegley/dot-emacs/blob/master/init.el#L1013

;; From https://github.com/jwiegley/dot-emacs/blob/master/init.el#L1013
(defconst emacs-start-time (current-time))

(defvar file-name-handler-alist-old file-name-handler-alist)

(setq package-enable-at-startup nil
	  file-name-handler-alist nil
      message-log-max 16384
      gc-cons-threshold 402653184
      gc-cons-percentage 0.6
      auto-window-vscroll nil)

(add-hook 'after-init-hook
          `(lambda ()
             (setq file-name-handler-alist file-name-handler-alist-old
                   gc-cons-threshold 800000
                   gc-cons-percentage 0.1)
             (garbage-collect)) t)


;; emacs server
(server-start)

;; common bits
(load "setup-packages") ; Package management
(load "common-setup") ; odds mainly variables
(load "common-programming") ; modes for programming
(load "common-keys")

