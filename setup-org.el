(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(use-package org 
      :ensure t
      :pin org)

;; start sidebar
(add-hook 'org-mode-hook
          (lambda () (imenu-add-to-menubar "Imenu")))

(setq org-imenu-depth 6)

;;  Try making code blocks colorized
;; (require 'color)
;; (set-face-attribute 'org-block nil :background
;;                     (color-darken-name
;;                      (face-attribute 'default :background) 3))

;; (setq org-src-block-faces '(("emacs-lisp" (:background "#EEE2FF"))
;;                             ("python" (:background "#E5FFB8"))))

(setq org-src-fontify-natively t
	  org-src-tab-acts-natively t
	  org-confirm-babel-evaluate nil
	  org-edit-src-content-indentation 0)
