(assq-delete-all 'org package--builtins)

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

(add-hook 'org-mode-hook
		  (lambda () (imenu-add-to-menubar "Imenu")))
(setq org-imenu-depth 6)

(setq org-src-fontify-natively t
	  org-src-tab-acts-natively t
	  org-confirm-babel-evaluate nil
	  org-edit-src-content-indentation 0)

(use-package org-bullets
  :ensure t
  :init (add-hook 'org-mode-hook 'org-bullets-mode))

(defhydra mwb-hydra-org-code
  (:color teal)
  ""
  ("e" org-edit-special "Edit the code") ; Now H-s
  ("t" org-babel-tangle "Tangle buffer")
  ("q" nil "cancel"))
