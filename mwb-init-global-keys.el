;; Which Key
;;  Package [[https://github.com/justbur/emacs-which-key][which-key]] shows after a key press what you can do next (not useful for control-C as there are too many to show and you can't scroll).


(use-package
  which-key
  :ensure t
  :init (which-key-mode)
  :config (which-key-setup-side-window-right-bottom)
  (setq which-key-sort-order
		'which-key-key-order-alpha
		which-key-side-window-max-width
		0.33
		which-key-idle-delay
		0.05)
  :diminish which-key-mode)

;; Mac modifier key Bindings
;; We have fn available so have it as hyper and then use Karabiner  (try iCue later) to map Caps Lock and Window key to hyper. Super is used sometimes so UI think is confusing and as noted sequence of keys (emacs key-chord and hydra) is better.
;; I don't use the right hand modifier keys so not set separately.

(setq ns-function-modifier 'hyper)

;; Display in help and menus
;;  Note that you can control what the screen displays A for Alt or ⌥. Emacs is not that clever and looks at what it is told and not what appears on the key but I am back to the normal bindings so does not matter. Although hydra seems to object. Set the value to non=nil to use Mac symbols.

(setq ns-use-mac-modifier-symbols  t)

;; Home/End/Paging

(define-key osx-key-mode-map [end] 'end-of-line )
(define-key osx-key-mode-map [home] 'beginning-of-line )
;;(define-key osx-key-mode-map [C-end] 'end-of-buffer )
(define-key osx-key-mode-map [C-home] 'beginning-of-buffer )
(define-key osx-key-mode-map [C-kp-end] 'end-of-buffer )
(define-key osx-key-mode-map [C-kp-home] 'beginning-of-buffer )
(define-key osx-key-mode-map [S-kp-next] 'scroll-other-window-down )
(define-key osx-key-mode-map [S-kp-prior] 'scroll-other-window )

;; Apple
;; Aquamacs thinks the insert key is <help>
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

;; Kill buffer
;; Normally when you are in a buffer you do ^x-^k to kill the current buffer but emacs asks you for the name. [[http://pragmaticemacs.com/emacs/dont-kill-buffer-kill-this-buffer-instead/][Pragmatic Emacs]] suggests this.

;;  By default C-x k runs the command kill-buffer which prompts you for which buffer you want to kill, defaulting to the current active buffer. I don’t know about you, but I rarely want to kill a different buffer than the one I am looking at, so I rebind C-x k to kill-this-buffer which just kills the current buffer without prompting (unless there are unsaved changes).
(defun bjm/kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(define-key osx-key-mode-map (kbd "C-x k") 'bjm/kill-this-buffer)

;; Deleting and return

;; (global-set-key [C-return] 'newline-and-indent )
;;(global-set-key [?\M-left] 'scroll-left )


;(global-set-key [C-backspace] 'backward-delete-char-untabify )
(global-set-key [kp-delete] 'delete-char )
(global-set-key [backspace] 'backward-delete-char-untabify)

;(global-set-key [?\A-backspace] 'undo )

;; Goto line
;; Now these are very old

(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "A-u") 'revert-buffer )

;; Let search continue with arrows
;; But point seems to be messed up and does Aquamacs do something.
;; [[http://ergoemacs.org/emacs/emacs_isearch_by_arrow_keys.html][Xah Lee  again]] set arrow keys in isearch. left/right is backward/forward, up/down is history. press Return to exit

(progn
  (define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat )
  (define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance )

  (define-key isearch-mode-map (kbd "<left>") 'isearch-repeat-backward)
  (define-key isearch-mode-map (kbd "<right>") 'isearch-repeat-forward)

  (define-key minibuffer-local-isearch-map (kbd "<left>") 'isearch-reverse-exit-minibuffer)
  (define-key minibuffer-local-isearch-map (kbd "<right>") 'isearch-forward-exit-minibuffer))

;; Function keys
;; Originally fit in with Visual C 6 (or earlier) keys. F1 help and can't redo in emacs. Just discovered that GNU say what F1-4 should be and seemed good for keyboard macros not my F7. ALso I need to forget F4 for grep but then again I need to see what grep I want. But a hydra will be better allowing start/start/go and format as elisp.


(bind-key* [f2] 'er/expand-region) ; I never use 2 column

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

;; Hyper global key bindings

;;  Hyper
(define-key osx-key-mode-map (kbd "H-1")  'delete-other-windows)
(define-key osx-key-mode-map (kbd "H-0")  'delete-window)
;; H-a is major mode specific Hydra so bound to mode keymap by use-packag :hydra
(define-key osx-key-mode-map (kbd "H-n") 'tabbar-move-current-buffer-to-new-frame)
(define-key osx-key-mode-map (kbd "H-r") 'query-replace)
(define-key osx-key-mode-map (kbd "H-s") 'sr-speedbar-toggle)
(define-key osx-key-mode-map (kbd "H-t") 'treemacs)
