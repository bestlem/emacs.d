;; start sidebar
(add-hook 'org-mode-hook
          (lambda () (imenu-add-to-menubar "Imenu")))

(setq org-imenu-depth 6)
