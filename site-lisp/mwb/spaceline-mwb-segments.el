;;; spaceline-mwb-segments ---  Segments used by spaceline-mwb  -*- lexical-binding: t -*-

;; Copyright (C) 2021 Mark Bestley

;; Author: Mark Bestley <$(2:gnus@bestley.co.uk)>
;; Created: 20 Jun 2021
;; Version: 0.1
;; Package-Requires: (dependencies)

;; Keywords: mode-line

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

;; My modifications based on spaceline-all-the-icons but take the mopre complex
;; from, doom-modeline

;;; Code:
(require 'spaceline)
(require 'all-the-icons)

(provide 'spaceline-mwb-segments)



;;; First Divider Segments
(spaceline-define-segment mwb-modified
  "An `all-the-icons' segment depiciting the current buffers state"
  (let* ((buffer-state (format-mode-line "%*"))
         (icon (cond
                ((string= buffer-state "-") (car (spaceline-all-the-icons-icon-set-modified)))
                ((string= buffer-state "*") (cdr (spaceline-all-the-icons-icon-set-modified)))
                ((string= buffer-state "%") "lock"))))

    (propertize (all-the-icons-faicon icon :v-adjust 0.0)
                'face `(:family ,(all-the-icons-faicon-family) :height ,(spaceline-all-the-icons--height 1.1) :inherit)
                'mouse-face (spaceline-all-the-icons--highlight)
                'local-map (make-mode-line-mouse-map 'mouse-1 'read-only-mode)))
  :tight t)

;;; spaceline-mwb-segments.el ends here
