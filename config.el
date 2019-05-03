;; [[file:~/Library/Preferences/Aquamacs%20Emacs/config.org::*Control%20init%20environment][Control init environment:1]]
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
;; Control init environment:1 ends here

;; [[file:~/Library/Preferences/Aquamacs%20Emacs/config.org::*Emacs%20Lisp%20debugging][Emacs Lisp debugging:1]]
(add-hook 'after-init-hook
				(lambda () (setq debug-on-error t)))
; (setq debug-on-error t)
;; Emacs Lisp debugging:1 ends here

;; [[file:~/Library/Preferences/Aquamacs%20Emacs/config.org::*Code%20to%20do%20loading][Code to do loading:1]]
(defun mwb-init-load (file-root)
  "Load the relevant code. Currently just the same as load it loads
<file-root>.el but eventually will load <file-root>.org"
  (load file-root))
;; Code to do loading:1 ends here

;; [[file:~/Library/Preferences/Aquamacs%20Emacs/config.org::*Packaging][Packaging:1]]
(load "setup-packages") ; Package management
;; Packaging:1 ends here

;; [[file:~/Library/Preferences/Aquamacs%20Emacs/config.org::*Emacs%20server][Emacs server:1]]
(use-package server
  :ensure nil
  :hook (after-init . server-mode))
;; Emacs server:1 ends here

;; [[file:~/Library/Preferences/Aquamacs%20Emacs/config.org::*Emacs%20behaviour][Emacs behaviour:1]]
;; common bits
(load "common-setup") ; odds mainly variables
;; Emacs behaviour:1 ends here

;; [[file:~/Library/Preferences/Aquamacs%20Emacs/config.org::*System%20management][System management:1]]
(mwb-init-load "mwb-init-file-management")
;; System management:1 ends here

;; [[file:~/Library/Preferences/Aquamacs%20Emacs/config.org::*Org%20Mode][Org Mode:1]]
(mwb-init-load "mwb-init-org-mode")
;; Org Mode:1 ends here

;; [[file:~/Library/Preferences/Aquamacs%20Emacs/config.org::*Epub%20reading][Epub reading:1]]
;; Epub reader
(use-package nov
  :ensure t
  :mode ("\\.epub\\'" . nov-mode)
  :preface
  (defun my-nov-setup ()
	(visual-line-mode 1)
	(face-remap-add-relative 'variable-pitch :family "Times New Roman" :height 1.5)
	:hook (nov-mode . my-nov-setup)))
;; Epub reading:1 ends here

;; [[file:~/Library/Preferences/Aquamacs%20Emacs/config.org::*Programming%20modes][Programming modes:1]]
;; common bits
(load "common-programming") ; modes for programming
;; Programming modes:1 ends here

;; [[file:~/Library/Preferences/Aquamacs%20Emacs/config.org::*Key%20binding][Key binding:1]]
(mwb-init-load "mwb-init-global-keys")
;; Key binding:1 ends here
