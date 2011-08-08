;; $Header: /Users/mark/Library/Emacs/RCS/common-keys.el,v 1.1.1.7 2006/07/23 12:24:49 mark Exp mark $

					; keys
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

;; for PC
;(load-library "pc-select")
;(pc-selection-mode) 
;(global-set-key [s-left] 'backward-sexp)
;(global-set-key [s-right] 'forward-sexp)
;(global-set-key [M-left] 'scroll-left)
;(global-set-key [M-right] 'scroll-right)

;; Apple
;(global-set-key [M-c] 'cua-copy-region)
;(global-set-key [M-x] 'cua-cut-region)
;(global-set-key [M-v] 'cua-paste)
;(global-set-key [?\A-c] 'cua-copy-region)
;(global-set-key [?\A-v] 'cua-paste)
;(global-set-key [?\A-x] 'cua-cut-region)
(global-set-key [S-kp-delete] 'cua-cut-region)
;; Cocoa emacs does not recognise this key
(global-set-key [S-kp-insert] 'cua-paste)
(global-set-key [C-kp-insert] 'cua-copy-region)
;(global-set-key [?\M-x] 'kill-region)


;(global-set-key [C-return] 'newline-and-indent )
;;(global-set-key [?\M-left] 'scroll-left )


;(global-set-key [C-backspace] 'backward-delete-char-untabify )
(global-set-key [kp-delete] 'delete-char )
(global-set-key [backspace] 'backward-delete-char-untabify)

;(global-set-key [?\A-backspace] 'undo )

(global-set-key (kbd "M-g") 'goto-line)

(global-set-key [f3] 'gdb)
(global-set-key [f4] 'grep )
(global-set-key [kp-f3] 'gdb)
(global-set-key [kp-f4] 'grep )

(global-set-key [f5] 'compile )
(global-set-key [f6] 'narrow-to-region )
(global-set-key [S-f6] 'widen )
(global-set-key [f7] 'call-last-kbd-macro )
(global-set-key [f8] 'next-error )
(global-set-key [f9] 'replace-string )
(global-set-key [f14] 'undo )

(global-set-key [f12] 'gud-step )
(global-set-key [f11] 'gud-next )
(global-set-key [C-f10] 'gud-cont )
(global-set-key [f10] 'gud-finish )
(global-set-key [C-f11] 'gud-break )
(global-set-key [C-f12] 'gud-tbreak )

;;(global-set-key [S-f7]  'next-error )
(global-set-key [S-f8] 'previous-error)

;(global-set-key [ESC-SPC] 'set-mark-command )

(global-set-key [M-up] 'next-multiframe-window)
(global-set-key [M-down] 'previous-multiframe-window)

; do for Next
;(global-set-key [?\H-n] 'next-error )
;(global-set-key [?\H-p] 'previous-error )

;(global-set-key [?\H-4] 'grep )
;(global-set-key [?\H-5] 'compile )
;(global-set-key [?\H-g] 'gdb )

;(global-set-key [?\H-7] 'call-last-kbd-macro )
;(global-set-key [?\H-8] 'name-last-kbd-macro )
;(global-set-key [?\H-9] 'replace-string )
;(global-set-key [?\H-delete] 'undo )


;(global-set-key [?\A-=] 'what-line )

;(global-set-key [?\M-g] 'goto-line)
;(global-set-key [?\A-g] 'goto-line)
;(global-set-key "\M-q" 'query-replace)
;(global-set-key "\M-r" 'replace-string)
;(global-set-key "\M-i" 'indent-region)

;(global-set-key [?\A-x] 'execute-extended-command )
;(global-set-key [?\A-SPC] 'set-mark-command )
;; (defun unbury-buffer ()
;;   "Unbury buffer (from Vegard@protek.unit.no (Vegard Vesterheim))"
;;   (interactive)
;;   (require 'cl)
;;   (switch-to-buffer (car (last (buffer-list)))))

;(global-set-key [f2] 'bury-buffer)
;(global-set-key [S-f2] 'unbury-buffer)

;; $Log: common-keys.el,v $
;; Revision 1.1.1.7  2006/07/23 12:24:49  mark
;; Apple chnages for emacs NS 9
;;
;; Revision 1.1.1.6  2002/12/07 01:56:02  mark
;; Get it right
;;
;; Revision 1.1.1.5  2002/12/07 01:54:57  mark
;; Adddd c-insert
;;
;; Revision 1.1.1.4  2002/12/07 01:44:35  mark
;; Put in Apple/Next keys fot cut/paste and #
;;
;; Revision 1.1.1.3  2002/11/16 11:13:11  mark
;; Get rcs correct
;;


