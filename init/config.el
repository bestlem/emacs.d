;; [[file:~/Library/Preferences/Emacs/config.org::*After%20initialisation][After initialisation:1]]
(add-hook 'after-init-hook
		  `(lambda ()
			 (setq file-name-handler-alist file-name-handler-alist-old
				   gc-cons-threshold 800000
				   gc-cons-percentage 0.1)
			 (garbage-collect)
			 (message "Emacs init-time %s" (emacs-init-time))) t)
;; After initialisation:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Emacs%20Lisp%20debugging][Emacs Lisp debugging:1]]
(add-hook 'after-init-hook
				(lambda () (setq debug-on-error t)))
; (setq debug-on-error t)
;; Emacs Lisp debugging:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Customisation%20file][Customisation file:1]]
(setq custom-file ( mwb-user-emacs-file "custom/custom.el"))
(load custom-file 'noerror)
;; Customisation file:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Packaging][Packaging:1]]
(load "setup-packages") ; Package management
;; Packaging:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Hydra][Hydra:1]]
(use-package hydra :ensure t)
(use-package use-package-hydra :ensure t)
;; Hydra:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Emacs%20server][Emacs server:1]]
(use-package server
  :ensure nil
  :hook (after-init . server-mode))
;; Emacs server:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Emacs%20behaviour][Emacs behaviour:1]]
;; common bits
(load "common-setup") ; odds mainly variables
;; Emacs behaviour:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Registers][Registers:1]]
(defhydra sk/hydra-registers (:color blue
									 :hint nil)
  "
 _a_: append     _c_: copy-to    _j_: jump       _r_: rectangle-copy   _q_: quit
 _i_: insert     _n_: number-to  _f_: frameset   _w_: window-config
 _+_: increment  _p_: point-to
  "
  ("a" append-to-register)
  ("c" copy-to-register)
  ("i" insert-register)
  ("f" frameset-to-register)
  ("j" jump-to-register)
  ("n" number-to-register)
  ("r" copy-rectangle-to-register)
  ("w" window-configuration-to-register)
  ("+" increment-register)
  ("p" point-to-register)
  ("q" nil :color blue))

(bind-key "M-r" 'sk/hydra-registers/body)
;; Registers:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Sessions][Sessions:1]]
(use-package savehist
  :config
  (setq savehist-additional-variables
		'(kill-ring
		  search-ring
		  regexp-search-ring
		  last-kbd-macro
		  kmacro-ring
		  shell-command-history
		  Info-history-list
		  register-alist))
  (savehist-mode 1))
;; Sessions:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*System%20management][System management:1]]
(mwb-init-load "mwb-init-file-management")
;; System management:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Org%20Mode][Org Mode:1]]
(mwb-init-load "mwb-init-org-mode")
;; Org Mode:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Epub%20reading][Epub reading:1]]
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

;; [[file:~/Library/Preferences/Emacs/config.org::*Programming%20modes][Programming modes:1]]
(mwb-init-load "mwb-init-prog-modes")
;; Programming modes:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Key%20binding][Key binding:1]]
(mwb-init-load "mwb-init-global-keys")
;; Key binding:1 ends here
