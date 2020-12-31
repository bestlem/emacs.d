;; Extra functions to add to racket-mode


(defun racket-mwb-raco-all-tests ()
  "Do \"raco test --drdr .\" in a shell buffer to run the
  \"test\" submodules of all in the current directory."
  (interactive)
  (projectile-save-project-buffers)
  (racket--shell
   (concat (shell-quote-argument racket-program)
           " -l raco test --drdr "
           (projectile-project-root))))

(defun racket-mwb-run ()
  "Run the current buffer as per racket-run but save other buffers in project first"
  (interactive)
  (projectile-save-project-buffers)
  (racket-run))

(provide 'racket-support)
