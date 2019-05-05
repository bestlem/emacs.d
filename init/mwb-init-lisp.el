;; Make parentheses pretty
;; Although that should be in prog mode

(use-package
  rainbow-delimiters
  :ensure t
  :delight rainbow-delimiters-mode
  :hook (prog-mode . rainbow-delimiters-mode))

;; Lispy

(use-package lispy
  :ensure t
  :hook ((emacs-lisp-mode lisp-interaction-mode) . lispy-mode))

;; and interaction hydra

(use-package lispy-mnemonic
  :hook ('emacs-lisp-mode . 'lispy-mnemonic-mode)
  :bind ("H-d" . 'hydra-lispy-debug/body)
  )

;; Formatter
;; I am not certain this is needed now as other things do this

(use-package
	elisp-format
	:ensure t)

;; Increase list to exclude Aquamacs etc.
;; Look at directory variables and then use a customised list to hold directories, loop/map setting them See [[https://www.gnu.org/software/emacs/manual/html_node/emacs/Directory-Variables.html#Directory-Variables][Gnu Emacs Manual]]

(defun sanityinc/maybe-set-bundled-elisp-readonly ()
  "If this elisp appears to be part of Emacs, then disallow editing."
  (when (and (buffer-file-name)
			 (string-match-p "\\.el\\.gz\\'" (buffer-file-name)))
    (setq buffer-read-only t)
    (view-mode 1)))

(add-hook 'emacs-lisp-mode-hook 'sanityinc/maybe-set-bundled-elisp-readonly)

;; Show as emacs lisp

(use-package elmacro :ensure t)
