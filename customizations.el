
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 308 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(auto-word-wrap-default-function nil)
 '(cua-enable-cua-keys nil)
 '(delete-old-versions t)
 '(explicit-shell-file-name "/opt/local/bin/fish")
 '(gnus-directory "~/Library/Application Support/Aquamacs Emacs/News")
 '(gnus-group-sort-function (quote (gnus-group-sort-by-rank)))
 '(haskell-font-lock-symbols t)
 '(haskell-hugs-program-args (quote ("+." "-98")))
 '(haskell-mode-hook
   (quote
	(turn-on-haskell-indentation turn-on-font-lock imenu-add-menubar-index)) t)
 '(haskell-program-name "ghci")
 '(mail-setup-with-from t)
 '(make-backup-files t)
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(nxml-slash-auto-complete-flag t)
 '(org-log-done (quote time))
 '(org-modules
   (quote
	(org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-mouse)))
 '(org-todo-keywords (quote ((sequence "TODO" "|" "DONE" "LEAVE(@)"))))
 '(py-auto-complete-p t)
 '(py-imenu-create-index-p t)
 '(py-imenu-show-method-args-p t)
 '(py-indent-tabs-mode t)
 '(select-enable-clipboard t)
 '(tabbar-mode t nil (tabbar))
 '(text-mode-hook
   (quote
	(turn-on-flyspell smart-spacing-mode auto-detect-wrap)))
 '(visual-line-mode nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "apple" :family "Menlo"))))
 '(python-mode-default ((t (:inherit prog-mode-default :height 120 :family "Fira Code"))) t))
