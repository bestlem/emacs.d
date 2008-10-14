;; git

(require 'vc-git)
;; (when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
 (autoload 'git-blame-mode "git-blame"
           "Minor mode for incremental blame for Git." t);; git
;; git://github.com/tsgates/git-emacs.git
(require 'git-emacs)
;; http://zagadka.vm.bytemark.co.uk/magit/magit.html
(autoload 'magit-status "magit" nil t)


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


; modes

;; mail
;(define-mail-abbrev "mark" "mark@bestley.demon.co.uk")

;(add-hook 'mail-setup-hook 'mail-abbrevs-setup)

;; python
(setq load-path      (cons "~/Library/Application Support/Emacs/python-mode-1.0"  load-path ))
;(setq auto-mode-alist	  (append '(("\\.py$"  . python-mode)					) auto-mode-alist))
(require 'ipython)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
;;(autoload 'python-mode "python-mode" "Python editing mode." t)
(require 'ipython)
										;(defvar py-python-command "/LocalDisk/wa/src/app/OBS/CacheServer/product-NeXT-i386-debug/CacheServer -OBSAPP OBSPython"
										; "*Shell command used to start Python interpreter.")


;;(load "pdb" 'noerror 'nomessage)
(require 'pydb)

(defun my-python-mode-hook ()
  "My Python settings"
  (define-key py-mode-map [return] 'newline-and-indent )
  (define-key py-mode-map [C-return] 'newline )
  (define-key py-mode-map [f5] 'py-execute-region )
  (define-key py-mode-map "\C-c\C-c" 'py-execute-region )
 ; (define-key python-mode-map "\C-c\C-c" 'python-send-region )

 ; (define-key python-mode-map "\C-c\C-b" 'python-execute-buffer )
 ; (define-key python-mode-map "\C-m" 'newline-and-indent)
(message "In python mode hook" )
)

(add-hook 'python-mode-hook 'my-python-mode-hook)


;(setq py-python-command (expand-file-name "/usr/local/bin/python" ))
;(define-key c-mode-map [return] 'newline-and-indent )
;(define-key c-mode-map [C-return] 'newline )


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



