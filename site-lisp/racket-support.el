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

(defun racket-mwb-raco-test ()
  "Run current buffer through raco test but save buffers first"
  (interactive)
  (projectile-save-project-buffers)
  (racket-raco-test))

(major-mode-hydra-define racket-mode nil
  ("Run"
   (("b" racket-run "run")
    ("B" racket-run-and-switch-to-repl "run and REPL")
    ("sr" racket-send-region "Region to REPL")
    ("ss" racket-send-last-sexp "sexp to REPL")
    ("rr" (lambda () (interactive) (racket-run 4)) "Run with errortrace")
    ("re" (lambda () (interactive) (racket-run 2)) "Run with errortrace 2")
    ("ri" (lambda () (interactive) (racket-run 16)) "Instrument for debug"))
   "Edit"
   (("ea" hydra-lispy-mwb-alter/body "Alter...")
    ("er" hydra-lispy-mwb-mark/body "Region...")
    ("eg" hydra-lispy-mwb-goto/body "Goto..."))
"Test"
   (("T" racket-test "Test")
    ("t" racket-mwb-raco-test "Raco Test")
    ("p" racket-mwb-raco-all-tests "All Tests in project")
    ("c" racket-check-syntax-mode "Check syntax"))
   "Fold"
   (("ht" racket-fold-all-tests "Hide tests")
    ("hs" racket-unfold-all-tests "Show tests")
    ("hh" hydra-hs/body "Hide-show..."))
   "Navigate"
   (("[" ptrv/smartparens/body "Smartparens..."))))

(provide 'racket-support)
