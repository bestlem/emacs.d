(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(auto-fill-function nil t)
 '(auto-word-wrap-default-function nil)
 '(awesome-tray-mode-line-active-color "#0031a9")
 '(awesome-tray-mode-line-inactive-color "#d7d7d7")
 '(backup-directory-alist
   (quote
    (("." . ".~"))))
 '(canlock-password "8ac28fef8ff386f996bee4f20f8b3c40bd1829d4")
 '(comment-auto-fill-only-comments t)
 '(cua-enable-cua-keys nil)
 '(cursor-type
   (quote box))
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("d4a89e8d54783f8d45c2c68cc6641ea2427f563405fde1f083191b10746fe59f" default)))
 '(delete-old-versions "keep them all")
 '(desktop-file-name-format
   (quote tilde))
 '(fill-nobreak-predicate
   (quote
    (fill-single-char-nobreak-p)))
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
     (unknown . question-mark)))
   t)
 '(fringe-mode
   (quote
    (16 . 0))
   nil
   (fringe))
 '(global-hl-line-mode t)
 '(highlight-tail-colors
   (quote
    (("#aecf90" . 0)
     ("#c0efff" . 20))))
 '(indent-tabs-mode nil)
 '(initsplit-customizations-alist
   (quote
    (("\\`\\(gnus\\|nn\\|message\\|mail\\|mm-\\|smtp\\|send-mail\\|check-mail\\|spam\\|sc-\\)" "gnus-settings.el" nil t)
     ("\\`\\(org-\\|hl-todo-\\|deft-\\|cfw:\\)" "org-settings.el" nil t)
     ("\\`\\(aquamacs-\\)" "aquamacs-settings.el" nil t)
     ("\\`\\(flymake-\\|flycheck-\\)" "flymake-settings.el" nil t))))
 '(make-backup-files t)
 '(minibuffer-prompt-properties
   (quote
    (read-only t cursor-intangible t face minibuffer-prompt cursor-intangible t)))
 '(nxml-slash-auto-complete-flag t)
 '(safe-local-variable-values
   (quote
    ((eval add-hook
           (quote before-save-hook)
           (quote time-stamp))
     (require-final-newline . t))))
 '(show-paren-mode t)
 '(text-mode-hook
   (quote
    (set-word-wrap)))
 '(tool-bar-mode nil)
 '(undo-limit 800000)
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
 '(region
   ((t
     (:extend t :background "deep pink" :foreground "white" :weight bold))))
 '(variable-pitch
   ((t
     (:weight normal :height 1.2 :family "Times New Roman")))))
