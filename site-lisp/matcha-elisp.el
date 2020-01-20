;;; matcha-elisp.el --- Integration with Hydra. -*- lexical-binding: t -*-

;; Copyright (C) 2019 James Nguyen

;; Author: James Nguyen <james@jojojames.com>
;; Hwac=vily modified Mark Bestley
;; Version: 0.0.2
;; Package-Requires: ((emacs "25.1"))
;; Keywords: hydra, emacs

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;; Integration with Hydra.

;;; Code:
;; (require 'matcha-base)
;; (require 'matcha-macrostep)
;; (require 'elisp-refs)

(defun matcha-goto-scratch ()
  "Move to *scratch* buffer."
  (interactive)
  (pop-to-buffer "*scratch*"))

(defun matcha-elisp-eval-current-form-sp (&optional arg)
  "Call `eval-last-sexp' after moving out of one level of
parentheses. Will exit any strings and/or comments first.
An optional ARG can be used which is passed to `sp-up-sexp' to move out of more
than one sexp.
Requires smartparens because all movement is done using `sp-up-sexp'."
  (interactive "p")
  (require 'smartparens)
  (let ((evil-move-beyond-eol t))
    ;; evil-move-beyond-eol disables the evil advices around eval-last-sexp
    (ignore evil-move-beyond-eol)
    (save-excursion
      (let ((max 10))
        (while (and (> max 0)
                    (sp-point-in-string-or-comment))
          (decf max)
          (sp-up-sexp)))
      (sp-up-sexp arg)
      (call-interactively 'eval-last-sexp))))

(defun matcha-elisp-eval-current-symbol-sp ()
  "Call `eval-last-sexp' on the symbol around point.
Requires smartparens because all movement is done using `sp-forward-symbol'."
  (interactive)
  (require 'smartparens)
  (let ((evil-move-beyond-eol t))
    (ignore evil-move-beyond-eol)
    ;; evil-move-beyond-eol disables the evil advices around eval-last-sexp
    (save-excursion
      (sp-forward-symbol)
      (call-interactively 'eval-last-sexp))))

;; https://github.com/jwiegley/use-package/issues/152
;; Edebug a defun or defmacro
(defvar matcha-fns-in-edebug nil
  "List of functions for which `edebug' is instrumented.")
(defconst matcha-elisp-fns-regexp
  (concat "(\\s-*"
          "\\(defun\\|defmacro\\)\\s-+"
          "\\(?1:\\(\\w\\|\\s_\\)+\\)\\_>")
  "Regexp to find defun or defmacro definition.")

(defun matcha-elisp-toggle-edebug-defun ()
  (interactive)
  (let (fn)
    (save-mark-and-excursion
     (search-backward-regexp matcha-elisp-fns-regexp)
     (setq fn (match-string 1))
     (mark-sexp)
     (narrow-to-region (point) (mark))
     (if (member fn matcha-fns-in-edebug)
         ;; If the function is already being edebugged, uninstrument it
         (progn
           (setq matcha-fns-in-edebug (delete fn matcha-fns-in-edebug))
           (eval-region (point) (mark))
           (setq-default eval-expression-print-length 12)
           (setq-default eval-expression-print-level  4)
           (message "Edebug disabled: %s" fn))
       ;; If the function is not being edebugged, instrument it
       (progn
         (add-to-list 'matcha-fns-in-edebug fn)
         (setq-default eval-expression-print-length nil)
         (setq-default eval-expression-print-level  nil)
         (edebug-defun)
         (message "Edebug: %s" fn)))
     (widen))))

(major-mode-hydra-define emacs-lisp-mode nil
  ("Eval"
   (("b" eval-buffer "buffer")
    ("e" eval-defun "defun")
    ("r" eval-region "region"))
   "REPL"
   (("I" ielm "ielm")
    ("x" matcha-goto-scratch "*Scratch*"))
   "Test"
   (("t" ert "prompt")
    ("T" (ert t) "all")
    ("F" (ert :failed) "failed"))

   "Debug"
   (("m" sk/hydra-macro-step/body "Macrostep...")
    ("d" matcha-elisp-toggle-edebug-defun "Debug")
    ("q" cancel-debug-on-entry "Cancel Debug on Entry")
    ("f" debug-on-entry "Debug on Entry"))
   ;; ["Watch"
   ;;  ("w" debug-watch "Watch")
   ;;  ("W" cancel-debug-watch  "Cancel Watch")]
   "Compile"
   (("c" emacs-lisp-byte-compile "Compile")
    ("l" emacs-lisp-byte-compile-and-load "Compile and Load")
    ("r" byte-recompile-directory "Byte Recompile Directory")
    ("x" disassemble "Disassemble"))))
(provide 'matcha-elisp)
;;; matcha-elisp.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved noruntime cl-functions obsolete)
;; End:
