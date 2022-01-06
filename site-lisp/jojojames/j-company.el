;;; j-company ---  Functions to setup company from jojojames  -*- lexical-binding: t -*-

;; Copyright (C) 2021 James Nguyen

;; Author: James Nguyen <james@jojojames.com>
;; Copyright (C) 2022 Mark Bestley

;; Package-Requires: (dependencies)

;; Keywords: keywords

;; X-URL: https://github.com/jojojames/.emacs.d/blob/2020.2/config/jn-autocomplete.el

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

;; This is a copy of the functions in the setup for company to provide a better
;; set of possible completions - mainly stop duplicates

;;

;;; Code:

(require 'cl-seq)

(defvar company-backends)

;; https://github.com/company-mode/company-mode/issues/205
(defun company--unique-match-p/not-yasnippet (candidates _prefix _ignore-case)
  (not (get-text-property 0 'yas-template (car candidates))))

(advice-add 'company--unique-match-p :after-while
            'company--unique-match-p/not-yasnippet)

(defun j-company-backend-in-backends (b)
  "Check if backend B is already in `company-backends'."
  (if (member b company-backends)
      t
    (let ((in-backend nil))
      (dolist (backend company-backends)
        (when (and
               (consp backend)
               (member b backend))
          (setq in-backend t)))
      in-backend)))

(defun j-company-push-backend (backend &optional local append)
  "Adds backend BACKEND to company mode if it's not already in the list of backends.
IF APPEND, add to end of list."
  (when local
    (make-local-variable 'company-backends))
  (unless (j-company-backend-in-backends backend)
    (if append
        (setcdr (last company-backends) (list backend))
      (push backend company-backends))
    (j-company-merge-backends)))

(defun company-merge-with-backends (backend-to-merge)
  "Merges a backend with every backend in company-backends.
BACKEND-TO_MERGE will only be merged if it's not already in the current backend.

Merging `company-yasnippet' to `company-capf' will yield
'\(company-capf :with company-yasnippet\)."
  (setq company-backends
        (mapcar (lambda (backend)
                  (cond
                   ((and (listp backend)
                         (member backend-to-merge backend))
                    backend)
                   (:else
                    (append (if (consp backend)
                                backend
                              (list backend))
                            (if (and (listp backend)
                                     (member :with backend))
                                `(,backend-to-merge)
                              `(:with ,backend-to-merge))))))
                company-backends)))

(defun j-company-merge-backends ()
  "Merge common backends."
  (interactive)
  (company-merge-with-backends 'company-yasnippet)
  (company-merge-with-backends 'company-dabbrev-code))

(defun j-company-remove-dabbrev-dups-keep-order (candidates)
  "Loop over CANDIDATES and remove duplicate candidates if they belong to
  `company-dabbrev' or `company-dabbrev-code'."
  (let ((hash (make-hash-table :test 'equal :size (length candidates)))
        (new-list nil))
    (dolist (candidate candidates)
      (let ((stripped-candidate (substring-no-properties candidate))
            (candidate-backend (get-text-property 0 'company-backend candidate)))
        (cond
         ;; Candidate is `company-yasnippet', always push this.
         ((eq (get-text-property 0 'company-backend candidate)
              'company-yasnippet)
          (push candidate new-list))
         ;; Candidate has not been seen.
         ((not (gethash stripped-candidate hash))
          (puthash stripped-candidate candidate hash)
          (push candidate new-list))
         ;; Candidate has been seen.
         ;; `company-dabbrev' or `company-dabbrev-code' is the candidate.
         ((or candidate-backend
              (eq candidate-backend 'company-dabbrev-code)
              (eq candidate-backend 'company-dabbrev))
          t)
         ;; Candidate has been seen but is not `company-dabbrev'
         ;; or `company-dabbrev-code'.
         (:seen-but-candidate-not-dabbrev
          ;; If the candidate in the hash table is dabbrev, replace it.
          ;; Otherwise, we are fine with duplicates as long as the backends
          ;; are meaningful.
          (let* ((hash-candidate (gethash stripped-candidate hash))
                 (hash-backend (get-text-property
                                0 'company-backend hash-candidate)))
            (if (or hash-backend
                    (eq hash-backend 'company-dabbrev)
                    (eq hash-backend 'company-dabbrev-code))
                (progn
                  (setcar
                   (nthcdr
                    (cl-position hash-candidate new-list :test 'eq)
                    new-list)
                   candidate)
                  (puthash stripped-candidate candidate hash)
                  t)
              ;; Only need one candidate in the hash table.
              (push candidate new-list)))))))
    (reverse new-list)))

(defun j-company-tng-configure-default ()
  "Applies the default configuration to enable `company-tng'."
  ;; Copied from `company-tng-mode'.
  (advice-add #'eglot--snippet-expansion-fn :override #'ignore)
  (setq company-selection-default nil)
  (setq company-require-match nil)

  (defun j-company-expand-yasnippet-or-return ()
    "Expand yas template or call RET normally.

If `yasnippet' expansion in progress, always complete selection."
    (interactive)
    (cond
     ;; `yasnippet' expansion in progress.
     ((yas-current-field)
      (call-interactively #'company-complete-selection))
     ;; Check the type of the candidate.
     ((and company-active-map
           company-selection-changed
           (car company-candidates) ;; Making sure there are candidates.
           (let ((candidate (nth company-selection
                                 company-candidates)))
             (or
              ;; This might work for `eglot'.
              ;; (get-text-property 0 :label candidate)
              ;; `company-lsp'
              (get-text-property 0 'lsp-completion-item candidate)
              ;; `company-sourcekit'
              (get-text-property 0 'sourcetext candidate)
              ;; `yasnippet'
              (get-text-property 0 'yas-template candidate))))
      (call-interactively #'company-complete-selection))
     (:default
      (when company-selection-changed
        (company-complete-selection))
      (let ((company-active-map))
        (call-interactively (key-binding (kbd "RET")))))))

  (setq company-frontends
        '(company-tng-frontend
          company-pseudo-tooltip-unless-just-one-frontend
          company-echo-metadata-frontend
          company-preview-unless-selection
          company-quickhelp-frontend))

  ;; https://github.com/company-mode/company-mode/pull/706
  (defun company-preview-unless-selection (command)
    "`company-preview-frontend', but only if there's no selection"
    (unless (and (eq command 'post-command)
                 company-selection)
      (pcase command
        (`pre-command (company-preview-hide))
        (`post-command
         (company-preview-show-at-point (point)
                                        (nth 0 company-candidates)))
        (`hide (company-preview-hide)))))

  (defvar company-cancel-or-backspace
    `(menu-item "" nil :filter ,(lambda (&optional _)
                                  (when company-selection
                                   #'company-abort)))
    "If we made a selection during company completion, cancel it.")

  (defun j-company-complete-selection ()
    "Insert the selected candidate even if the user hasn't selected anything.
The first candidate will be DWIM."
    (interactive)
    (when (company-manual-begin)
      (let ((result (nth (if company-selection
                             company-selection
                           0)
                         company-candidates)))
        (company-finish result))))
  (advice-add 'company-complete-selection :override 'j-company-complete-selection))


(provide 'j-company)
;;; j-company.el ends here
