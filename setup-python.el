
;; python

; python from use-package maintainer https://github.com/jwiegley/dot-emacs/blob/master/init.el#L1013
(use-package python-mode
  :mode "\\.py\\'"
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

