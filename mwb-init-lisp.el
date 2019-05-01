;; Make parentheses pretty
;; Although that should be in prog mode

(use-package
  rainbow-delimiters
  :ensure t
  :delight rainbow-delimiters-mode
  :hook (prog-mode . rainbow-delimiters-mode))

;; Lispy

(use-package
  lispy
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
  (add-hook 'lisp-interaction-mode-hook (lambda () (lispy-mode 1))))

;; and interaction hydra

(use-package lispy-mnemonic)
(add-hook 'emacs-lisp-mode-hook 'lispy-mnemonic-mode)

;; Formatter
;; I am not certain this is needed now as other things do this

(use-package
	elisp-format
	:ensure t)

;; Increase list to exclude Aquamacs etc.

(defun sanityinc/maybe-set-bundled-elisp-readonly ()
  "If this elisp appears to be part of Emacs, then disallow editing."
  (when (and (buffer-file-name)
			 (string-match-p "\\.el\\.gz\\'" (buffer-file-name)))
    (setq buffer-read-only t)
    (view-mode 1)))

(add-hook 'emacs-lisp-mode-hook 'sanityinc/maybe-set-bundled-elisp-readonly)

;; Show as emacs lisp

(use-package elmacro :ensure t)
