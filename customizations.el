
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
 '(aquamacs-customization-version-id 310 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(auto-fill-function nil t)
 '(auto-word-wrap-default-function nil)
 '(backup-directory-alist (quote (("." . ".~"))))
 '(cua-enable-cua-keys nil)
 '(custom-enabled-themes nil)
 '(delete-old-versions t)
 '(explicit-shell-file-name "/opt/local/bin/fish")
 '(fringe-indicator-alist
   (quote
	((continuation nil nil)
	 (truncation left-truncation right-truncation)
	 (continuation left-continuation right-continuation)
	 (overlay-arrow . right-triangle)
	 (up . up-arrow)
	 (down . down-arrow)
	 (top top-left-angle top-right-angle)
	 (bottom bottom-left-angle bottom-right-angle top-right-angle top-left-angle)
	 (top-bottom left-bracket right-bracket top-right-angle top-left-angle)
	 (empty-line . empty-line)
	 (unknown . question-mark))) t)
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
 '(ns-right-alternate-modifier (quote super))
 '(ns-right-command-modifier (quote control))
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode nil t)
 '(nxml-slash-auto-complete-flag t)
 '(org-babel-python-mode (quote python-mode))
 '(org-log-done (quote time))
 '(org-modules
   (quote
	(org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-mouse)))
 '(org-todo-keywords (quote ((sequence "TODO" "|" "DONE" "LEAVE(@)"))))
 '(package-selected-packages
   (quote
	(backup-each-save esup org-bullets sr-speedbar which-key company elmacro ws-butlerz helm elisp-format origami comment-dwim-2 smex discover-my-major json-navigator json-mode treemacs-magit treemacs-icons-dired treemacs-projectile treemacs ranger dired-toggle expand-region lispy aggressive-indent rainbow-delimiters gradle-mode groovy-imports groovy-mode ws-butler highlight-indent-guides diminish key-chord use-package)))
 '(py-auto-complete-p t)
 '(py-imenu-create-index-p t)
 '(py-imenu-show-method-args-p t)
 '(py-indent-tabs-mode t)
 '(select-enable-clipboard t)
 '(tabbar-mode t nil (tabbar))
 '(text-mode-hook (quote (turn-on-flyspell set-word-wrap)))
 '(tool-bar-mode nil)
 '(visual-line-mode t t)
 '(word-wrap t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "apple" :family "Menlo"))))
 '(emacs-lisp-mode-default ((t (:inherit prog-mode-default :height 120 :family "Fira Code"))) t)
 '(org-block ((t (:inherit shadow :background "lemon chiffon" :foreground "black" :height 0.8 :family "Fira Code"))))
 '(org-block-begin-line ((t (:inherit org-meta-line :foreground "blue"))))
 '(org-block-end-line ((t (:inherit org-block-begin-line :foreground "blue"))))
 '(org-mode-default ((t (:inherit outline-mode-default :stipple nil :strike-through nil :underline nil :slant normal :weight normal :height 180 :width normal :family "Georgia"))))
 '(python-mode-default ((t (:inherit prog-mode-default :height 120 :family "Fira Code"))) t))
(put 'downcase-region 'disabled nil)
