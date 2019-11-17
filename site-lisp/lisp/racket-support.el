;; Extra functions to add to racket-mode


(defun racket-raco-all-tests ()
  "Do \"raco test --drdr .\" in a shell buffer to run the \"test\" submodules of all in the current directory."
  (interactive)
  (racket--shell (concat (shell-quote-argument racket-program)
                         " -l raco test --drdr ."
                         )))

(provide 'racket-support)
