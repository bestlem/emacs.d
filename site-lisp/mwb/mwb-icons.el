;;; mwb-icons ---  Setup icons in a lookup  -*- lexical-binding: t -*-

;; Copyright (C) 2021 Mark Bestley

;; Author: Mark Bestley <$(2:gnus@bestley.co.uk)>
;; Created: 07 Jul 2021
;; Version: 0.1
;; Package-Requires: (all-the-icons)

;; Keywords: icons

;; X-URL: https://github.com/bestlem/mwb-icons

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

;; This sets up an alist of icons so that they can be accessed by name using
;; function mwb-get-icon

;;; Code:

(require 'all-the-icons)

(defgroup mwb-icons nil
  "Setup icons in a lookup"
  :group 'mwb-icons)

(eval-and-compile
  (defun mwb-icon--propertize-icon (icon &optional face)
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

  (defun mwb-icon--modeline-icon (icon-set icon-name unicode text &rest args)
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
		   (mwb-icon--propertize-icon icon face)))
	   ;; Unicode fallback
	   (and unicode
			(not (string-empty-p unicode))
			(char-displayable-p (string-to-char unicode))
			(propertize unicode 'face face))
	   ;; ASCII text
	   (and text (propertize text 'face face)))))

  (defun mwb-icon--name-and-icon (name icon-set icon-name unicode text &rest args)
	"A cover to add icon to list return a cons of NAME and an icon.
NAME is the look up key for the icon rest as
Define icon of ICON-NAME with ARGS in mode-line.
ICON-SET includes `octicon', `faicon', `material', `alltheicons' and `fileicon'.
UNICODE is the unicode char fallback. TEXT is the ASCII char fallback.
ARGS is same as `all-the-icons-octicon' and others."
	(cons name (mwb-icon--modeline-icon icon-set icon-name unicode text args)))
  )

(defvar mwb-icon--list
  (eval-when-compile
	(list
	 (mwb-icon--name-and-icon 'hardhat-protected
							  'faicon "h-square"  "⛑" "%1*"
							  `(:inherit warning  ))
	 (mwb-icon--name-and-icon 'read-only
							  'material "lock" "🔒" "%1*"
							  `(:inherit warning))
	 (mwb-icon--name-and-icon 'modified
							  'material "save" "💾" "%1*"
							  `(:inherit warning))
	 (mwb-icon--name-and-icon 'missing
							  'material "do_not_disturb_alt" "🚫" "!"
							  `(:inherit error))
	 (mwb-icon--name-and-icon 'OK
							  'faicon"check" "✔" " "
							  `(:inherit error)))
	)
  "An alist of icon name and icon or text.")

;;;###autoload
(defun mwb-icons-get-icon (name)
  "Get the propertized icon stored under NAME."
  (cdr (assq name mwb-icon--list)))

(provide 'mwb-icons)
;;; mwb-icons.el ends here
