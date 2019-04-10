
;; ; keys
;;  Use bind-key* if do not want to be overridden see <https://stackoverflow.com/a/27441815/151019>

;;  From Xah Lee explains more of syntax
;; "<return>" is the Return key while emacs runs in a graphical user interface.
;; "RET" is the Return key while emacs runs in a terminal.
;; "RET" is also equivalent to "C-m" (【Ctrl+m】). (For why, see: Emacs's Key Syntax Explained)



(define-key osx-key-mode-map [end] 'end-of-line )
(define-key osx-key-mode-map [home] 'beginning-of-line )
;;(define-key osx-key-mode-map [C-end] 'end-of-buffer )
(define-key osx-key-mode-map [C-home] 'beginning-of-buffer )
(define-key osx-key-mode-map [C-kp-end] 'end-of-buffer )
(define-key osx-key-mode-map [C-kp-home] 'beginning-of-buffer )
(define-key osx-key-mode-map [S-kp-next] 'scroll-other-window-down )
(define-key osx-key-mode-map [S-kp-prior] 'scroll-other-window )

(when (eq system-type 'darwin)
  ;; when using Windows keyboard on Mac, the insert key is mapped to <help>
  ;; copy ctrl-insert, paste shift-insert on windows keyboard
  ;; From https://emacs.stackexchange.com/a/30288/9874
  ;; Noter this is emacs cut and paste not CUA
  (global-set-key [C-help] #'clipboard-kill-ring-save)
  (global-set-key [S-help] #'clipboard-yank)
  ;; insert to toggle `overwrite-mode'
  (global-set-key [help] #'overwrite-mode))


;;  Old attempt
;; I think that the ?-kp-* entries sre for <insert> etc on non Mac keyboards

;; Apple
(global-set-key [S-kp-delete] 'cua-cut-region)
;; Cocoa emacs does not recognise this key
(global-set-key [S-kp-insert] 'cua-paste)
(global-set-key [C-kp-insert] 'cua-copy-region)

(global-set-key [end] 'end-of-line )
(global-set-key [home] 'beginning-of-line )

;; Aqua macs defaults these to same
;(global-set-key [C-end] 'end-of-buffer )
;(global-set-key [C-home] 'beginning-of-buffer )

;; Unknown
(global-set-key [C-kp-end] 'end-of-buffer )
(global-set-key [C-kp-home] 'beginning-of-buffer )
(global-set-key [S-kp-next] 'scroll-other-window-down )
(global-set-key [S-kp-prior] 'scroll-other-window )

;(global-set-key [s-left] 'scroll-left)
;(global-set-key [s-right] 'scroll-right)




;; (global-set-key [C-return] 'newline-and-indent )
;;(global-set-key [?\M-left] 'scroll-left )


;(global-set-key [C-backspace] 'backward-delete-char-untabify )
(global-set-key [kp-delete] 'delete-char )
(global-set-key [backspace] 'backward-delete-char-untabify)

;(global-set-key [?\A-backspace] 'undo )

(global-set-key (kbd "M-g") 'goto-line)

(global-set-key (kbd "A-u") 'revert-buffer )


;;  Set global keys here not in use-package so can see them all
(bind-key* [f2] 'er/expand-region) ; I never use 2 column
;;  f3 and f4 are macro control f3 to start recording f4 to end or run - I used to have f7 but not in this setup f4 I have as grep but that seems I need to forget
;; (global-set-key [f3] 'gdb)
;; (global-set-key [f4] 'grep )
(global-set-key [f5] 'compile )
(global-set-key [S-f4] 'grep )

;; These are the VC6 ones - not used for 15 years so can learn new ones,
;; (global-set-key [kp-f3] 'gdb)
;; (global-set-key [f12] 'gud-step )
;; (global-set-key [f11] 'gud-next )
;; (global-set-key [C-f10] 'gud-cont )
;; (global-set-key [f10] 'gud-finish )
;; (global-set-key [C-f11] 'gud-break )
;; (global-set-key [C-f12] 'gud-tbreak )

;;  More VC6 keys
(global-set-key [S-f7]  'next-error )
(global-set-key [S-f8] 'previous-error)

;; Conflicts with org-mode
;; (global-set-key [M-up] 'next-multiframe-window)
;; (global-set-key [M-down] 'previous-multiframe-window)


;(global-set-key [?\A-=] 'what-line )

;(global-set-key [?\M-g] 'goto-line)
;(global-set-key [?\A-g] 'goto-line)
;(global-set-key "\M-q" 'query-replace)
;(global-set-key "\M-r" 'replace-string)
;(global-set-key "\M-i" 'indent-region)

;;  From Xah Lee amke search easier http://ergoemacs.org/emacs/emacs_isearch_by_arrow_keys.html
(progn
  ;; set arrow keys in isearch. left/right is backward/forward, up/down is history. press Return to exit
  (define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat )
  (define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance )

  (define-key isearch-mode-map (kbd "<left>") 'isearch-repeat-backward)
  (define-key isearch-mode-map (kbd "<right>") 'isearch-repeat-forward)

  (define-key minibuffer-local-isearch-map (kbd "<left>") 'isearch-reverse-exit-minibuffer)
  (define-key minibuffer-local-isearch-map (kbd "<right>") 'isearch-forward-exit-minibuffer))
