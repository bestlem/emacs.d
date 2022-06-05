;;; org-hide-properties.el --- Hide properties in org files  -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Arthur Miller

;; Author: Arthur Miller <arthur.miller@live.com>
;; Keywords: convenience, outlines, tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;; Author: Arthur Miller
;; Version: 0.0.1
;; Keywords: tools convenience
;; Package-Requires: ((emacs "24.1"))
;; URL: https://github.com/amno1/org-hide-properties

;;; Commentary:

;; A minor mode to help reduce clutter in org-mode files by
;; hiding/unhiding properties in org-mode.
;;
;; To hide all property drawers turn on org-hide-properties-mode on:
;;
;;          `M-x org-hide-properties-mode.'
;;
;; To turn it off execute the same command.

;;; Issues

;;; Code:
(require 'org)

(defgroup org-hide-properties nil
  "Hide property drawers in org-headings."
  :prefix "org-hide-properties-"
  :group 'org)

(defun org-hide-properties--update (visibility)
  "Set invisible property to VISIBILITY for properties in the current buffer."
  (org-with-wide-buffer
   (save-excursion
     (with-silent-modifications
       (goto-char (point-min))
       (while (re-search-forward org-property-drawer-re nil t)
         (put-text-property
          (match-beginning 0) (match-end 0) 'invisible visibility))
       (goto-char (point-min))
       (while (re-search-forward "^[ \t]*#\\+PROPERTY:.*$" nil t)
         (put-text-property
          (match-beginning 0) (match-end 0) 'invisible visibility))))))

;;;###autoload
(define-minor-mode org-hide-properties-mode
  "Hide/show babel source code blocks on demand."
  :global nil :lighter " Org-hps"
  (unless (derived-mode-p 'org-mode)
    (error "Not in org-mode"))
  (cond (org-hide-properties-mode
         (org-hide-properties--update t))
        (t (org-hide-properties--update nil))))

(provide 'org-hide-properties)

;;; org-hide-properties.el ends here
