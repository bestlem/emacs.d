
;; python

;(add-to-list 'auto-mode-alist '("\\.py$" . python-mode) )
;(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(autoload 'python-mode "python-mode" "Python editing mode." t)
;(setq ipython-command "/Library/Frameworks/Python.framework/Versions/4.0.30002/bin/ipython" )
;; (require 'ipython)
;; (setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
;; ;;(autoload 'python-mode "python-mode" "Python editing mode." t)
;; (require 'ipython)
;(setq py-python-command-args '("-pylab" "-colors" "LightBG"))

(setq ipython-command "/Users/mark/bin/ipython")
(require 'ipython)

;;(load "pdb" 'noerror 'nomessage)
;(require 'pydb)

(defun my-python-mode-hook ()
  "My Python settings"
  (define-key py-mode-map [return] 'newline-and-indent )
  (define-key py-mode-map [C-return] 'newline )
  (define-key py-mode-map [f5] 'py-execute-region )
  (define-key py-mode-map "\C-c\C-c" 'py-execute-region )
  (define-key py-mode-map "\C-c\C-b"  'py-execute-buffer)
 ; (define-key python-mode-map "\C-c\C-c" 'python-send-region )

 ; (define-key python-mode-map "\C-c\C-b" 'python-execute-buffer )
 ; (define-key python-mode-map "\C-m" 'newline-and-indent)
(message "In python mode hook" )
)

(add-hook 'python-mode-hook 'my-python-mode-hook)


;(setq py-python-command (expand-file-name "/usr/local/bin/python" ))
;(define-key c-mode-map [return] 'newline-and-indent )
;(define-key c-mode-map [C-return] 'newline )

