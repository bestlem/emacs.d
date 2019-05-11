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

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Build%20systems][Build systems:1]]
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
   :diminish
  :config
  (setq gradle-gradlew-executable "./gradlew"
        gradle-use-gradlew t)
  (gradle-mode))
;; Build systems:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Flymake][Flymake:1]]
;;;; flymake - syntax checking
(use-package flymake
  :disabled
  :diminish
  :hook ((sh-mode json-mode nxml-mode python-mode emacs-lisp-mode lisp-interaction-mode) . flymake-mode-on)
  :config (flymake-mode-on))
;; Flymake:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Git][Git:1]]
(mwb-init-load "mwb-init-prog-modes-git")
;; Git:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Lisp][Lisp:1]]
(mwb-init-load "mwb-init-prog-modes-lisp")
;; Lisp:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Python][Python:1]]
(mwb-init-load "mwb-init-prog-modes-python")
;; Python:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*XML][XML:1]]
(defun nxml-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
        (backward-char) (insert "\n"))
      (indent-region begin end))
  (message "Ah, much better!"))
;; XML:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Editing][Editing:1]]
(use-package json-mode
  :ensure t
  :mode "\\.json$")
;; Editing:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*Visualisation][Visualisation:1]]
(use-package json-navigator
  :ensure t)
;; Visualisation:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::*SQL][SQL:1]]
(autoload 'sql "sql-mode"
  "Start the interactive SQL interpreter in a new buffer." t)

(autoload 'sql-mode "sql-mode"
  "Mode for editing SQL files and running a SQL interpreter." t)

(autoload 'sql-buffer "sql-mode"
  "Create or move to the sql-mode \"*SQL commands*\" buffer." t)

(setq auto-mode-alist (cons '("\\.sql$" . sql-mode) auto-mode-alist))
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
