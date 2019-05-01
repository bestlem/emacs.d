;; TODO Trash
;; MacOs needs specific trash management not just mv to ~/.Trash
;; Perhaps only if in dired or other user controlled file
;; See [[https://github.com/lunaryorn/osx-trash.el][osx-trash]] but might need to find /opt/local/bin/trash
;; Or better patch Aquamacs to have this C code - perhaps done?
;; Need also to exclude some files - basically only iof you edit them



;; TODO Compressed files

;; Transparently open compressed files
(auto-compression-mode t)

;; Old commented out code - need to review

;;  --- uncompress *.Z and *.gz files when visiting ---
;;
;; (autoload 'uncompress-while-visiting "uncompress"
;;   "Temporary \"major mode\" used for .Z and .gz files, to uncompress them.")
;; (setq auto-mode-alist
;; 	  (cons '("\\.Z$" . uncompress-while-visiting) auto-mode-alist))
;; (setq auto-mode-alist
;; 	  (cons '("\\.gz$" . uncompress-while-visiting) auto-mode-alist))
;; (setq auto-mode-alist
;;       (cons '("\\.tgz$" . uncompress-while-visiting) auto-mode-alist))

;; Backups
;; Literate programming suggests each setq should be in a separate block - see later but EOL comment changes where closing parenthesis is maybe better copy code iif we had a macro to do this.
;; This set of variables is from [[https://www.emacswiki.org/emacs/ForceBackups][Emacs Wiki - Force Backup]] but that is not the best explanation. The version numbers are explained better elsewhere

;; Need to look in customisation as some things are easier to edit there . e,g, the list for where backup files are. Currently I do to the current directory/.~ which no one's init files seem to have but then found ity in Emacs manual: 🤣😳
;; The best inits I found for this were [[http://pragmaticemacs.com/emacs/auto-save-and-backup-every-save/][Pragmatic Emacs]] and [[https://github.com/jwiegley/dot-emacs/blob/master/init.el][developer of use package]]  which build on [[https://www.emacswiki.org/emacs/ForceBackup][Emacs Wiki Force Backups]]

(setq
 backup-by-copying t     ;  Copy all files, don't rename them and don't clobber symlinks
 kept-new-versions 10    ; keep 10 latest versions
 kept-old-versions 0     ; don't bother with old versions
 delete-old-versions t   ; don't ask about deleting old versions
 version-control t       ; number backups
 vc-make-backup-files t) ; backup version controlled files

;; DO the backups
;; Aquamacs seems to turn this off sometimes in customization so need to investigate more

(setq make-backup-files t)

;; Backup on save
;;  Emacs is odd backups are started when loaded in a session and then not again (I suppose that is what auto save is for) but really we want a copy taken when saved as well.
;;  All the logs are very clever but what I want is the version number to increase so just see [[https://stackoverflow.com/a/9452080/151019][this SO answer]] I have modified it so that only saves on m,ac save ie when you manually save - possibly not good on emacs exit.
;;  Note need to change
;;  Filters are interesting for other reasons

(defun mwb/mac-key-save-buffer-force-backup ()
  (interactive)
  "Save buffer. If needed, select file by dialog"
  (if buffer-file-name
	  (save-buffer 16)
	(mac-key-save-file-as)))

(define-key osx-key-mode-map [remap mac-key-save-file]  'mwb/mac-key-save-buffer-force-backup)

;; TODO Recent Files
;;  Should be a customise but Aquamets sets it so keeps adding to it pr does it need to check
;;  Exclusion regexes from [[https://www.reddit.com/r/emacs/comments/3g468d/stop_recent_files_showing_elpa_packages/][reddit]]

;; Problem is this is set after the recent files are set https://emacs.stackexchange.com/questions/48784/recent-files-in-aquamacs
;;  Seems to be OK

(setq recentf-exclude (append recentf-exclude
							  '("^/var/folders\\.*"
								"COMMIT_EDITMSG\\'"
								".*-autoloads\\.el\\'"
								"[/\\]\\.elpa/"
								)))

;; Projectile
;; This add functions. I would use John Wiegley's setup but projectile hung
;; So take from projectile

(use-package
  projectile
  :ensure t
  :pin melpa-stable
  :config (define-key projectile-mode-map (kbd "H-p")
			'projectile-command-map)
  (projectile-mode 1))

;; Matcha hydra
;;  I really do not want all but for ease just do it from [[https://github.com/jojojames/matcha][Matcha]]

(defhydra matcha-projectile (:color blue :hint nil :idle 0)
  "

    Files             Search          Buffer             Do
  ------------------------------------------------------------------------------
    _f_ File          _a_ Ag          _b_ Switch        _g_ Magit
    _l_ File dwim     _A_ Grep        _v_ Display       _P_ Commander
    _r_ Recent file   _s_ Occur       _i_ IBuffer       _I_ Info
    _d_ Dir           _S_ Replace     _K_ Kill all      _p_ Switch Project
    _o_ Other         _t_ Find Tag
    _u_ Test file     _T_ Make Tags
    _h_ Root          _R_ Replace Regexp
    Other Window      Run             Cache
  ------------------------------------------------------------------------------
    _F_ File          _U_ Test        _kc_ Clear
    _L_ Dwim          _m_ Compile     _kk_ Add Current
    _D_ Dir           _c_ Shell       _ks_ Cleanup
    _O_ Other         _C_ Command     _kd_ Remove
    _B_ Buffer
"
  ("a" projectile-ag)
  ("A" projectile-grep)
  ("b" projectile-switch-to-buffer)
  ("B" projectile-switch-to-buffer-other-window)
  ("c" projectile-run-async-shell-command-in-root)
  ("C" projectile-run-command-in-root)
  ("d" projectile-find-dir)
  ("D" projectile-find-dir-other-window)
  ("f" projectile-find-file)
  ("F" projectile-find-file-other-window)
  ("g" projectile-vc)
  ("h" projectile-dired)
  ("I" projectile-project-info)
  ("kc" projectile-invalidate-cache)
  ("kd" projectile-remove-known-project)
  ("kk" projectile-cache-current-file)
  ("K" projectile-kill-buffers)
  ("ks" projectile-cleanup-known-projects)
  ("l" projectile-find-file-dwim)
  ("L" projectile-find-file-dwim-other-window)
  ("m" projectile-compile-project)
  ("o" projectile-find-other-file)
  ("O" projectile-find-other-file-other-window)
  ("p" projectile-switch-project)
  ("P" projectile-commander)
  ("r" projectile-recentf)
  ("R" projectile-replace-regexp)
  ("s" projectile-multi-occur)
  ("S" projectile-replace)
  ("t" projectile-find-tag)
  ("T" projectile-regenerate-tags)
  ("u" projectile-find-test-file)
  ("U" projectile-test-project)
  ("v" projectile-display-buffer)
  ("i" projectile-ibuffer))

;; Treemacs
;; This is the visual

;; Treemacs
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
		  ("pp" matcha-projectile/body "Projectile" )
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
