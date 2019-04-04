;; aquamacs setup
;; Move that to Preferences

;; This file is run before and should really be for OS independent stuff and is before customisation
;; In effect an init file

;; Manipulate garbage collection from https://github.com/jwiegley/dot-emacs/blob/master/init.el#L1013

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
(load "common-modes")
(load "common-keys")

