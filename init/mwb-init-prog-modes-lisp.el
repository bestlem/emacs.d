;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes-lisp.org::*Make%20parentheses%20pretty][Make parentheses pretty:1]]
(use-package
  rainbow-delimiters
  :ensure t
  :delight rainbow-delimiters-mode
  :hook (prog-mode . rainbow-delimiters-mode))
;; Make parentheses pretty:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes-lisp.org::*xah%20mode][xah mode:1]]
(use-package  xah-elisp-mode
   :ensure t
:disabled
   :hook emacs-lisp-mode)
;; xah mode:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes-lisp.org::*Lispy][Lispy:1]]
(use-package lispy
  :ensure t
 ;; :config (add-to-list lispy-elisp-modes xah-elisp-mode)
  :hook ((emacs-lisp-mode lisp-interaction-mode) . lispy-mode))
;; Lispy:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes-lisp.org::*and%20interaction%20hydra][and interaction hydra:1]]
(use-package lispy-mnemonic
  :hook ('emacs-lisp-mode . 'lispy-mnemonic-mode)
  :bind ("H-d" . 'hydra-lispy-debug/body)
  )
;; and interaction hydra:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes-lisp.org::*Formatter][Formatter:1]]
(use-package elisp-format :ensure t)
;; Formatter:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes-lisp.org::*Load%20the%20converter%20to%20elisp][Load the converter to elisp:1]]
(use-package elmacro :ensure t)
;; Load the converter to elisp:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes-lisp.org::*Hydra%20for%20macros][Hydra for macros:1]]
(defhydra hydra-macro (:hint nil :color pink :pre
							 (when defining-kbd-macro
							   (kmacro-end-macro 1)))
  "
		^Create-Cycle^         ^Basic^          ^Insert^        ^Save^         ^Edit^
	  ╭─────────────────────────────────────────────────────────────────────────╯
			  ^_p_^           [_e_] execute    [_i_] insert    [_b_] name      [_'_] previous
			  ^^↑^^           [_d_] delete     [_c_] set       [_K_] key       [_,_] last
	   _<f3>_ ←   → _e_       [_o_] edit       [_a_] add       [_x_] register  [_._] losage
			  ^^↓^^           [_r_] region     [_f_] format    [_B_] defun     [_v_] view
			  ^_k_^           [_m_] step
			 ^^   ^^          [_s_] swap
	  "
  ("<f3>" kmacro-start-macro :color blue)
  ("e" kmacro-end-or-call-macro-repeat)
  ("E" kmacro-end-or-call-macro-repeat :color blue)

  ("p" kmacro-cycle-ring-previous)
  ("k" kmacro-cycle-ring-next)
  ("r" apply-macro-to-region-lines)
  ("d" kmacro-delete-ring-head)
  ("e" kmacro-end-or-call-macro-repeat)
  ("o" kmacro-edit-macro-repeat)
  ("m" kmacro-step-edit-macro)
  ("s" kmacro-swap-ring)
  ("i" kmacro-insert-counter)
  ("c" kmacro-set-counter)
  ("a" kmacro-add-counter)
  ("f" kmacro-set-format)
  ("b" kmacro-name-last-macro)
  ("K" kmacro-bind-to-key)
  ("B" insert-kbd-macro)
  ("x" kmacro-to-register)
  ("'" kmacro-edit-macro)
  ("," edit-kbd-macro)
  ("." kmacro-edit-lossage)
  ("u" universal-argument)
  ("v" kmacro-view-macro)
  ("V" kmacro-view-ring-2nd-repeat)
  ("q" nil :color blue))

(bind-key "<f3>" 'hydra-macro/body)
;; Hydra for macros:1 ends here
