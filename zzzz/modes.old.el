
; elib
(setq load-path (append (list "~/emacs/lib")
			load-path))

; cvs

;tcl

(defun my-tcl-mode-hook ()
  "My Tcl settings"
  (define-key tcl-mode-map [M-return] 'tcl-send-current-line)
  )

(add-hook 'tcl-mode-hook 'my-tcl-mode-hook)

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
  (setq perldb-command-name "/sbcimp/run/pd/perl/prod/bin/perl")
  )
(add-hook 'perl-mode-hook 'my-perl-mode-hook)

;; perl debug
(defun my-perldb-mode-hook ()
  (setq perldb-command-name "/run/pd/packages/perl/5.003/bin/perl")
)
(add-hook 'perldb-mode-hook 'my-perldb-mode-hook)



; load libraries 

(defun my-fonts()
  "Hilite and fonts stuff"
;;(require 'emacs-vers)
  (require 'font-lock)
  (global-font-lock-mode t)
  (setq font-lock-support-mode 'fast-lock-mode)
  (custom-set-variables
   '(resize-minibuffer-window-max-height 0)
   '(show-paren-mode t nil (paren)))
  (custom-set-faces)
  )

(my-fonts) 

; modes

;; mail
;(define-mail-abbrev "mark" "mark@bestley.demon.co.uk")

;(add-hook 'mail-setup-hook 'mail-abbrevs-setup)

;; python
(autoload 'python-mode "python-mode" "Mode for python")
(setq auto-mode-alist
	  (append '(("\\.py$"  . python-mode)	
				) auto-mode-alist))

										;(defvar py-python-command "/LocalDisk/wa/src/app/OBS/CacheServer/product-NeXT-i386-debug/CacheServer -OBSAPP OBSPython"
										; "*Shell command used to start Python interpreter.")


(load "pdb" 'noerror 'nomessage)

(defun my-python-mode-hook ()
  "My Python settings"
  (define-key py-mode-map [return] 'newline-and-indent )
  (define-key py-mode-map [C-return] 'newline )
  (define-key py-mode-map [f5] 'py-execute-region )
)

(add-hook 'python-mode-hook 'my-python-mode-hook)


(setq py-python-command (expand-file-name "/sw/bin/python" ))
;(define-key c-mode-map [return] 'newline-and-indent )
;(define-key c-mode-map [C-return] 'newline )



;(setq gnus-select-group-hook
;	  '(lambda ()
;		 ;; First of all, sort by date.
;		 (gnus-keysort-headers
;		  (function string-lessp)
;		  (function
;		   (lambda (a)
;			 (gnus-sortable-date (gnus-header-date a)))))
;		 ;; Then sort by subject ignoring `Re:'.
;		 (gnus-keysort-headers
;		  (function string-lessp)
;		  (function
;		   (lambda (a)
;			 (if case-fold-search
;				 (downcase (gnus-simplify-subject (gnus-header-subject a) t))
;			   (gnus-simplify-subject (gnus-header-subject a) t)))))
;		 ))

;; OOBR
;; OO browser
;(setq br-directory "~/emacs/oobr/")

;(load "~/emacs/oobr/hypb/hversion")

;(autoload 'oobr "~/emacs/oobr/br-start" "Invoke the OO-Browser" t)
;(autoload 'br-env-browse "~/emacs/oobr/br-start"
;  "Browse an existing OO-Browser Environment" t)

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
;;
;;  --- file tree browser (start with M-x browse)
;;
(autoload 'browse "filebrowser" "File and directory tree browser" t)
;;
;;  --- uncompress *.Z and *.gz files when visiting ---
;;
(autoload 'uncompress-while-visiting "uncompress"
  "Temporary \"major mode\" used for .Z and .gz files, to uncompress them.")
(setq auto-mode-alist
	  (cons '("\\.Z$" . uncompress-while-visiting) auto-mode-alist))
(setq auto-mode-alist
	  (cons '("\\.gz$" . uncompress-while-visiting) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.tgz$" . uncompress-while-visiting) auto-mode-alist))

;;
;;  --- HTML-mode
;;
;;
;;  --- csh-mode
;;
(autoload 'csh-mode "csh-mode" "Major mode for editing csh scripts." t)
(setq auto-mode-alist
      (cons '("\\.csh$" . csh-mode)
	    (cons '("\\.sh$" . csh-mode)
		  (cons '("\\.cshrc$" . csh-mode)
			(cons '("\\.login$" . csh-mode) auto-mode-alist)))))
;;


;;;### (autoloads (cvs-edit) "cvs-edit" "cvs-edit.el" (14530 53861))
;;; Generated autoloads from cvs-edit.el

(autoload (quote cvs-edit) "cvs-edit" "\
Setup a buffer to enter a log message.
The buffer will be put in `cvs-edit-mode'.
If SETUP is non-nil, the buffer is then erased and `cvs-edit-hook' is run.
Mark and point will be set around the entire contents of the
buffer so that it is easy to kill the contents of the buffer with \\[kill-region].
Once you're done editing the message, pressing \\[cvs-edit-done] will call
`cvs-edit-done' which will end up calling CALLBACK to do the actual commit." nil nil)

;;;***

;;;### (autoloads nil "cvs-log" "cvs-log.el" (14528 10081))
;;; Generated autoloads from cvs-log.el

(autoload (quote cvs-log-mode) "cvs-log" "\
Major mode for browsing CVS log output." t)

;;;***

;;;### (autoloads nil "cvs-status" "cvs-status.el" (14530 53861))
;;; Generated autoloads from cvs-status.el

(autoload (quote cvs-status-mode) "cvs-status" "\
Mode used for cvs status output." t)

;;;***

;;;### (autoloads (cvs-dired-use-hook cvs-dired-action cvs-status
;;;;;;  cvs-update cvs-examine cvs-checkout) "pcl-cvs" "pcl-cvs.el"
;;;;;;  (14584 37084))
;;; Generated autoloads from pcl-cvs.el

(autoload (quote cvs-checkout) "pcl-cvs" "\
Run a 'cvs checkout MODULES' in DIR.
Feed the output to a *cvs* buffer, display it in the current window,
and run `cvs-mode' on it.

With a prefix argument, prompt for cvs FLAGS to use." t nil)

(autoload (quote cvs-examine) "pcl-cvs" "\
Run a `cvs -n update' in the specified DIRECTORY.
That is, check what needs to be done, but don't change the disc.
Feed the output to a *cvs* buffer and run `cvs-mode' on it.
With a prefix argument, prompt for a directory and cvs FLAGS to use.
A prefix arg >8 (ex: \\[universal-argument] \\[universal-argument]),
  prevents reuse of an existing *cvs* buffer.
Optional argument NOSHOW if non-nil means not to display the buffer." t nil)

(autoload (quote cvs-update) "pcl-cvs" "\
Run a `cvs update' in the current working DIRECTORY.
Feed the output to a *cvs* buffer and run `cvs-mode' on it.
With a prefix argument, prompt for a directory and cvs FLAGS to use.
A prefix arg >8 (ex: \\[universal-argument] \\[universal-argument]),
  prevents reuse of an existing *cvs* buffer." t nil)

(autoload (quote cvs-status) "pcl-cvs" "\
Run a `cvs status' in the current working DIRECTORY.
Feed the output to a *cvs* buffer and run `cvs-mode' on it.
With a prefix argument, prompt for a directory and cvs FLAGS to use.
A prefix arg >8 (ex: \\[universal-argument] \\[universal-argument]),
  prevents reuse of an existing *cvs* buffer.
Optional argument NOSHOW if non-nil means not to display the buffer." t nil)

(add-to-list (quote completion-ignored-extensions) "CVS/")

(defvar cvs-dired-action (quote cvs-examine) "\
The action to be performed when opening a CVS directory.
Sensible values are `cvs-examine' and `cvs-status'.")

(defvar cvs-dired-use-hook (quote (4)) "\
Whether or not opening a CVS directory should run PCL-CVS.
NIL means never do it.
ALWAYS means to always do it unless a prefix argument is given to the
  command that prompted the opening of the directory.
Anything else means to do it only if the prefix arg is equal to this value.")

(defadvice dired-noselect (around pcl-cvs-dired activate) (let* ((arg (ad-get-arg 0)) (dir (and (stringp arg) (directory-file-name arg)))) (if (and dir (string= "CVS" (file-name-nondirectory dir)) (file-readable-p (expand-file-name "Entries" dir)) cvs-dired-use-hook (if (eq cvs-dired-use-hook (quote always)) (not current-prefix-arg) (equal current-prefix-arg cvs-dired-use-hook))) (save-excursion (setq ad-return-value (funcall cvs-dired-action (file-name-directory dir) t t))) ad-do-it)))

;;;***

;;;### (autoloads nil "pcl-cvs-defs" "pcl-cvs-defs.el" (14528 10081))
;;; Generated autoloads from pcl-cvs-defs.el

(if (progn (condition-case nil (require (quote easymenu)) (error nil)) (fboundp (quote easy-menu-add-item))) (easy-menu-add-item nil (quote ("tools")) (quote ("PCL CVS" ["Update Directory" cvs-update t] ["Examine Directory" cvs-examine t] ["Status Directory" cvs-status t] ["Checkout Module" cvs-checkout t])) "vc"))

;;;***

