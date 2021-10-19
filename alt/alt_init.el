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
(use-package dash
  :ensure t
  :demand
  :config
  (global-dash-fontify-mode))
(use-package ht :ensure t :demand )

(defmacro use-feature (name &rest args)
  (declare (indent 1))
  `(use-package ,name
     ,@args))
(defmacro use-package-elpa (name &rest args)
  (declare (indent 1))
  `(use-package ,name
	 :ensure t
     ,@args))
(defun mwb-insert-before-element (find-element new-element list)
  "Find FIND-ELEMENT and then insert NEW-ELEMENT before it in LIST."
  (let ((i (-elem-index find-element list)))
    (-insert-at i new-element list)))

(defun use-package-normalize-mwb-paths (label arg &optional recursed)
  "Normalize a list of filesystem paths."
  (cond
   ((and arg (or (use-package-non-nil-symbolp arg) (functionp arg)))
    (let ((value (use-package-normalize-value label arg)))
      (use-package-normalize-paths label (eval value))))
   ((stringp arg)
    (let ((path (if (file-name-absolute-p arg)
                    arg
                  (mwb-user-emacs-file arg))))
      (list path)))
   ((and (not recursed) (listp arg) (listp (cdr arg)))
    (mapcar #'(lambda (x)
                (car (use-package-normalize-paths label x t))) arg))
   (t
    (use-package-error
     (concat label " wants a directory path, or list of paths")))))


;;;; :mwb-load-path

(defun use-package-normalize/:mwb-load-path (_name keyword args)
  (use-package-as-one (symbol-name keyword) args
    #'use-package-normalize-mwb-paths))

(defun use-package-handler/:mwb-load-path (name _keyword arg rest state)
  (use-package-handler/:load-path name _keyword arg rest state))

(setq use-package-keywords
      (mwb-insert-before-element :load-path :mwb-load-path  use-package-keywords))

(defun add-subdirs-to-load-path ()
  "Add subdirectories to `load-path'."
  (interactive)
  (let ((default-directory (mwb-user-emacs-file "site-lisp")))
    (normal-top-level-add-subdirs-to-load-path)))

(add-to-list 'load-path (mwb-user-emacs-file "site-lisp"))
(add-subdirs-to-load-path)
(setq mwb-init-customize-directory (mwb-user-emacs-file "settings/"))
(use-package macrostep
  :ensure t
  
  :hook (before-save . macrostep-collapse-all)

  :commands (macrostep-expand
			 macrostep-mode)
  ;;:config (set macrostep-expand-in-separate-buffer t)
  :bind
  (:map emacs-lisp-mode-map
		("C-c C-e" . macrostep-expand))
  (:map lisp-interaction-mode-map
		("C-c C-e" . macrostep-expand)))


(use-package iso-transl-override
  :mwb-load-path "site-lisp/aquamacs"
  :config
  (iso-transl-override-mode -1))

(use-package modus-themes
  :ensure t
  ;; :mwb-load-path "fork/modus-themes"
  :demand
  :custom
  (modus-themes-italic-constructs t)
  (modus-themes-slanted-constructs t)
  (modus-themes-variable-pitch-headings t)
  (modus-themes-bold-constructs nil)
  (modus-themes-region '(bg-only accented))
  (modus-themes-completions 'opinionated)
  (modus-themes-fringes 'intense)
  (modus-themes-mode-line 'borderless)
  (modus-themes-org-blocks 'rainbow)
  (modus-themes-paren-match 'intense-bold)
  (modus-themes-prompts 'intense)
  (modus-themes-scale-headings t)
  (modus-themes-syntax 'yellow-comments)

  :init
  ;;  This is lists of lists so set here not custom
  (setq modus-themes-headings
        '((t . rainbow-section)))

  ;; (setq modus-themes-region '())     ; the default

  ;; Enable the theme files only as local
  ;; (use-package modus-operandi-theme)
  ;; (use-package modus-vivendi-theme)
  (modus-themes-load-themes)
  :config
  ;; Load the theme of your choice
  (modus-themes-load-vivendi)
  )
