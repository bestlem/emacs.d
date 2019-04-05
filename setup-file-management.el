
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


;;recent files f
;; Should be a customise but Aquamets sets it so keeps adding to it
;; from https://www.reddit.com/r/emacs/comments/3g468d/stop_recent_files_showing_elpa_packages/
;; Problem is this is set after the recent files are set https://emacs.stackexchange.com/questions/48784/recent-files-in-aquamacs

(setq recentf-exclude (append recentf-exclude
			  '("^/var/folders\\.*"
				"COMMIT_EDITMSG\\'"
				".*-autoloads\\.el\\'"
				"[/\\]\\.elpa/"
				)))


;;; dired

;; (use-package crux
;;   )
