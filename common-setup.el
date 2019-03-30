
(add-hook 'after-init-hook
               (lambda () (setq debug-on-error t)))

(package-initialize)
(setq find-file-visit-truename t)	; visit a file under its true name
(setq backup-by-copying-when-linked t)	; be careful with hard links

(setq find-file-existing-other-name t)


(defun dos-to-unix ()
  "Replace \r\n with \n"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    ( replace-string "\r\n" "\n" )))


;; ODDS
;; ^k does line
(setq kill-whole-line t)


; --- highlight words during query replacement ---
;
(setq query-replace-highlight t)
; --- incremental search highlights the current match ---
;
(setq search-highlight t)

;
; --- vertical motion starting at end of line keeps to ends of lines ---
;
(setq track-eol t)
(setq truncate-lines t)


; tabs
(setq-default tab-width 4)
(setq-default tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100))


;; GNUS
; gmail
(require 'gnus )
	
(setq gnus-select-method '(nntp "news.gmane.org"))


(add-to-list 'gnus-secondary-select-methods 
			 '(nnimap "gmail"
					  (nnimap-address "imap.gmail.com")
					  (nnimap-server-port 993)
					  (nnimap-stream ssl))
)
;; (add-to-list 'gnus-secondary-select-methods 
;; 			 '(nnimap "by2"
;; 					  (nnimap-address "imap4.blueyonder.co.uk")
;; 					  (nnimap-server-port 143)
;; 					  )
;; )
(setq user-full-name "Mark Bestley")
(setq user-mail-address "gnus@bestley.co.uk")

(setq message-send-mail-function 'smtpmail-send-it)
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "mark.bestley@googlemail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "bestley.co.uk")




(add-hook 'nnfolder-save-buffer-hook 'turn-off-backup)

;; mime from http://www.emacswiki.org/emacs/MimeTypesWithGnus
;; Inline images?
(setq mm-attachment-override-types '("image/.*"))



;; No HTML mail
(setq mm-discouraged-alternatives '("text/html" "text/richtext"))
(defun my-gnus-summary-view-html-alternative-in-browser ()
      "Display the HTML part of the current multipart/alternative MIME message
    in OmniWeb."
      (interactive)
      (save-current-buffer
        (gnus-summary-show-article)
        (set-buffer gnus-article-buffer)
        (let ((file (make-temp-file "html-message-" nil ".html"))
              (handle (nth 3 (assq 1 gnus-article-mime-handle-alist))))
          (mm-save-part-to-file handle file)
          (browse-url (concat "file://" file)))))


(define-key gnus-summary-mode-map [?K ?M]
  'my-gnus-summary-view-html-alternative-in-browser)



(setq nnimap-split-inbox
        '("INBOX" ))

(setq nnimap-split-rule '(("by2" ("INBOX" nnimap-split-fancy))
                          ("gmail" ("INBOX" nnimap-split-fancy))))
(setq nnimap-split-predicate "UNDELETED")
(setq nnimap-split-fancy ;; (1)
	  '(|                                ;; (2) begin a split list
	;;	(: gnus-registry-split-fancy-with-parent) ;; (3)
		;; splitting rules go here       ;; (4)

;; accu seems to have an issue
;;		("List-Id" ".*accu-general.*" "lists.accugeneral.new" )


;; we have size problems
 		("List-Id" ".*<\\(.+\\)\\.lists\\.mysociety\\.org>.*" "lists.\\1\\.mysociety")

		("List-Id" ".*<\\(.+\\)\\.googlegroups\\.com>.*" "lists.\\1\\.gg")

		("List-Id" ".*<\\(.+\\)>.*" "lists.\\1")

	;; old yahoo  has no List Id - nore does apple
		(any "\\b\\(\\w+\\)@yahoogroups\\.com" "lists.yahoo.\\1")
		(any "\\b\\(\\w+\\)@lists\\.apple\\.com" "lists.apple.\\1")

		;; Rules to hit the various google groups. We're having
		;; problems with dashes, so we have to expand these
	;; my fail	(any  "<\\(.*\\)\\.googlegroups\\.com>" "lists.google.\\1")

	;	(any "\\b\\(\\w+\\)-\\b\\(\\w+\\)@googlegroups.com" "lists.google.\\1-\\2")
	;	(any "\\b\\(\\w+\\)@googlegroups\\.com" "lists.google.\\1")
		(from "calendar-notification" "calendar" )
		(to "moneywell@bestley.co.uk" "moneywell" )

		; note also the subject has to have waf in it - but wait until I join more projects
		(from "codesite-noreply@google.com" 
			  (|
			   ("subject" "waf" "lists.waf-users.gg")
			   "unfiled"
			   )
			  )
		"unfiled"                          ;; (5)
        )
)

