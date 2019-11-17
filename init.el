;; [[file:~/.emacs.d/config.org::*Startup][Startup:1]]
(defconst emacs-start-time (current-time))

(defvar file-name-handler-alist-old file-name-handler-alist)

(setq package-enable-at-startup nil
	  file-name-handler-alist nil
	  message-log-max 16384
	  gc-cons-threshold 402653184
	  gc-cons-percentage 0.6
	  auto-window-vscroll nil)
;; Startup:1 ends here

;; [[file:~/.emacs.d/config.org::*Debug%20flag][Debug flag:1]]
(setq init-file-debug nil)
;; Debug flag:1 ends here

;; [[file:~/.emacs.d/config.org::*Set%20where%20the%20init%20file%20is][Set where the init file is:1]]
;; Need the directory from here.
(defun mwb-get-directory-of-current-file ()
  "Return the full directory path of the caller's file location."
  (file-name-directory (or load-file-name buffer-file-name))
  )
(defconst mwb-user-emacs-directory (mwb-get-directory-of-current-file))
;; Set where the init file is:1 ends here

;; [[file:~/.emacs.d/config.org::*Where%20my%20init%20code%20is][Where my init code is:1]]
(defun mwb-user-emacs-file (name)
	"Return an absolute per-user Emacs-specific file name around where the init file is.
  It is basically locate-user-emacs-file but I have followed Aquiamacs is setting that not where my init.el file is.
  Main reason to use is so that I can put init under version control and the rest go elsewhere."
	(expand-file-name name mwb-user-emacs-directory))
;; Where my init code is:1 ends here

;; [[file:~/.emacs.d/config.org::*The%20loader][The loader:1]]
(defun mwb-init-load (file-root)
  "Load the relevant code. Currently just the same as load it loads
	  <file-root>.el but eventually will load <file-root>.org"
  (let* ((org-file
		  (concat (expand-file-name file-root mwb-user-emacs-directory) ".org"))
		 (el-file
		  (concat (expand-file-name file-root mwb-user-emacs-directory) ".el")))

	(when (file-newer-than-file-p org-file el-file)
	  (require 'org)
	  (message "This loaded an org mode but from the system - best to restart")
	  (message "tangle <%s> to <%s>" org-file el-file)
	  (org-babel-tangle-file org-file el-file))

	(condition-case err
		(load el-file)
	  (error (message "Error loading %s: \"%s\""
					  file-root
					  (error-message-string err))
			 nil))))
;; The loader:1 ends here

;; [[file:~/.emacs.d/config.org::*The%20Load][The Load:1]]
(mwb-init-load "config")
;; The Load:1 ends here
