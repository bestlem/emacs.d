;; Control init environment
;; These are speedup and safety changes but note that  Aquamacs has probably already taken most of the time.

;; Elisps and init files have two ways of doing this. One is to put the whole init inside a let block but I want each src block to be runnable from the org file so not good. The other is to set and copy old values at the beginning then use an end hook to put them back. A long term alternative is to make the loader function do that work.
;; The time is probably not that useful - build on Aquamacs instead and there is an emacs profiler. I did get the Aquamacs nightly and that is much slower and displaying menus is an issue. I have changed accessibility in System Preferences->Privacy so we will see. Probably wait until mMacs 27 is out and use a plain emacs and see about spell checking
;; The file-name-handler-alist is probably needed as some of the hooks slow things heavily

;; This is from [[ https://github.com/jwiegley/dot-emacs/blob/master/init.el#L1013][John Wiegley]]

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

;; Emacs Lisp debugging
;;  This slows things down so for debugging outside init.
;; But for debugging init


(add-hook 'after-init-hook
			   (lambda () (setq debug-on-error t)))
(setq debug-on-error t)

;; Code to do loading
;;   Need to get the correct directory

;;   Function to load the code for this part of the init.
;;   Currently it just loads the .el of that name so could just be (load "load-mwb-init"). I now tangle all org-mode buffers on save. Eventually it will get the data from load-mwb-init.org and tangle it and use that.

;;   See [[http://ergoemacs.org/emacs/organize_your_dot_emacs.html][Xah Lee get directory name for file]] for possible work around for user-emacs-directory

(defun load-mwb-init (file-root)
  "Load the relevant code. Currently just the same as load it loads
<file-root>.el but eventually will load <file-root>.org"
  (load file-root))

;; Packaging
;; Old elisp

(load "setup-packages") ; Package management

;; Emacs server
;;  This is a simple server start - to allow emacsclient from Terminal. There are more complex starters.

(server-start)

;; Emacs behaviour
;; General emacs stuff - not common-setup used to have this but separate file might not make sense

(load-mwb-init "mwb-init-file-management")

;; New ones

(load-mwb-init "mwb-init-org-mode")

;; remains

;; common bits
(load "common-setup") ; odds mainly variables
(load "common-programming") ; modes for programming

;; The new versions to be loaded
;; No comments as just open the files.

(load-mwb-init "mwb-init-global-keys")
