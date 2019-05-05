;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Highlight%20indents][Highlight indents:1]]
(use-package highlight-indent-guides
  :ensure t
  :diminish highlight-indent-guides-mode
  :config
  (setq highlight-indent-guides-method 'fill)
  ;; Indent character samples: ┃| ┆ ┊
  (setq highlight-indent-guides-character ?\┃)
  (setq highlight-indent-guides-auto-odd-face-perc 50)
  (setq highlight-indent-guides-auto-even-face-perc 20)
  (setq highlight-indent-guides-auto-character-face-perc 20)
  :hook (prog-mode . highlight-indent-guides-mode))
;; Highlight indents:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Aggressive%20indent][Aggressive indent:1]]
;;  Aggressive indent make indents as you type
(use-package
  aggressive-indent
  :ensure t
  :hook (emacs-lisp-mode . aggressive-indent-mode))
;; Aggressive indent:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Whitespace%20at%20end%20of%20line][Whitespace at end of line:1]]
(use-package ws-butler
  :ensure t
  :diminish ws-butler-mode
  :hook ((prog-mode org-mode) . ws-butler-mode ))
;; Whitespace at end of line:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Flymake][Flymake:1]]
;;;; flymake - syntax checking
(use-package flymake
  :disabled
  :diminish
  :hook ((sh-mode json-mode nxml-mode python-mode emacs-lisp-mode lisp-interaction-mode) . flymake-mode-on)
  :config (flymake-mode-on))
;; Flymake:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Completion][Completion:1]]
;;  Start completion
(use-package
  company
  :ensure t
  :config (add-hook
		   'after-init-hook
		   'global-company-mode))
;; Completion:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Lisp][Lisp:1]]
(mwb-init-load "mwb-init-lisp")
;; Lisp:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Build%20systems][Build systems:1]]
(load "setup-java-env")
;; Build systems:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Python][Python:1]]
(load "setup-python")
;; Python:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Git][Git:1]]
(load "setup-git")
;; Git:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Structured%20data][Structured data:1]]
(load "setup-structured-data.el")
;; Structured data:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*SQL][SQL:1]]
(load "setup-sql")
;; SQL:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*C][C:1]]
;; objective C
(add-to-list 'auto-mode-alist '("\\.h$" . objc-mode) )
(add-to-list 'auto-mode-alist '("\\.m$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.mm$" . objc-mode))
;; C:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Perl][Perl:1]]
(setq auto-mode-alist
	  (cons '("\\.pl$" . perl-mode) auto-mode-alist))
(setq auto-mode-alist
	  (cons '("\\.pm$" . perl-mode) auto-mode-alist))

;; set keys
;(load-library "perldb")

(defun my-perl-mode-hook ()
  "My Perl settings"
  (define-key perl-mode-map [return] 'newline-and-indent )
  (define-key perl-mode-map [C-return] 'newline )
  (setq perl-indent-level 4)
  (setq perl-continued-statement-offset 4)
  (setq perl-continued-brace-offset -4)
  (setq perl-brace-offset 0)
  (setq perl-brace-imaginary-offset 0)
  (setq  perl-label-offset -2)
  (define-key perl-mode-map [f3] 'perldb )
;  (setq perldb-command-name "/run/pd/packages/perl/5.003/bin/perl")
;  (setq perldb-command-name "/sbcimp/run/pd/perl/prod/bin/perl")
  )
(add-hook 'perl-mode-hook 'my-perl-mode-hook)

;; perl debug
;; (defun my-perldb-mode-hook ()
;;   (setq perldb-command-name "/run/pd/packages/perl/5.003/bin/perl")
;; )
;; (add-hook 'perldb-mode-hook 'my-perldb-mode-hook)
;; Perl:1 ends here
