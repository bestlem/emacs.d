;; Control init environment
;; These are speedup and safety changes but note that  Aquamacs has probably already taken most of the time.

;; Elisps and init files have two ways of doing this. One is to put the whole init inside a let block but I want each src block to be runnable from the org file so not good. The other is to set and copy old values at the beginning then use an end hook to put them back. A long term alternative is to make the loader function do that work.
;; The time is probably not that useful - build on Aquamacs instead and there is an emacs profiler.


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




;; This slows things down so for debugging outside init.


(add-hook 'after-init-hook
               (lambda () (setq debug-on-error t)))



;; This is a simple server start - to allow emacsclient from Terminal. There are more complex starters.

(server-start)

;; Remains
;; This is all the includes


;; common bits
(load "setup-packages") ; Package management
(load "common-setup") ; odds mainly variables
(load "common-programming") ; modes for programming

;; Code to do loading
;; Need to get the correct directory

;; Function to load the code for this part of the init.
;; Currently it just loads the .el of that name so could just be (load "load-mwb-init") but eventually it will get the data from load-mwb-init.org and tangle it and use that.

(defun load-mwb-init (file-root)
  "Load the relevant code. Currently just the same as load it loads
<file-root>.el but eventually will load <file-root>.org"
  (load file-root))

(load "mwb-init-global-keys")
