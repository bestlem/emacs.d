;; [[file:~/Library/Preferences/Emacs/mwb-init-org-mode.org::*Force%20load%20of%20new%20version][Force load of new version:1]]
(assq-delete-all 'org package--builtins)
;; Force load of new version:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-org-mode.org::*The%20use%20package%20setup][The use package setup:1]]
(use-package
  org
  :ensure t
  :hydra (hydra-org-mode
		  (:color teal)
		  ""
		  ("c" mwb-hydra-org-code/body "Code")
		  ("d" org-toggle-link-display "Show links")
		  ("l" org-insert-link "link")
		  ("g" org-set-tags-command "tags")
		  ("t" org-todo "todo")
		  ("q" nil "cancel"))
  :after hydra
  :bind (:map org-mode-map
			  ("H-a" . hydra-org-mode/body)
			  ("H-s" . org-edit-special)
			  :map org-src-mode-map
			  ("H-s" . org-edit-src-exit)
			  ("A-s" . org-edit-src-exit) ; I press by mistake but it makes sense
			  )
  :hook  (org-mode . (lambda ()
					   (add-hook 'after-save-hook 'org-babel-tangle 'run-at-end 'only-in-org-mode)))
  )
;; The use package setup:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-org-mode.org::*Imenu%20to%20provide%20info%20for%20treemacs%20and%20contextual%20menu][Imenu to provide info for treemacs and contextual menu:1]]
(add-hook 'org-mode-hook
		  (lambda () (imenu-add-to-menubar "Imenu")))
(setq org-imenu-depth 6)
;; Imenu to provide info for treemacs and contextual menu:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-org-mode.org::*Babel%20initialisation][Babel initialisation:1]]
(setq org-src-fontify-natively t
	  org-src-tab-acts-natively t
	  org-confirm-babel-evaluate nil
	  org-edit-src-content-indentation 0)
;; Babel initialisation:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-org-mode.org::*Pretify][Pretify:1]]
(use-package org-bullets
  :ensure t
  :init (add-hook 'org-mode-hook 'org-bullets-mode))
;; Pretify:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-org-mode.org::*Hydras%20for%20tangling][Hydras for tangling:1]]
(defhydra mwb-hydra-org-code
  (:color teal)
  ""
  ("e" org-edit-special "Edit the code") ; Now H-s
  ("t" org-babel-tangle "Tangle buffer")
  ("q" nil "cancel"))
;; Hydras for tangling:1 ends here
