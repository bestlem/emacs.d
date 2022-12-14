;;; grettke ---  Functions from  grettke -*- lexical-binding: t -*-

;; Copyright Grant Rettke 2019
;;           Mark Bestley 2022
;; Version: 0.1
;; Package-Requires: (dependencies)

;; Keywords: keywords

;; This file is not part of GNU Emacs

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;;
(require 'org)
(require 'org-element)

(defvar org-babel-default-header-args:R)
(defvar org-babel-default-header-args:posh)
(defvar org-babel-default-header-args:python)
(defvar org-babel-default-header-args:plantuml)
(defvar org-babel-default-header-args:dot)
(defvar org-babel-default-header-args:ditaa)

;;; Code:

(defun help/display-system-info ()
  "Show the version of org etc."
  (interactive)
  (message "<<<Org Information>>>\nThis buffer file: %s\nAs Of: %s\nOrg-Version: %s\nOrg-Git-Version:%s\nEmacs-Version: %s\nNoweb wrap start and stop delimeters: '%s' and '%s'\norg-babel-default-header-args:\n"
           buffer-file-name
		   (gcr--org-timestamp-no-colons)
           (org-version)
           (org-git-version)
           (emacs-version)
           org-babel-noweb-wrap-start
           org-babel-noweb-wrap-end)
  (pp org-babel-default-header-args))

(defun gcr--org-timestamp ()
  "Produces a full ISO 8601 format timestamp."
  (interactive)
  (let* ((timestamp-without-timezone (format-time-string "%Y-%m-%dT%T"))
         (timezone-name-in-numeric-form (format-time-string "%z"))
         (timezone-utf-offset
          (concat (substring timezone-name-in-numeric-form 0 3)
                  ":"
                  (substring timezone-name-in-numeric-form 3 5)))
         (timestamp (concat timestamp-without-timezone
                            timezone-utf-offset)))
    timestamp))

(defun gcr--org-timestamp-no-colons ()
  "Produces a full ISO 8601 format timestamp with colons replaced by hyphens."
  (interactive)
  (let* ((timestamp (gcr--org-timestamp))
         (timestamp-no-colons (replace-regexp-in-string ":" "-" timestamp)))
    timestamp-no-colons))

(defun help/set-org-babel-default-header-args (property value)
  "Easily set system header arguments in org mode.

PROPERTY is the system-wide value that you would like to modify.

VALUE is the new value you wish to store.

Attribution: URL `http://orgmode.org/manual/System_002dwide-header-arguments.html#System_002dwide-header-arguments'"
  (setq org-babel-default-header-args
        (cons (cons property value)
              (assq-delete-all property org-babel-default-header-args))))

(defun help/set-org-babel-default-inline-header-args (property value)
  "See `help/set-org-babel-default-header-args'; same but for inline header args.

Set the name PROPERTY to VALUE."
  (setq org-babel-default-inline-header-args
        (cons (cons property value)
              (assq-delete-all property org-babel-default-inline-header-args))))

(defun help/set-org-babel-default-header-args:R (property value)
  "See `help/set-org-babel-default-header-args'; same but for R.

Set the name PROPERTY to VALUE.
This is a copy and paste. Additional languages would warrant a refactor."
  (setq org-babel-default-header-args:R
        (cons (cons property value)
              (assq-delete-all property org-babel-default-header-args:R))))

(defun help/set-org-babel-default-header-args:ditaa (property value)
  "See `help/set-org-babel-default-header-args'; same but for ditaa.

Set the name PROPERTY to VALUE.
This is a copy and paste. Additional languages would warrant a refactor."
  (setq org-babel-default-header-args:ditaa
        (cons (cons property value)
              (assq-delete-all property org-babel-default-header-args:ditaa))))

(defun help/set-org-babel-default-header-args:dot (property value)
  "See `help/set-org-babel-default-header-args'; same but for dot.

Set the name PROPERTY to VALUE.
This is a copy and paste. Additional languages would warrant a refactor."
  (setq org-babel-default-header-args:dot
        (cons (cons property value)
              (assq-delete-all property org-babel-default-header-args:dot))))

(defun help/set-org-babel-default-header-args:plantuml (property value)
  "See `help/set-org-babel-default-header-args'; same but for plantuml.

Set the name PROPERTY to VALUE.
This is a copy and paste. Additional languages would warrant a refactor."
  (setq org-babel-default-header-args:plantuml
        (cons (cons property value)
              (assq-delete-all property org-babel-default-header-args:plantuml))))

(defun help/org-toggle-macro-markers ()
  "Toggle =org-hide-macro-markers=.

Non-nil mean font-lock should hide the brackets marking macro calls."
  (interactive)
  (let ((old org-hide-macro-markers)
        (new (not org-hide-macro-markers)))
    (setq org-hide-macro-markers new)
    (message "Just changed org-hide-macro-markers from %s to %s" old new)
    (font-lock-mode)
    (font-lock-mode)))

(defun help/org-prp-hdln ()
  "Visit every Headline and add an ID if needed.

If it doesn't have an ID property then add one and assign it
a UUID. Attribution: URL
`http://article.gmane.org/gmane.emacs.orgmode/99738'. It is OK to
leave the colon separator in here because these are never used as
Source-Blocks and the rest of the code expects the
colon separator."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (dolist (p (nreverse
                (org-element-map (org-element-parse-buffer 'headline) 'headline
                  (lambda (headline) (org-element-property :begin headline)))))
      (goto-char p)
      (org-id-get-create))
    (save-buffer)))

(defun help/org-id-new ()
  "Remove colons from Org-Id.
Re-purposing `org-id' hit a snag when colons were forbidden in
Source-Block names. Adding support for a user-defined Org-Id
separator would have fixed this but with no benefit to Org-Id.
So this function removes the colon instead."
  (interactive)
  (let* ((gend (org-id-new))
         (newid (replace-regexp-in-string ":" "_" gend)))
    newid))

(defun help/org-prp-src-blk ()
  "If it doesn't have a NAME property then add one.
Assign it a UUID. Attribution: URL `http://article.gmane.org/gmane.emacs.orgmode/99740'"
  (interactive)
  (help/org-2every-src-block
   #'(lambda (element)
       (if (not (org-element-property :name element))
           (let ((i (current-indentation)))
            (beginning-of-line)
            (save-excursion (insert "#+NAME: " (help/org-id-new) "\n"))
            (indent-to i)
            (forward-line 2))))))

(defconst help/org-special-pre "^\s*#[+]")

(defun help/org-2every-src-block (fn)
  "Visit every Source-Block and evaluate `FN'."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let ((case-fold-search t))
      (while (re-search-forward (concat help/org-special-pre "BEGIN_SRC") nil t)
        (let ((element (org-element-at-point)))
          (when (eq (org-element-type element) 'src-block)
            (funcall fn element)))))
    (save-buffer)))

(defun help/org-babel-demarcate-block ()
  "Add a NAME property then assign it a UUID."
  (interactive)
  (org-babel-demarcate-block)
  (insert "#+name: " (help/org-id-new))
  (beginning-of-line)
  (insert "\n"))

(provide 'grettke)

;;; grettke.el ends here
