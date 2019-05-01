

(setq f "/Users/mark/Library/Preferences/Aquamacs Emacs/t.el")
(message f)

(backup-each-save-filter f)
(make-backup-file-name f )
(normal-backup-enable-predicate f)

(rx
 (or (and "\*" (*? anything) "*/")
	 (and "//" (*? anything) eol)))



(rx
 (or "^/tmp" "emacs.d/data"))


(setq buffer-backed-up nil)
(backup-each-save-compute-location f )
