;; Well just elisp for new

;; Make parens pretty
(use-package
  rainbow-delimiters
  :ensure t
  :delight rainbow-delimiters-mode
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package
  lispy
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
  (add-hook 'lisp-interaction-mode-hook (lambda () (lispy-mode 1))))

(use-package
  elisp-format
  :ensure t)

;; From https://github.com/purcell/emacs.d/blob/master/lisp/init-lisp.el
(defun sanityinc/maybe-set-bundled-elisp-readonly ()
  "If this elisp appears to be part of Emacs, then disallow editing."
  (when (and (buffer-file-name)
             (string-match-p "\\.el\\.gz\\'" (buffer-file-name)))
    (setq buffer-read-only t)
    (view-mode 1)))

(add-hook 'emacs-lisp-mode-hook 'sanityinc/maybe-set-bundled-elisp-readonly)

;; Show keyboard macro as elisp
(use-package elmacro :ensure t)
