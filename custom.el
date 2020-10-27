(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-autoface-mode nil)
 '(aquamacs-customization-version-id 311 t)
 '(aquamacs-save-options-on-quit t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(auto-fill-function nil t)
 '(auto-word-wrap-default-function nil)
 '(awesome-tray-mode-line-active-color "#0031a9")
 '(awesome-tray-mode-line-inactive-color "#d7d7d7")
 '(backup-directory-alist
   '(("." . ".~")))
 '(canlock-password "8ac28fef8ff386f996bee4f20f8b3c40bd1829d4")
 '(comment-auto-fill-only-comments t)
 '(cua-enable-cua-keys nil)
 '(cursor-type 'box)
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   '("d4a89e8d54783f8d45c2c68cc6641ea2427f563405fde1f083191b10746fe59f" default))
 '(delete-old-versions "keep them all")
 '(desktop-file-name-format 'tilde)
 '(explicit-shell-file-name "/opt/local/bin/fish")
 '(fill-nobreak-predicate
   '(fill-single-char-nobreak-p))
 '(flymake-error-bitmap
   '(flymake-double-exclamation-mark modus-theme-fringe-red))
 '(flymake-note-bitmap
   '(exclamation-mark modus-theme-fringe-cyan))
 '(flymake-warning-bitmap
   '(exclamation-mark modus-theme-fringe-yellow))
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
     (unknown . question-mark))
   t)
 '(fringe-mode
   '(16 . 0)
   nil
   (fringe))
 '(global-hl-line-mode t)
 '(hardhat-basename-protected-regexps
   '("~\\'" "\\.lock\\'" "\\.ix\\'" "\\`test\\.out\\'" "-autoloads\\.el\\'" "\\`Desktop\\.ini\\'" "\\`META\\.yml\\'" "\\`MYMETA\\.yml\\'" "\\`TAGS\\'" "\\`Thumbs\\.db\\'" "\\`\\.dropbox\\'" "\\`\\.dropbox\\.cache\\'" "\\`\\.emacs\\.desktop\\'" "\\`\\.emacs\\.desktop\\.lock\\'" "\\.orig\\'" "\\.rej\\'" "\\.el\\.gz$"))
 '(hardhat-fullpath-protected-regexps
   '("~/\\.emacs\\.d/elpa/" "~/\\.cpan/" "~/\\.cabal/" "~/perl5/perlbrew/" "~/\\.npm/" "~/\\.virtualenv/" "~/\\.virthualenv/" "~/\\.rvm/" "/[._]build/" "/\\.bzr/" "/\\.coverage/" "/\\.git/" "/\\.hg/" "/\\.rspec/" "/\\.sass-cache/" "/\\.svn/" "/_MTN/" "/_darcs/" "/CVS/" "/pm_to_blib/" "/RCS/" "/SCCS/" "/blib/" "/test_output/" "~/\\.emacs\\.d/\\.cask/" "~/\\.cask/" "/Applications/" "~/Library/Preferences/Aquamacs Emacs/Packages" "~/src/ThirdParty/" "~/src/env/emacs\\.d/elpa/"))
 '(highlight-tail-colors
   '(("#aecf90" . 0)
     ("#c0efff" . 20)))
 '(hl-todo-keyword-faces
   '(("HOLD" . "#70480f")
     ("TODO" . "#721045")
     ("NEXT" . "#5317ac")
     ("THEM" . "#8f0075")
     ("PROG" . "#00538b")
     ("OKAY" . "#30517f")
     ("DONT" . "#315b00")
     ("FAIL" . "#a60000")
     ("BUG" . "#a60000")
     ("DONE" . "#005e00")
     ("NOTE" . "#863927")
     ("KLUDGE" . "#813e00")
     ("HACK" . "#813e00")
     ("TEMP" . "#5f0000")
     ("FIXME" . "#a0132f")
     ("XXX+" . "#972500")
     ("REVIEW" . "#005a5f")
     ("DEPRECATED" . "#201f55")))
 '(ibuffer-expert t)
 '(ibuffer-fontification-alist
   '((5
      (and buffer-file-name
           (buffer-modified-p))
      font-lock-warning-face)
     (10 buffer-read-only font-lock-string-face)
     (15
      (and buffer-file-name
           (string-match ibuffer-compressed-file-name-regexp buffer-file-name))
      font-lock-doc-face)
     (25
      (and
       (string-match "^ "
                     (buffer-name))
       (null buffer-file-name))
      italic)
     (35
      (derived-mode-p 'dired-mode)
      font-lock-function-name-face)
     (40
      (and
       (boundp 'emacs-lock-mode)
       emacs-lock-mode)
      ibuffer-locked-buffer)))
 '(ibuffer-help-buffer-modes
   '(help-mode helpful-mode apropos-mode Info-mode Info-edit-mode))
 '(indent-tabs-mode nil)
 '(initsplit-customizations-alist
   '(("\\`\\(gnus\\|nn\\|message\\|mail\\|mm-\\|smtp\\|send-mail\\|check-mail\\|spam\\|sc-\\)" "gnus-settings.el" nil t)
     ("\\`\\(jobhours-\\|org-\\|deft-\\|cfw:\\)" "org-settings.el" nil t)
     ("\\`\\(aquamacs-\\)" "aquamacs-settings.el" nil nil)))
 '(make-backup-files t)
 '(minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt cursor-intangible t))
 '(ns-right-alternate-modifier nil)
 '(ns-right-command-modifier 'super)
 '(ns-tool-bar-display-mode 'both t)
 '(ns-tool-bar-size-mode nil t)
 '(nxml-slash-auto-complete-flag t)
 '(org-babel-python-mode 'python-mode)
 '(org-bullets-bullet-list
   '("⦿" "◉" "◎" "○" "●"))
 '(org-cycle-global-at-bob t)
 '(org-datetree-add-timestamp 'active t)
 '(org-hide-block-startup nil)
 '(org-log-done 'time)
 '(org-modules
   '(org-crypt org-tempo org-id org-mouse))
 '(org-src-ask-before-returning-to-edit-buffer nil)
 '(org-src-window-setup 'current-window)
 '(org-todo-keywords
   '((sequence "TODO" "|" "DONE" "LEAVE(@)")))
 '(org-yank-adjusted-subtrees t)
 '(package-selected-packages
   '(flycheck-yamllint yaml-mode toc-org lisp-extra-font-lock fira-code-mode paren-face flyspell-correct-popup company-prescient company-posframe which-key-posframe which-key-posframe-mode mac-key-mode hydra s dash use-package which-key racket-mode elmacro lispy rainbow-delimiters flycheck smartparens highlight-indent-guides nov treemacs-magit treemacs-icons-dired treemacs-projectile treemacs ibuffer-vc projectile deadgrep ivy-prescient prescient counsel swiper ivy-rich ivy-hydra ivy yasnippet company helpful org smartparens-config all-the-icons major-mode-hydra eval-in-repl xr yasnippet-snippets outshine expand-region json-navigator mwim fish-mode sml-mode use-package-chords cmake-mode cask-mode eros macrostep org-indent validate hardhat beacon gitignore-mode gitconfig-mode manual use-package-hydra backup-each-save org-bullets ws-butlerz helm elisp-format comment-dwim-2 smex discover-my-major json-mode dired-toggle aggressive-indent gradle-mode groovy-imports groovy-mode ws-butler diminish key-chord))
 '(python-shell-interpreter "python")
 '(safe-local-variable-values
   '((eval add-hook 'before-save-hook 'time-stamp)
     (require-final-newline . t)))
 '(show-paren-mode t)
 '(text-mode-hook
   '(set-word-wrap))
 '(tool-bar-mode nil)
 '(undo-limit 800000)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#a60000")
     (40 . "#721045")
     (60 . "#8f0075")
     (80 . "#972500")
     (100 . "#813e00")
     (120 . "#70480f")
     (140 . "#5d3026")
     (160 . "#184034")
     (180 . "#005e00")
     (200 . "#315b00")
     (220 . "#005a5f")
     (240 . "#30517f")
     (260 . "#00538b")
     (280 . "#093060")
     (300 . "#0031a9")
     (320 . "#2544bb")
     (340 . "#0000c0")
     (360 . "#5317ac")))
 '(vc-annotate-very-old-color nil)
 '(visual-line-mode t t)
 '(word-wrap t)
 '(xterm-color-names
   ["#000000" "#a60000" "#005e00" "#813e00" "#0031a9" "#721045" "#00538b" "#f0f0f0"])
 '(xterm-color-names-bright
   ["#505050" "#972500" "#315b00" "#70480f" "#2544bb" "#8f0075" "#30517f" "#ffffff"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default
    ((t
      (:inherit nil :extend nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Fira Code"))))
 '(aquamacs-variable-width
   ((t
     (:stipple nil :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "Times New Roman"))))
 '(bold-italic
   ((t
     (:underline t :slant italic :weight bold :family "Menlo"))))
 '(echo-area
   ((t
     (:inherit default :strike-through nil :underline nil :slant normal :weight normal :width normal))))
 '(highlight
   ((t
     (:background "black" :foreground "white"))))
 '(italic
   ((t
     (:underline t :slant italic))))
 '(org-block
   ((t
     (:inherit shadow :extend t :background "lemon chiffon" :foreground "black" :family "Fira Code"))))
 '(org-block-begin-line
   ((t
     (:inherit org-meta-line :foreground "blue" :weight normal))))
 '(org-block-end-line
   ((t
     (:inherit org-block-begin-line :foreground "blue"))))
 '(org-document-title
   ((t
     (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans" :height 2.0 :underline nil))))
 '(org-level-1
   ((t
     (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans" :height 1.75))))
 '(org-level-2
   ((t
     (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans" :height 1.5))))
 '(org-level-3
   ((t
     (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans" :height 1.25))))
 '(org-level-4
   ((t
     (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans" :height 1.1))))
 '(org-level-5
   ((t
     (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans"))))
 '(org-level-6
   ((t
     (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans"))))
 '(org-level-7
   ((t
     (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans"))))
 '(org-level-8
   ((t
     (:inherit variable-pitch :weight regular :foreground "black" :font "Gill Sans"))))
 '(org-todo
   ((t
     (:background "#FFE6E4" :foreground "dark magenta" :box
                  (:line-width 1 :color "#D8ABA7")
                  :weight bold))))
 '(region
   ((t
     (:extend t :background "deep pink" :foreground "white" :weight bold))))
 '(variable-pitch
   ((t
     (:weight normal :height 1.2 :family "Times New Roman")))))
