
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
  :hook ( prog-mode . highlight-indent-guides-mode))

;;  Aggressive indent make indents as you type
(use-package
  aggressive-indent
  :ensure t
  :hook (emacs-lisp-mode . aggressive-indent-mode))

;; kill whitespace at end of edited line
(use-package ws-butler
  :ensure t
  :diminish ws-butler-mode
  :hook ((prog-mode org-mode) . ws-butler-mode ))

(electric-indent-mode +1)

;;;; flymake - syntax checking
(use-package flymake
  :diminish
  :hook ((sh-mode json-mode nxml-mode python-mode emacs-lisp-mode lisp-interaction-mode) . flymake-mode-on)
  :config (flymake-mode-on))

(load "setup-lisp-env")
(load "setup-java-env")
(load "setup-python")
(load "setup-git")
(load "setup-structured-data.el")

;;; SQL
(autoload 'sql "sql-mode"
  "Start the interactive SQL interpreter in a new buffer." t)

(autoload 'sql-mode "sql-mode"
  "Mode for editing SQL files and running a SQL interpreter." t)

(autoload 'sql-buffer "sql-mode"
  "Create or move to the sql-mode \"*SQL commands*\" buffer." t)

(setq auto-mode-alist (cons '("\\.sql$" . sql-mode) auto-mode-alist))

;; objective C
(add-to-list 'auto-mode-alist '("\\.h$" . objc-mode) )
(add-to-list 'auto-mode-alist '("\\.m$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.mm$" . objc-mode))

;(defun my-objc-hook ()
;  "Ny objc-settings"
;;   (define-key py-mode-map [return] 'newline-and-indent )
;;   (define-key py-mode-map [C-return] 'newline )
;)
;; perl
;; perl mode set up

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

;;
(autoload 'hscroll-mode "hscroll"
  "In HScroll mode, truncated lines will automatically scroll left or right
when point gets near either edge of the window."
  t)
;;
;;  --- make unique buffer names dependent on pathname
;;
;(load "uniquify")
;;
;;
;;  --- uncompress *.Z and *.gz files when visiting ---
;;
;; (autoload 'uncompress-while-visiting "uncompress"
;;   "Temporary \"major mode\" used for .Z and .gz files, to uncompress them.")
;; (setq auto-mode-alist
;; 	  (cons '("\\.Z$" . uncompress-while-visiting) auto-mode-alist))
;; (setq auto-mode-alist
;; 	  (cons '("\\.gz$" . uncompress-while-visiting) auto-mode-alist))
;; (setq auto-mode-alist
;;       (cons '("\\.tgz$" . uncompress-while-visiting) auto-mode-alist))



(load "setup-haskell-env")

;; (smart-tabs-insinuate 'c 'c++ 'java 'javascript 'cperl 'python
;; 					  'ruby 'nxml)
