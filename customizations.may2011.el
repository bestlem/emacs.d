(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 203 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(auto-word-wrap-default-function nil)
 '(delete-old-versions t)
 '(gnus-directory "~/Library/Application Support/Aquamacs Emacs/News")
 '(gnus-group-sort-function (quote (gnus-group-sort-by-rank)))
 '(haskell-font-lock-symbols t)
 '(haskell-hugs-program-args (quote ("+." "-98")))
 '(haskell-mode-hook (quote (turn-on-haskell-indentation turn-on-font-lock imenu-add-menubar-index)))
 '(haskell-program-name "ghci")
 '(make-backup-files t)
 '(ns-alternate-modifier (quote meta))
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(nxml-slash-auto-complete-flag t)
 '(py-imenu-show-method-args-p t)
 '(py-python-command-args (quote ("-i" "-colors" "LightBG" "--autocall" "0")))
 '(python-mode-hook (quote (imenu-add-menubar-index my-python-mode-hook (lambda nil (define-key py-mode-map (kbd "M-<tab>") (quote anything-ipython-complete)))))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "apple" :family "Menlo")))))
