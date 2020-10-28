(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-babel-python-mode 'python-mode)
 '(org-bullets-bullet-list '("⦿" "◉" "◎" "○" "●"))
 '(org-cycle-global-at-bob t)
 '(org-datetree-add-timestamp 'active t)
 '(org-hide-block-startup nil)
 '(org-log-done 'time)
 '(org-modules '(org-crypt org-tempo org-id org-mouse))
 '(org-src-ask-before-returning-to-edit-buffer nil)
 '(org-src-window-setup 'current-window)
 '(org-todo-keywords '((sequence "TODO" "|" "DONE" "LEAVE(@)")))
 '(org-yank-adjusted-subtrees t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
 '(org-todo ((t (:background "#FFE6E4" :foreground "dark magenta" :box (:line-width 1 :color "#D8ABA7") :weight bold)))))
