


;; set up files and soft links
(setq find-file-visit-truename t)	; visit a file under its true name
(setq backup-by-copying-when-linked t)	; be careful with hard links

(setq find-file-existing-other-name t)

;;Setting the first one does what you want, but sometimes is fooled by an
;;over-zealous automounter.  Setting the second variable instead solves
;;those problems.  YMMV.


(defun dos-to-unix ()
  "Replace \r\n with \n"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    ( replace-string "\r\n" "\n" )))


;; ODDS
;; ^k does line
(setq kill-whole-line t)

; sh-insert
; replace by pc-select
;(load-library "s-region")
;(delete-selection-mode t)      ; Typing replaces section

; emACs server
;(server-start)

;; remove toolbar
(tool-bar-mode nil)

; do not add blank lines by arrow down
(setq next-line-add-newlines nil)

; show both paren - remove as slow
(require 'paren)

; show line number in mode
(setq line-number-mode 1)

; --- highlight words during query replacement ---
;
(setq query-replace-highlight t)
; --- incremental search highlights the current match ---
;
(setq search-highlight t)
; --- resize the minibuffer so its entire contents are visible ---
;
; From NS a different way

;


;
; --- vertical motion starting at end of line keeps to ends of lines ---
;
(setq track-eol t)
(setq truncate-lines t)

;
; --- deactivate the mark when the buffer contents change ---
;
(setq transient-mark-mode t)


;;; Suppress startup message.
(setq inhibit-startup-message t)

;;; Enable eval-expression function.
(put 'eval-expression 'disabled nil)

;;; Ask for time and date in the mode line.
;(setq process-connection-type nil)	; try not to hog a pty for this.
(setq display-time-day-and-date nil)
(setq display-time-interval 60)		; seconds
(setq display-time-24hr-format t)
(display-time)

					; backups
(setq make-backup-files 'backup-by-copying-when-linked)
(setq version-control t)
(setq delete-old-versions t)

; tabs
(setq-default tab-width 4)
(setq-default tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100))

; fonts allow italic/bold in courier:(
;(setq ns-convert-font-trait-alist
;           '(("Courier" "Courier-Bold" "Courier-Oblique"
;              "Courier-BoldOblique")))

; colours



;;; Some simple handy functions.
(defun replace-in-string (s pat r)
  "(replace-in-string STRING PATTERN REPLACEMENT)
Replace occurrences of PATTERN with REPLACEMENT in STRING.
Return the newly formed string.
Use temporary buffer *temp*."
  (save-excursion
    (set-buffer (get-buffer-create "*temp*"))
    (erase-buffer)
    (insert s)
    (goto-char (point-min))
    (while (search-forward pat nil t)
      (replace-match r nil t))
    (buffer-string)))

(defun uncomment-region ()
  "Inverse of comment-region"
  (interactive)
  (comment-region (point) (mark) -1))

(defun insert-date ()
  "Insert current date and time where point is."
  (interactive)
  (insert- (current-time-string)))


;; GNUS
; gmail
(add-to-list 'gnus-secondary-select-methods 
			 '(nnimap "gmail"
					  (nnimap-address "imap.gmail.com")
					  (nnimap-server-port 993)
					  (nnimap-stream ssl)))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "mark.bestley@googlemail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "bestley.co.uk")



(add-hook 'nnfolder-save-buffer-hook 'turn-off-backup)
(setq gnus-thread-sort-functions
	  '((lambda (t1 t2)
		  (not (gnus-thread-sort-by-number t1 t2)))
		gnus-thread-sort-by-score))

(setq gnus-use-trees t
           gnus-generate-tree-function 'gnus-generate-horizontal-tree
           gnus-tree-minimize-window nil)
     (gnus-add-configuration
      '(article
        (vertical 1.0
                  (horizontal 0.25
                              (summary 0.75 point)
                              (tree 1.0))
                  (article 1.0))))
;; (setq gnus-load-hook
;; 	  '((lambda ()
;; ;		  (setq gnus-nntp-server "chinewshost.chi.swissbank.com")
;; ;		  (setq gnus-nntp-server "ldnnewshost.ldn.swissbank.com")
;; ;		  (setq gnus-nntp-server "localhost")
;; 		  (setq gnus-use-tree t )
;; 		  (setq gnus-group-sort-function 'gnus-group-sort-by-rank)
;; 		  ))
;; 	  )


;; (setq gnus-select-group-hook
;; 	  '(lambda ()
;; 		 ;; First of all, sort by date.
;; 		 (gnus-keysort-headers
;; 		  (function string-lessp)
;; 		  (function
;; 		   (lambda (a)
;; 			 (gnus-sortable-date (gnus-header-date a)))))
;; 		 ;;Then sort by subject ignoring `Re:'.
;; 		 (gnus-keysort-headers
;; 		  (function string-lessp)
;; 		  (function
;; 		   (lambda (a)
;; 			 (if case-fold-search
;; 				 (downcase (gnus-simplify-subject (gnus-header-subject a) t))
;; 			   (gnus-simplify-subject (gnus-header-subject a) t)))))
;; 		 ))

