;;  simpler init

;;  need packages but loads them anyway

;;  This version is for emacs 28 set up which seems to bre$ak use packages
(setq debug-on-error 't)


(defconst mwb-user-emacs-directory  "/Users/mark/.emacs.d/")
(defun mwb-user-emacs-file (name)
  "Return an absolute per-user Emacs-specific file name around where the init file is.
  It is basically locate-user-emacs-file but I have followed Aquamacs is setting that not where my init.el file is.
  Main reason to use is so that I can put init under version control and the rest go elsewhere."
  (expand-file-name name mwb-user-emacs-directory))

(require 'package)

;; Defined in Emacs 27 and above.
(defvar package-quickstart)

;; common code
;;  package-archives is an assoc so dups don't matter just look at the front
(setq package-archives '())
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))


(setq package-quickstart t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (setq use-package-enable-imenu-support t)
  (require 'use-package)
  (setq bind-key-describe-special-forms t
        use-package-enable-imenu-support t)
  (if init-file-debug
      (setq use-package-verbose t
            use-package-expand-minimally nil
            use-package-compute-statistics t)
    (setq use-package-verbose nil
          use-package-expand-minimally t)))

(use-package lispy
  :ensure t
  :config
  :hook (emacs-lisp . lispy-mode)
  :init
  (setq
   lispy-safe-copy t
   lispy-safe-paste t
   lispy-safe-delete t
   lispy-safe-actions-no-pull-delimiters-into-comments t
   ))
