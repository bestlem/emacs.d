;; [[file:~/Library/Preferences/Emacs/mwb-init-emacs-behaviour.org][No heading:1]]
(setq find-file-visit-truename t)	; visit a file under its true name

(setq find-file-existing-other-name t)

(defun dos-to-unix ()
  "Replace \r\n with \n"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    ( replace-string "\r\n" "\n" )))

;;  Scratch buffer to org mode
(setq initial-major-mode 'org-mode)
;;  Note concat needed to stop the whole end_src command breaking org-mode
(setq initial-scratch-message
	  (concat "This buffer is for notes you don't want to save, and for org mode.
If you want to create a file, visit that file with C-x C-f,then enter the text in that file's own buffer.

#+begin_src emacs-lisp

#"
			  "+end_src
"))

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

;; tabs
(setq-default tab-width 4)
(setq-default tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100))

;; from http://ergoemacs.org/emacs/emacs_make_modern.html but some are in aquamacs
;; and https://github.com/anschwa/emacs.d

;; UTF-8 as default encoding
;; UTF-8 please
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Better selection
(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

;;  Sentences do not end with two spaces
(setq sentence-end-double-space nil)

(progn
  ;; General emacs behaviour
  ;;  From https://sriramkswamy.github.io/dotemacs/

  ;; This package helps to discover the major mode bindings. I use it very occasionally and hence not binding it to any modal binding.
  (use-package discover-my-major
	:ensure t
	:bind (("C-h C-m" . discover-my-major)
		   ("C-h M-m" . discover-my-mode)))

  ;; smex is an amazing program that helps order the M-x commands based on usage and recent items. Let’s install it.
  (use-package smex
	:ensure t
	:config
	(smex-initialize))

  ;; comment-dwim-2 improves on the existing comment-dwim command for easy commenting. Pretty useful.

  (use-package comment-dwim-2
	:ensure t
	:bind* ("M-;" . comment-dwim-2))
  )
;;  Hide show etc


;;  Completer
;; From https://pages.sachachua.com/.emacs.d/Sacha.html#org04e47b9
;; No heading:1 ends here
