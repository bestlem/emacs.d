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
(require 'mwb-icons)

(defmacro mwb-headline--map-keymap (keymap)
  "Copy the mode-line KEYMAP to header-line."
  `(define-key ,keymap [header-line]
	 (lookup-key ,keymap [mode-line])))

(defun mwb-headline--keymap-header-and-mode (keymap)
  "Return a mode-line KEYMAP copied to header-line as well."
  (mwb-headline--map-keymap keymap)
  keymap)

;;; Create icons


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
								 (icon (mwb-icons-get-icon icon-key)))

							(propertize icon
										'mouse-face (spaceline-all-the-icons--highlight)
										'local-map (mwb-headline--keymap-header-and-mode (make-mode-line-mouse-map 'mouse-1 'read-only-mode))))
						  :tight t)

(provide 'spaceline-mwb-segments)
;;; spaceline-mwb-segments.el ends here
