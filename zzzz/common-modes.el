;; $Header: /Volumes/General/link/mark/Library/Emacs/RCS/common-modes.el,v 1.1.1.3 2003/05/26 11:31:26 mark Exp mark $
;; do for OSX only
; elib
;;(setq load-path (append (list "~/emacs/lib")			load-path))

; cvs

;tcl

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


;; python
(autoload 'python-mode "python-mode" "Mode for python")
(setq auto-mode-alist
	  (append '(("\\.py$"  . python-mode)	
				) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist)) 


;; "*Shell command used to start Python interpreter.")
(setq py-python-command (expand-file-name "/usr/local/bin/pythonw" ))


(load "pdb" 'noerror 'nomessage)

(defun my-python-mode-hook ()
  "My Python settings"
  (define-key py-mode-map [return] 'newline-and-indent )
  (define-key py-mode-map [C-return] 'newline )
  (define-key py-mode-map [f5] 'py-execute-region )
)

(add-hook 'python-mode-hook 'my-python-mode-hook)


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

;; xml - nxml-mode-20041004/
(load-library "nxml-mode-20041004/rng-auto.el")
  (setq auto-mode-alist
        (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
	      auto-mode-alist))


;;
; $Log: common-modes.el,v $
; Revision 1.1.1.3  2003/05/26 11:31:26  mark
; clean up
; Python use /usr/local/bin
;