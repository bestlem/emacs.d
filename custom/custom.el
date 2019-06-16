(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-autoface-mode nil)
 '(aquamacs-customization-version-id 310 t)
 '(aquamacs-save-options-on-quit t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(auto-fill-function nil t)
 '(auto-word-wrap-default-function nil)
 '(backup-directory-alist (quote (("." . ".~"))))
 '(cua-enable-cua-keys nil)
 '(custom-enabled-themes nil)
 '(delete-old-versions "keep them all")
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
 '(gnus-directory "~/Library/Preferences/Aquamacs Emacs/News")
 '(gnus-group-sort-function (quote (gnus-group-sort-by-rank)) t)
 '(gnus-kill-save-kill-file t)
 '(gnus-score-mimic-keymap nil)
 '(gnus-server-browse-in-group-buffer t)
 '(gnus-show-all-headers nil)
 '(gnus-verbose 10)
 '(hardhat-basename-protected-regexps
   (quote
	("~\\'" "\\.lock\\'" "\\.ix\\'" "\\`test\\.out\\'" "-autoloads\\.el\\'" "\\`Desktop\\.ini\\'" "\\`META\\.yml\\'" "\\`MYMETA\\.yml\\'" "\\`TAGS\\'" "\\`Thumbs\\.db\\'" "\\`\\.dropbox\\'" "\\`\\.dropbox\\.cache\\'" "\\`\\.emacs\\.desktop\\'" "\\`\\.emacs\\.desktop\\.lock\\'" "\\.orig\\'" "\\.rej\\'" "\\.el\\.gz$")))
 '(hardhat-fullpath-protected-regexps
   (quote
	("~/\\.emacs\\.d/elpa/" "~/\\.cpan/" "~/\\.cabal/" "~/perl5/perlbrew/" "~/\\.npm/" "~/\\.virtualenv/" "~/\\.virthualenv/" "~/\\.rvm/" "/[._]build/" "/\\.bzr/" "/\\.coverage/" "/\\.git/" "/\\.hg/" "/\\.rspec/" "/\\.sass-cache/" "/\\.svn/" "/_MTN/" "/_darcs/" "/CVS/" "/pm_to_blib/" "/RCS/" "/SCCS/" "/blib/" "/test_output/" "~/\\.emacs\\.d/\\.cask/" "~/\\.cask/" "/Applications/" "~/Library/Preferences/Aquamacs Emacs/Packages")))
 '(ibuffer-expert t)
 '(mail-setup-with-from t)
 '(make-backup-files t)
 '(minibuffer-prompt-properties
   (quote
	(read-only t cursor-intangible t face minibuffer-prompt cursor-intangible t)))
 '(ns-right-alternate-modifier (quote super))
 '(ns-right-command-modifier (quote control))
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode nil t)
 '(nxml-slash-auto-complete-flag t)
 '(org-babel-python-mode (quote python-mode))
 '(org-bullets-bullet-list (quote ("⦿" "◉" "◎" "○" "●")))
 '(org-log-done (quote time))
 '(org-modules
   (quote
	(org-crypt org-eww org-gnus org-id org-info org-irc org-mouse org-tempo)))
 '(org-src-ask-before-returning-to-edit-buffer nil)
 '(org-src-window-setup (quote current-window))
 '(org-todo-keywords (quote ((sequence "TODO" "|" "DONE" "LEAVE(@)"))))
 '(package-selected-packages
   (quote
	(undo-tree deadgrep eros macrostep helpful ibuffer-vc counsel ivy-rich ivy-hydra org-indent xah-elisp-mode validate hardhat hydra projectile beacon ripgrep gitignore-mode gitconfig-mode nov manual matcha org use-package-hydra backup-each-save esup org-bullets sr-speedbar which-key company elmacro ws-butlerz helm elisp-format origami comment-dwim-2 smex discover-my-major json-navigator json-mode treemacs-magit treemacs-icons-dired treemacs-projectile treemacs ranger dired-toggle expand-region aggressive-indent rainbow-delimiters gradle-mode groovy-imports groovy-mode ws-butler highlight-indent-guides diminish key-chord use-package)))
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
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 120 :width normal :foundry "nil" :family "Fira Code"))))
 '(aquamacs-variable-width ((t (:stipple nil :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "Times New Roman"))))
 '(bold-italic ((t (:underline t :slant italic :weight bold :family "Menlo"))))
 '(echo-area ((t (:inherit default :strike-through nil :underline nil :slant normal :weight normal :width normal))))
 '(highlight ((t (:background "black" :foreground "white"))))
 '(italic ((t (:underline t :slant italic))))
 '(org-block ((t (:inherit shadow :background "lemon chiffon" :foreground "black" :height 0.8 :family "Fira Code"))))
 '(org-block-begin-line ((t (:inherit org-meta-line :foreground "blue" :weight normal))))
 '(org-block-end-line ((t (:inherit org-block-begin-line :foreground "blue"))))
 '(org-document-title ((t (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans" :height 2.0 :underline nil))))
 '(org-level-1 ((t (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans" :height 1.75))))
 '(org-level-2 ((t (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans" :height 1.5))))
 '(org-level-3 ((t (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans" :height 1.25))))
 '(org-level-4 ((t (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans" :height 1.1))))
 '(org-level-5 ((t (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans"))))
 '(org-level-6 ((t (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans"))))
 '(org-level-7 ((t (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans"))))
 '(org-level-8 ((t (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans"))))
 '(variable-pitch ((t (:weight normal :height 1.2 :family "Times New Roman")))))
