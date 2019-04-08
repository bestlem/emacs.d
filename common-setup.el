
(add-hook 'after-init-hook
               (lambda () (setq debug-on-error t)))

(setq find-file-visit-truename t)	; visit a file under its true name

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

(load "setup-file-management")
(load "setup-gnus")


(load "setup-apperance")
