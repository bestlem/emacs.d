;; [[file:~/Library/Preferences/Emacs/mwb-init-global-keys.org::*Which%20Key][Which Key:1]]
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
;; Which Key:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-global-keys.org::*Mac%20modifier%20key%20Bindings][Mac modifier key Bindings:1]]
(setq ns-function-modifier 'hyper)
;; Mac modifier key Bindings:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-global-keys.org::*Display%20in%20help%20and%20menus][Display in help and menus:1]]
(setq ns-use-mac-modifier-symbols  t)
;; Display in help and menus:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-global-keys.org::*Home/End/Paging][Home/End/Paging:1]]
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
;; Home/End/Paging:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-global-keys.org::*Kill%20buffer][Kill buffer:1]]
;;  By default C-x k runs the command kill-buffer which prompts you for which buffer you want to kill, defaulting to the current active buffer. I don’t know about you, but I rarely want to kill a different buffer than the one I am looking at, so I rebind C-x k to kill-this-buffer which just kills the current buffer without prompting (unless there are unsaved changes).
(defun bjm/kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(define-key osx-key-mode-map (kbd "C-x k") 'bjm/kill-this-buffer)
;; Kill buffer:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-global-keys.org::*Deleting%20and%20return][Deleting and return:1]]
;; (global-set-key [C-return] 'newline-and-indent )
;;(global-set-key [?\M-left] 'scroll-left )


;(global-set-key [C-backspace] 'backward-delete-char-untabify )
(global-set-key [kp-delete] 'delete-char )
(global-set-key [backspace] 'backward-delete-char-untabify)

;(global-set-key [?\A-backspace] 'undo )
;; Deleting and return:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-global-keys.org::*Goto%20line][Goto line:1]]
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "A-u") 'revert-buffer )
;; Goto line:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-global-keys.org::*Let%20search%20continue%20with%20arrows][Let search continue with arrows:1]]
(progn
  (define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat )
  (define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance )

  (define-key isearch-mode-map (kbd "<left>") 'isearch-repeat-backward)
  (define-key isearch-mode-map (kbd "<right>") 'isearch-repeat-forward)

  (define-key minibuffer-local-isearch-map (kbd "<left>") 'isearch-reverse-exit-minibuffer)
  (define-key minibuffer-local-isearch-map (kbd "<right>") 'isearch-forward-exit-minibuffer))
;; Let search continue with arrows:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-global-keys.org::*Function%20keys][Function keys:1]]
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
;; Function keys:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-global-keys.org::*Matcha][Matcha:1]]
(use-package matcha
  :config
  (matcha-setup))


(defhydra hydra-space (:color blue :hint nil :idle .2)
  "

   Space: %s`default-directory

    Find              Manage             Do                Mode
  ------------------------------------------------------------------------------
    _f_ File       _w_ Window      _s_ Search           _m_ Mode
    _b_ Buffer     _g_ Git         _R_ Refactor         _d_ Debug
    _r_ Recent     _p_ Project     _v_ Edit Init.el     _e_ Eval
    _n_ Sidebar    _y_ System      _o_ Org              _t_ Test
    _SPC_ Any      _U_ Undo        _u_ Universal Arg..  _=_ Format

"
  ("1" digit-argument)
  ("2" digit-argument)
  ("3" digit-argument)
  ("4" digit-argument)
  ("5" digit-argument)
  ("6" digit-argument)
  ("7" digit-argument)
  ("8" digit-argument)
  ("9" digit-argument)
  ("0" digit-argument)
  ("u" universal-argument)
  ("f" +find-file-dwim)
  ("b" +buffers-dwim)
  ("r" +recentf-dwim)
  ("w" hydra-window/body)
  ("-" split-window-below)
  ("|" split-window-right)
  ("\\" split-window-right)
  ("<backspace>" delete-window)
  ("DEL" delete-window) ;; For terminals.
  ("s" hydra-search/body)
  ("v" (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
  ("U" undo-tree-visualize)
  ("x" kill-buffer)
  ("y" hydra-system/body)
  ("n" dired-sidebar-toggle-sidebar)
  ("p" matcha-projectile/body)
  ("g" +show-vc-hydra)
  ("SPC" counsel-fzf)
  ("RET" quickrun)
  (";" counsel-M-x)
  (":" eval-expression)
  ("o" hydra-org-space/body)
  ("S" +save-all-buffers)
  ("R" matcha-run-refactor-command)
  ("=" matcha-run-format-command)
  ("d" matcha-run-debug-command)
  ("m" matcha-run-mode-command)
  ("e" matcha-run-eval-command)
  ("t" matcha-run-test-command))
;; Matcha:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-global-keys.org::*Hyper%20global%20key%20bindings][Hyper global key bindings:1]]
(bind-key (kbd "H-1")  'delete-other-windows osx-key-mode-map)
(bind-key (kbd "H-0")  'delete-window osx-key-mode-map)
;; H-a is major mode specific Hydra so bound to mode keymap by use-packag :hydra
(bind-key (kbd "H-m") 'hydra-space/body osx-key-mode-map)
(bind-key (kbd "H-n") 'tabbar-move-current-buffer-to-new-frame osx-key-mode-map)
;; H-r is register
;; H-s is return from org special edit
(bind-key (kbd "H-t") 'treemacs osx-key-mode-map)
;; Hyper global key bindings:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-global-keys.org::*Command%20key%20bindings][Command key bindings:1]]
(bind-key "A-/" 'comment-or-uncomment-region-or-line)
(bind-key "A-<kp-add>" 'zoom-font)
(bind-key "A-<kp-subtract>" 'zoom-font-out)
;; Command key bindings:1 ends here
