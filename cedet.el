;; Set up cedet/semantic

;; add cdet
(load "cedet-1.0pre6/common/cedet.el")
(global-ede-mode 1 )                    ; Enable the Project management system
;;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(semantic-load-enable-excessive-code-helpers)

(global-srecode-minor-mode 1)            ; Enable template insertion menu
(require 'semantic-ia)
(require 'semantic-gcc)
;; customisation of modes
(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  ;;
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)

  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  )
;;(add-hook 'semantic-init-hooks 'my-cedet-hook)
(add-hook 'c-mode-common-hook 'my-cedet-hook)
(add-hook 'lisp-mode-hook 'my-cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'my-cedet-hook)
;; (add-hook 'erlang-mode-hook 'my-cedet-hook)

(defun my-c-mode-cedet-hook ()
 ;; (local-set-key "." 'semantic-complete-self-insert)
 ;; (local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;; hooks, specific for semantic
(defun my-semantic-hook ()
;; (semantic-tag-folding-mode 1)
  (imenu-add-to-menubar "TAGS")
 )
(add-hook 'semantic-init-hooks 'my-semantic-hook)

(custom-set-variables
 '(semantic-idle-scheduler-idle-time 3)
 '(semantic-self-insert-show-completion-function (lambda nil (semantic-ia-complete-symbol-menu (point))))
 '(global-semantic-tag-folding-mode t nil (semantic-util-modes)))
;; error (global-semantic-folding-mode 1)

;; gnu global support
;(require 'semanticdb-global)
;(semanticdb-enable-gnu-global-databases 'c-mode)
;(semanticdb-enable-gnu-global-databases 'c++-mode)

(semantic-add-system-include "/opt/local/include" 'c++-mode)
(semantic-add-system-include "/opt/local/include" 'c-mode)

;;; ede customization
(require 'semantic-lex-spp)
(global-ede-mode t)


