
;; Move files to trash when deleting
;; Needs osx trash help

;; Transparently open compressed files
(auto-compression-mode t)

;; backups from https://www.emacswiki.org/emacs/ForceBackups et al
(setq version-control t ;; Use version numbers for backups.
	  kept-new-versions 10 ;; Number of newest versions to keep.
	  kept-old-versions 0 ;; Number of oldest versions to keep.
	  delete-old-versions t ;; Don't ask to delete excess backup versions.
	  backup-by-copying t ;; Copy all files, don't rename them.
	  vc-make-backup-files t ;; even if under version control
	  )

;;  backup directory is .~ set in cusomisation

;;recent files f
;; Should be a customise but Aquamets sets it so keeps adding to it
;; from https://www.reddit.com/r/emacs/comments/3g468d/stop_recent_files_showing_elpa_packages/
;; Problem is this is set after the recent files are set https://emacs.stackexchange.com/questions/48784/recent-files-in-aquamacs
;;  Seems to be OK

(setq recentf-exclude (append recentf-exclude
			  '("^/var/folders\\.*"
				"COMMIT_EDITMSG\\'"
				".*-autoloads\\.el\\'"
				"[/\\]\\.elpa/"
				)))

;;; dired

;; Tremacs
;;  first pass has all defaults even if not needed
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs (if (executable-find "python3") 3 0)
		  treemacs-display-in-side-window t
		  treemacs-is-never-other-window nil
		  treemacs-no-delete-other-windows t)

	(add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?)
    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))
	)
  :hydra (mwb/hydra-treemacs-mode
		  (:color teal)
		  ""
		  ("pc" treemacs-add-project-to-workspace "Create Project")
		  ("pd" treemacs-remove-project-from-workspace  "Delete Project")
		  ("q" nil "cancel"))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag))
  (:map treemacs-mode-map
		("H-a" . mwb/hydra-treemacs-mode/body)))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

;; treemacs helpful hydra isn't as key-display can't deal with the modifier keys
;; Plus ^p is not a good key for a modeumacs enhances it)
