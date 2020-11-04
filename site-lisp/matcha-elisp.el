;;; matcha-elisp.el --- Integration with Hydra. -*- lexical-binding: t -*-

;; Copyright (C) 2019 James Nguyen

;; Author: James Nguyen <james@jojojames.com>
;; Heavily modified Mark Bestley
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


(major-mode-hydra-define emacs-lisp-mode nil
  ("Eval"
   (("b" eval-buffer "buffer")
    ("d" eval-defun "defun [well top level form]")
    ("r" eval-region "region")
    ("f" matcha-elisp-eval-current-form-sp "form" ))
   "REPL"
   (("I" ielm "ielm")
    ("x" matcha-goto-scratch "*Scratch*"))
   "Test"
   (("t" ert "prompt")
    ("T" (ert t) "all")
    ("F" (ert :failed) "failed"))

   "Debug"
   (("m" sk/hydra-macro-step/body "Macrostep...")
    ("e"  modi/toggle-edebug "Toggle edebug")
    ("E" hydra-edebug "edebug hydra")
    ("q" cancel-debug-on-entry "Cancel Debug on Entry")
    ("D" debug-on-entry "Debug on Entry"))
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
