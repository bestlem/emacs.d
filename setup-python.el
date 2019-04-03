
;; python

; python from use-package maintainer https://github.com/jwiegley/dot-emacs/blob/master/init.el#L1013
(use-package python-mode
	 :mode "\\.py\\'"
	 :ensure t
  :interpreter "python3"
  :bind (:map python-mode-map
              ("C-c c")
			  ("C-c C-c" . py-execute-region )
			  ("C-c C-b"  . py-execute-buffer)
			  ("[return]" . newline-and-indent )
			  ("[C-return]" . newline )
			  ("[f16]" . py-execute-region )
              ("C-c C-z" . python-shell))
  
  :config
  (defvar python-mode-initialized nil)

  (defun my-python-mode-hook ()
    (unless python-mode-initialized
      (setq python-mode-initialized t)

      (info-lookup-add-help
       :mode 'python-mode
       :regexp "[a-zA-Z_0-9.]+"
       :doc-spec
       '(("(python)Python Module Index" )
         ("(python)Index"
          (lambda
            (item)
            (cond
             ((string-match
               "\\([A-Za-z0-9_]+\\)() (in module \\([A-Za-z0-9_.]+\\))" item)
              (format "%s.%s" (match-string 2 item)
                      (match-string 1 item)))))))))

    (set (make-local-variable 'parens-require-spaces) nil)
    (setq indent-tabs-mode nil))

  (add-hook 'python-mode-hook 'my-python-mode-hook))

;(require 'highlight-indentation)
;(add-hook 'python-mode-hook 'highlight-indentation)
 
;(add-hook 'python-mode-hook 'guess-style-guess-tabs-mode)
;   (add-hook 'python-mode-hook (lambda ()
 ;                                   (guess-style-guess-tab-width)))

;; Anaconda from https://github.com/howardabrams/dot-files/blob/master/emacs-python.org
(use-package anaconda-mode
  :ensure t
  :after 'python-mode
  :init (add-hook 'python-mode-hook 'anaconda-mode)
        (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  :config (use-package company-anaconda
            :ensure t
            :init (add-hook 'python-mode-hook 'anaconda-mode)
            (eval-after-load "company"
              '(add-to-list 'company-backends '(company-anaconda :with company-capf)))))

;; This gives an older version
;; (add-to-list 'package-archives
;; 			 '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(use-package elpy
  :ensure t
  :commands elpy-enable
  :init (with-eval-after-load 'python (elpy-enable))

  :config
  (electric-indent-local-mode -1)
  (delete 'elpy-module-highlight-indentation elpy-modules)
  (delete 'elpy-module-flymake elpy-modules)

  (defun ha/elpy-goto-definition ()
    (interactive)
    (condition-case err
        (elpy-goto-definition)
      ('error (xref-find-definitions (symbol-name (symbol-at-point))))))

  :bind (:map elpy-mode-map ([remap elpy-goto-definition] .
                             ha/elpy-goto-definition)))

(use-package jedi
  :ensure t
  :init
  (add-to-list 'company-backends 'company-jedi)
  :config
  (use-package company-jedi
    :ensure t
    :init
    (add-hook 'python-mode-hook (lambda () (add-to-list 'company-backends 'company-jedi)))
    (setq company-jedi-python-bin "python")))

