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

(defmacro mwb-headline--map-keymap (keymap)
  "Copy the mode-line KEYMAP to header-line."
  `(define-key ,keymap [header-line]
	 (lookup-key ,keymap [mode-line])))

(defun mwb-headline--keymap-header-and-mode (keymap)
  "Return a mode-line KEYMAP copied to header-line as well."
  (mwb-headline--map-keymap keymap)
  keymap)

;;; Create icons

(defvar spaceline-mwb--icon-list
  '(
    )
  "An alist of icon name and icon or text.")


(defun doom-modeline-propertize-icon (icon &optional face)
  "Propertize the ICON with the specified FACE.

The face should be the first attribute, or the font family may be overridden.
So convert the face \":family XXX :height XXX :inherit XXX\" to
\":inherit XXX :family XXX :height XXX\".
See https://github.com/seagle0128/doom-modeline/issues/301."
  (when-let ((props (get-text-property 0 'face icon)))
    (cl-destructuring-bind (&key family height inherit &allow-other-keys) props
      (propertize icon 'face `(:inherit ,(or face inherit props)
                               :family  ,family
                               :height  ,height)))))

(defun spaceline-mwb--modeline-icon (icon-set icon-name unicode text &rest args)
  "Return icon of ICON-NAME with ARGS in mode-line.

Taken from doom-modeline removing checks for are we in a display
to show icons or should we fallback to Unicode.

ICON-SET includes `octicon', `faicon', `material', `alltheicons' and `fileicon'.
UNICODE is the unicode char fallback. TEXT is the ASCII char fallback.
ARGS is same as `all-the-icons-octicon' and others."
  (let ((face (or (plist-get args :face) 'mode-line)))
    (or
     ;; Icons
     (when (and icon-name
                (not (string-empty-p icon-name)))
       (let ((icon (pcase icon-set
                     ('octicon
                      (apply #'all-the-icons-octicon icon-name args))
                     ('faicon
                      (apply #'all-the-icons-faicon icon-name args))
                     ('material
                      (apply #'all-the-icons-material icon-name args))
                     ('alltheicon
                      (apply #'all-the-icons-alltheicon icon-name args))
                     ('fileicon
                      (apply #'all-the-icons-fileicon icon-name args)))))
         (doom-modeline-propertize-icon icon face)))
     ;; Unicode fallback
     (and unicode
          (not (string-empty-p unicode))
          (char-displayable-p (string-to-char unicode))
          (propertize unicode 'face face))
     ;; ASCII text
     (and text (propertize text 'face face)))))

(defun spaceline-mwb-add-icon (name icon-set icon-name unicode text &rest args)
  "A cover to add icon to list.
NAME is the look up key for the icon rest as
Define icon of ICON-NAME with ARGS in mode-line.
ICON-SET includes `octicon', `faicon', `material', `alltheicons' and `fileicon'.
UNICODE is the unicode char fallback. TEXT is the ASCII char fallback.
ARGS is same as `all-the-icons-octicon' and others."
  (push
   (cons name  (spaceline-mwb--modeline-icon icon-set icon-name unicode text args))
   spaceline-mwb--icon-list))

(defun spaceline-mwb-get-icon (name)
  "Get the propertized icon stored under NAME."
  (cdr (assq name spaceline-mwb--icon-list)))

(spaceline-mwb-add-icon 'hardhat-protected
						nil nil  "⛑" "%1*"
						:face `(:inherit warning))
(spaceline-mwb-add-icon 'read-only
						'material "lock" "🔒" "%1*"
						:face `(:inherit warning))
(spaceline-mwb-add-icon 'modified
						'material "save" "💾" "%1*"
						:face `(:inherit warning))
(spaceline-mwb-add-icon 'missing
						'material "do_not_disturb_alt" "🚫" "!"
						:face `(:inherit error))
(spaceline-mwb-add-icon 'empty
						nil "" "" ""
						:face `(:inherit error))

;;; Segments
(spaceline-define-segment mwb-modified
  "An `all-the-icons' segment depiciting the current buffers state"
  (let* ((buffer-state (format-mode-line "%*"))
         (icon-key (cond
					((and (boundp 'hardhat-reasons) hardhat-reasons) 'hardhat-protected)
					(buffer-read-only 'read-only)
					((and buffer-file-name (buffer-modified-p)) 'modified)
					((and buffer-file-name
						  (not (file-remote-p buffer-file-name)) ; Avoid freezing while connection is lost
						  (not (file-exists-p buffer-file-name))) 'missing)
					(t 'empty)))
		 (icon (spaceline-mwb-get-icon icon-key)))

    (propertize icon
				'mouse-face (spaceline-all-the-icons--highlight)
				'local-map (mwb-headline--keymap-header-and-mode (make-mode-line-mouse-map 'mouse-1 'read-only-mode))))
  :tight t)

(provide 'spaceline-mwb-segments)
;;; spaceline-mwb-segments.el ends here
