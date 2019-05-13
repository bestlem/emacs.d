;; [[file:~/Library/Preferences/Emacs/mwb-init-appearance.org::*Colour%20theme][Colour theme:1]]
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-high-contrast)))
;; Colour theme:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-appearance.org::*Remove%20toolbar][Remove toolbar:1]]
(tool-bar-mode 0)
;; Remove toolbar:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-appearance.org::*Cursor][Cursor:1]]
(use-package beacon
  :ensure t
  :init
  (eval-when-compile
    ;; Silence missing function warnings
    (declare-function beacon-mode "beacon.el"))
  :config
  (beacon-mode t))
;; Cursor:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-appearance.org::*Move/split][Move/split:1]]
(use-package winner
  :init
  (winner-mode))
(defhydra hydra-window (:color red
							       :hint nil)
  "
 Split: _v_ert _x_:horz
Delete: _o_nly  _da_ce  _dw_indow  _db_uffer  _df_rame
  Move: _s_wap
Frames: _f_rame new  _df_ delete
  Misc: _m_ark _a_ce  _u_ndo  _r_edo"
  ("h" windmove-left)
  ("j" windmove-down)
  ("k" windmove-up)
  ("l" windmove-right)
  ("H" hydra-move-splitter-left)
  ("J" hydra-move-splitter-down)
  ("K" hydra-move-splitter-up)
  ("L" hydra-move-splitter-right)
  ("|" (lambda ()
		 (interactive)
		 (split-window-right)
		 (windmove-right)))
  ("_" (lambda ()
		 (interactive)
		 (split-window-below)
		 (windmove-down)))
  ("v" split-window-right)
  ("x" split-window-below)
										;("t" transpose-frame "'")
  ;; winner-mode must be enabled
  ("u" winner-undo)
  ("r" winner-redo) ;;Fixme, not working?
  ("o" delete-other-windows :exit t)
  ("a" ace-window :exit t)
  ("f" new-frame :exit t)
  ("s" ace-swap-window)
  ("da" ace-delete-window)
  ("dw" delete-window)
  ("db" kill-this-buffer)
  ("df" delete-frame :exit t)
  ("q" nil)
										;("i" ace-maximize-window "ace-one" :color blue)
										;("b" ido-switch-buffer "buf")
  ("m" headlong-bookmark-jump))
(bind-key "H-w" 'hydra-window/body)
;; Move/split:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-appearance.org::*Stop%20special%20buffers%20opening%20in%20new%20window][Stop special buffers opening in new window:1]]
(one-buffer-one-frame-mode -1)
(setq  special-display-regexps nil)
;; Stop special buffers opening in new window:1 ends here
