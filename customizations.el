(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets (quote (("apple" "monaco*" "medium" "r" "normal" 9 "monaco") ("apple" "monaco*" "medium" "r" "normal" 10 "monaco") ("apple" "monaco*" "medium" "r" "normal" 11 "monaco") ("apple" "monaco*" "medium" "r" "normal" 12 "monaco") ("apple" "monaco*" "medium" "r" "normal" 13 "monaco") ("apple" "monaco*" "medium" "r" "normal" 14 "monaco") ("apple" "monaco*" "medium" "r" "normal" 16 "monaco") ("apple" "monaco*" "medium" "r" "normal" 18 "monaco") ("apple" "lucida grande*" "medium" "r" "normal" 9 "lucida") ("apple" "lucida grande*" "medium" "r" "normal" 10 "lucida") ("apple" "lucida grande*" "medium" "r" "normal" 11 "lucida") ("apple" "lucida grande*" "medium" "r" "normal" 12 "lucida") ("apple" "lucida grande*" "medium" "r" "normal" 13 "lucida") ("apple" "lucida grande*" "medium" "r" "normal" 14 "lucida") ("apple" "lucida grande*" "medium" "r" "normal" 16 "lucida") ("apple" "lucida grande*" "medium" "r" "normal" 18 "lucida") ("apple" "lucida sans typewrite*" "medium" "r" "normal" 9 "lucida_typewriter") ("apple" "lucida sans typewrite*" "medium" "r" "normal" 10 "lucida_typewriter") ("apple" "lucida sans typewrite*" "medium" "r" "normal" 12 "lucida_typewriter") ("apple" "lucida sans typewrite*" "medium" "r" "normal" 14 "lucida_typewriter") ("apple" "lucida console*" "medium" "r" nil 11 "lucida_console") (nil "courier*" "medium" "r" nil 11 "courier") (nil "courier*" "medium" "r" nil 13 "courier") (nil "bitstream vera sans mono" "medium" "r" "normal" 10 "vera_mono") (nil "bitstream vera sans mono" "medium" "r" "normal" 12 "vera_mono") (nil "bitstream vera sans mono" "medium" "r" "normal" 14 "vera_mono"))) t)
 '(aquamacs-customization-version-id 211 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(auto-word-wrap-default-function nil)
 '(delete-old-versions t)
 '(gnus-directory "~/Library/Application Support/Aquamacs Emacs/News")
 '(gnus-group-sort-function (quote (gnus-group-sort-by-rank)))
 '(make-backup-files t)
 '(ns-alternate-modifier (quote meta))
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(nxml-slash-auto-complete-flag t)
 '(py-imenu-show-method-args-p t)
 '(py-python-command-args (quote ("-i" "-colors" "LightBG" "--autocall" "0")))
 '(python-mode-hook (quote (imenu-add-menubar-index my-python-mode-hook (lambda nil (define-key py-mode-map (kbd "M-<tab>") (quote anything-ipython-complete))))) t)
 '(one-buffer-one-frame-mode nil nil (aquamacs-frame-setup))
 '(recentf-exclude (quote ("/Users/mark/Library/Application Support/Aquamacs Emacs/scratch buffer" "/Users/mark/\\.newsrc")))
 '(tabbar-mode t nil (tabbar))
 '(visual-line-mode nil t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "apple" :family "Menlo")))))
