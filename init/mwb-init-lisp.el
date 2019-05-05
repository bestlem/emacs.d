;; [[file:~/Library/Preferences/Emacs/mwb-init-lisp.org::*Make%20parentheses%20pretty][Make parentheses pretty:1]]
(use-package
  rainbow-delimiters
  :ensure t
  :delight rainbow-delimiters-mode
  :hook (prog-mode . rainbow-delimiters-mode))
;; Make parentheses pretty:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-lisp.org::*Lispy][Lispy:1]]
(use-package lispy
  :ensure t
  :hook ((emacs-lisp-mode lisp-interaction-mode) . lispy-mode))
;; Lispy:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-lisp.org::*and%20interaction%20hydra][and interaction hydra:1]]
(use-package lispy-mnemonic
  :hook ('emacs-lisp-mode . 'lispy-mnemonic-mode)
  :bind ("H-d" . 'hydra-lispy-debug/body)
  )
;; and interaction hydra:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-lisp.org::*Formatter][Formatter:1]]
(use-package
	elisp-format
	:ensure t)
;; Formatter:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-lisp.org::*Increase%20list%20to%20exclude%20Aquamacs%20etc.][Increase list to exclude Aquamacs etc.:1]]
(defun sanityinc/maybe-set-bundled-elisp-readonly ()
  "If this elisp appears to be part of Emacs, then disallow editing."
  (when (and (buffer-file-name)
			 (string-match-p "\\.el\\.gz\\'" (buffer-file-name)))
    (setq buffer-read-only t)
    (view-mode 1)))

(add-hook 'emacs-lisp-mode-hook 'sanityinc/maybe-set-bundled-elisp-readonly)
;; Increase list to exclude Aquamacs etc.:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-lisp.org::*Load%20the%20converter%20to%20elisp][Load the converter to elisp:1]]
(use-package elmacro :ensure t)
;; Load the converter to elisp:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-lisp.org::*Hydra%20for%20macros][Hydra for macros:1]]
(defhydra hydra-macro (:hint nil :color pink :pre
							 (when defining-kbd-macro
							   (kmacro-end-macro 1)))
  "
  ^Create-Cycle^   ^Basic^           ^Insert^        ^Save^         ^Edit^
╭─────────────────────────────────────────────────────────────────────────╯
	 ^_i_^           [_e_] execute    [_n_] insert    [_b_] name      [_'_] previous
	 ^^↑^^           [_d_] delete     [_t_] set       [_K_] key       [_,_] last
 _j_ ←   → _l_       [_o_] edit       [_a_] add       [_x_] register
	 ^^↓^^           [_r_] region     [_f_] format    [_B_] defun
	 ^_k_^           [_m_] step
	^^   ^^          [_s_] swap
"
  ("j" kmacro-start-macro :color blue)
  ("l" kmacro-end-or-call-macro-repeat)
  ("i" kmacro-cycle-ring-previous)
  ("k" kmacro-cycle-ring-next)
  ("r" apply-macro-to-region-lines)
  ("d" kmacro-delete-ring-head)
  ("e" kmacro-end-or-call-macro-repeat)
  ("o" kmacro-edit-macro-repeat)
  ("m" kmacro-step-edit-macro)
  ("s" kmacro-swap-ring)
  ("n" kmacro-insert-counter)
  ("t" kmacro-set-counter)
  ("a" kmacro-add-counter)
  ("f" kmacro-set-format)
  ("b" kmacro-name-last-macro)
  ("K" kmacro-bind-to-key)
  ("B" insert-kbd-macro)
  ("x" kmacro-to-register)
  ("'" kmacro-edit-macro)
  ("," edit-kbd-macro)
  ("q" nil :color blue))

(bind-key "<F3>" 'hydra-macro/body)
;; Hydra for macros:1 ends here
