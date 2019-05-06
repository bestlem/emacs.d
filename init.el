;; [[file:~/Library/Preferences/Emacs/config.org::*Startup][Startup:1]]
(defconst emacs-start-time (current-time))

(defvar file-name-handler-alist-old file-name-handler-alist)

(setq package-enable-at-startup nil
	  file-name-handler-alist nil
	  message-log-max 16384
	  gc-cons-threshold 402653184
	  gc-cons-percentage 0.6
	  auto-window-vscroll nil)
;; Startup:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Set%20where%20the%20init%20file%20is][Set where the init file is:1]]
;; Need the directory from here.
(defun mwb-get-directory-of-current-file ()
  "Return the full directory path of the caller's file location."
  (file-name-directory (or load-file-name buffer-file-name))
  )
(defconst mwb-user-emacs-directory (mwb-get-directory-of-current-file))
;; Set where the init file is:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Where%20my%20init%20code%20is][Where my init code is:1]]
(defun mwb-user-emacs-file (name)
	"Return an absolute per-user Emacs-specific file name around where the init file is.
  It is basically locate-user-emacs-file but I have followed Aquiamacs is setting that not where my init.el file is.
  Main reason to use is so that I can put init under version control and the rest go elsewhere."
	(expand-file-name name mwb-user-emacs-directory))
;; Where my init code is:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*The%20loader][The loader:1]]
(defun mwb-init-load (file-root)
  "Load the relevant code. Currently just the same as load it loads
<file-root>.el but eventually will load <file-root>.org"
  (load file-root))
;; The loader:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*The%20Load][The Load:1]]
(mwb-init-load "config")
;; The Load:1 ends here
