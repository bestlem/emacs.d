(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-autoface-mode nil)
 '(aquamacs-customization-version-id 311 t)
 '(aquamacs-save-options-on-quit t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(auto-fill-function nil t)
 '(auto-word-wrap-default-function nil)
 '(backup-directory-alist '(("." . ".~")))
 '(canlock-password "8ac28fef8ff386f996bee4f20f8b3c40bd1829d4")
 '(comment-auto-fill-only-comments t)
 '(cua-enable-cua-keys nil)
 '(cursor-type 'box)
 '(custom-enabled-themes nil)
 '(delete-old-versions "keep them all")
 '(desktop-file-name-format 'tilde)
 '(explicit-shell-file-name "/opt/local/bin/fish")
 '(fill-nobreak-predicate '(fill-single-char-nobreak-p))
 '(fringe-indicator-alist
   '((continuation nil nil)
     (truncation left-truncation right-truncation)
     (continuation left-continuation right-continuation)
     (overlay-arrow . right-triangle)
     (up . up-arrow)
     (down . down-arrow)
     (top top-left-angle top-right-angle)
     (bottom bottom-left-angle bottom-right-angle top-right-angle top-left-angle)
     (top-bottom left-bracket right-bracket top-right-angle top-left-angle)
     (empty-line . empty-line)
     (unknown . question-mark)) t)
 '(fringe-mode '(16 . 0) nil (fringe))
 '(global-hl-line-mode t)
 '(gnus-directory "~/Library/Preferences/Aquamacs Emacs/News")
 '(gnus-group-sort-function '(gnus-group-sort-by-rank) t)
 '(gnus-kill-save-kill-file t)
 '(gnus-score-mimic-keymap nil)
 '(gnus-server-browse-in-group-buffer t)
 '(gnus-show-all-headers nil)
 '(gnus-verbose 10)
 '(hardhat-basename-protected-regexps
   '("~\\'" "\\.lock\\'" "\\.ix\\'" "\\`test\\.out\\'" "-autoloads\\.el\\'" "\\`Desktop\\.ini\\'" "\\`META\\.yml\\'" "\\`MYMETA\\.yml\\'" "\\`TAGS\\'" "\\`Thumbs\\.db\\'" "\\`\\.dropbox\\'" "\\`\\.dropbox\\.cache\\'" "\\`\\.emacs\\.desktop\\'" "\\`\\.emacs\\.desktop\\.lock\\'" "\\.orig\\'" "\\.rej\\'" "\\.el\\.gz$"))
 '(hardhat-fullpath-protected-regexps
   '("~/\\.emacs\\.d/elpa/" "~/\\.cpan/" "~/\\.cabal/" "~/perl5/perlbrew/" "~/\\.npm/" "~/\\.virtualenv/" "~/\\.virthualenv/" "~/\\.rvm/" "/[._]build/" "/\\.bzr/" "/\\.coverage/" "/\\.git/" "/\\.hg/" "/\\.rspec/" "/\\.sass-cache/" "/\\.svn/" "/_MTN/" "/_darcs/" "/CVS/" "/pm_to_blib/" "/RCS/" "/SCCS/" "/blib/" "/test_output/" "~/\\.emacs\\.d/\\.cask/" "~/\\.cask/" "/Applications/" "~/Library/Preferences/Aquamacs Emacs/Packages" "~/src/ThirdParty/"))
 '(ibuffer-expert t)
 '(ibuffer-fontification-alist
   '((999
      (and buffer-file-name
           (buffer-modified-p))
      term-cyanbg)
     (10 buffer-read-only default)
     (15
      (and buffer-file-name
           (string-match ibuffer-compressed-file-name-regexp buffer-file-name))
      font-lock-doc-face)
     (20
      (string-match "^*"
                    (buffer-name))
      font-lock-keyword-face)
     (25
      (and
       (string-match "^ "
                     (buffer-name))
       (null buffer-file-name))
      italic)
     (30
      (memq major-mode ibuffer-help-buffer-modes)
      font-lock-comment-face)
     (35
      (derived-mode-p 'dired-mode)
      font-lock-function-name-face)
     (0 1 term-blue)))
 '(ibuffer-help-buffer-modes
   '(help-mode helpful-mode apropos-mode Info-mode Info-edit-mode))
 '(indent-tabs-mode nil)
 '(mail-setup-with-from t)
 '(make-backup-files t)
 '(minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt cursor-intangible t))
 '(ns-right-alternate-modifier nil)
 '(ns-right-command-modifier 'super)
 '(ns-tool-bar-display-mode 'both t)
 '(ns-tool-bar-size-mode nil t)
 '(nxml-slash-auto-complete-flag t)
 '(org-babel-python-mode 'python-mode)
 '(org-bullets-bullet-list '("⦿" "◉" "◎" "○" "●"))
 '(org-datetree-add-timestamp 'active t)
 '(org-log-done 'time)
 '(org-modules '(org-crypt org-tempo org-id org-mouse))
 '(org-src-ask-before-returning-to-edit-buffer nil)
 '(org-src-window-setup 'current-window)
 '(org-todo-keywords '((sequence "TODO" "|" "DONE" "LEAVE(@)")))
 '(package-selected-packages
   '(company-prescient company-posframe which-key-posframe which-key-posframe-mode treemacs-persp mac-key-mode no-littering hydra s dash use-package which-key racket-mode elmacro lispy rainbow-delimiters flycheck smartparens highlight-indent-guides nov treemacs-magit treemacs-icons-dired treemacs-projectile treemacs ibuffer-vc projectile deadgrep ivy-prescient prescient counsel swiper ivy-rich ivy-hydra ivy yasnippet company helpful org smartparens-config all-the-icons major-mode-hydra eval-in-repl xr yasnippet-snippets outshine expand-region json-navigator mwim mwin mosey fish-mode sml-mode use-package-chords paredit dashboard clojure-mode cmake-mode cask-mode eros macrostep org-indent xah-elisp-mode validate hardhat beacon ripgrep gitignore-mode gitconfig-mode manual matcha use-package-hydra backup-each-save esup org-bullets ws-butlerz helm elisp-format origami comment-dwim-2 smex discover-my-major json-mode ranger dired-toggle aggressive-indent gradle-mode groovy-imports groovy-mode ws-butler diminish key-chord))
 '(python-shell-interpreter "python")
 '(text-mode-hook '(turn-on-flyspell set-word-wrap))
 '(undo-limit 800000)
 '(visual-line-mode t t)
 '(word-wrap t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Fira Code"))))
 '(aquamacs-variable-width ((t (:stipple nil :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "Times New Roman"))))
 '(bold-italic ((t (:underline t :slant italic :weight bold :family "Menlo"))))
 '(echo-area ((t (:inherit default :strike-through nil :underline nil :slant normal :weight normal :width normal))))
 '(highlight ((t (:background "black" :foreground "white"))))
 '(italic ((t (:underline t :slant italic))))
 '(org-block ((t (:inherit shadow :extend t :background "lemon chiffon" :foreground "black" :family "Fira Code"))))
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
 '(org-todo ((t (:background "#FFE6E4" :foreground "dark magenta" :box (:line-width 1 :color "#D8ABA7") :weight bold))))
 '(region ((t (:extend t :background "deep pink" :foreground "white" :weight bold))))
 '(variable-pitch ((t (:weight normal :height 1.2 :family "Times New Roman")))))
