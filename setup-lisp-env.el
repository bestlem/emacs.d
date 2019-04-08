;; Well just elisp for new

;; Make parens pretty
(use-package rainbow-delimiters
  :ensure t
  :delight rainbow-delimiters-mode
  :hook (prog-mode . rainbow-delimiters-mode)
  )

(use-package aggressive-indent
  :ensure t
  :hook (elisp-mode . aggresive-indent-mode)
  )

(use-package
  lispy
  :ensure t
  :config (add-hook
		   'emacs-lisp-mode-hook
		   (lambda () (lispy-mode 1)))
  (add-hook
   'lisp-interaction-mode-hook
   (lambda () (lispy-mode 1))))
