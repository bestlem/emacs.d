
;; python
;(add-to-list 'load-path "/Users/mark/Library/Application Support/Emacs/python-mode.el-6.1.1/") 
;(setq py-install-directory  "/Users/mark/Library/Application Support/Emacs/python-mode.el-6.1.1/")

(require 'python-mode)

(autoload 'python-mode "python-mode" "Python editing mode." t)

;;(setq py-shell-name "ipython33")

;(setq ipython-command "/Library/Frameworks/Python.framework/Versions/4.0.30002/bin/ipython" )
;; (require 'ipython)
;; (setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
;; ;;(autoload 'python-mode "python-mode" "Python editing mode." t)
;; (require 'ipython)
;(setq py-python-command-args '("-pylab" "-colors" "LightBG"))

;(setq ipython-command "/Users/mark/bin/ipython")
;(setq ipython-command "/opt/local/bin/ipython")
;(setq py-python-command-args '("--autocall" "0"))
;; (require 'ipython)

;; (require 'anything-ipython)
;; (add-hook 'python-mode-hook #'(lambda ()
;; 								(define-key py-mode-map (kbd "M-<tab>") 'anything-ipython-complete)))
;; (add-hook 'ipython-shell-hook #'(lambda ()
;; 								  (define-key py-mode-map (kbd "M-<tab>") 'anything-ipython-complete)))

;; ;;(load "pdb" 'noerror 'nomessage)
;;(require 'pydb)


(defun my-python-mode-hook ()
  "My Python settings"
  (define-key python-mode-map [return] 'newline-and-indent )
  (define-key python-mode-map [C-return] 'newline )
  (define-key python-mode-map [f16] 'py-execute-region )
  (define-key python-mode-map "\C-c\C-c" 'py-execute-region )
  (define-key python-mode-map "\C-c\C-b"  'py-execute-buffer)
 ; (define-key python-mode-map "\C-c\C-c" 'python-send-region )

 ; (define-key python-mode-map "\C-c\C-b" 'python-execute-buffer )
 ; (define-key python-mode-map "\C-m" 'newline-and-indent)
)


;(require 'highlight-indentation)
;(add-hook 'python-mode-hook 'highlight-indentation)
 
(add-hook 'python-mode-hook 'my-python-mode-hook)


;(setq py-python-command (expand-file-name "/usr/local/bin/python" ))
;(define-key c-mode-map [return] 'newline-and-indent )
;(define-key c-mode-map [C-return] 'newline )

