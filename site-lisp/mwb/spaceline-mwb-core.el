;;; spaceline-mwb-core ---  spaceline-mwb common   -*- lexical-binding: t -*-

;; Copyright (C) 2021 Mark Bestley

;; Author: Mark Bestley <$(2:gnus@bestley.co.uk)>
;; Created: 27 Jul 2021
;; Version: 0.1
;; Package-Requires: (dependencies)

;; Keywords: mode-line

;; X-URL: https://github.com/bestlem/spaceline-mwb-core

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

;; Functions and variables for spaceline-mwb used in all

;;; Code:


;; Declare Customization Groups
(defgroup spaceline-mwb nil
  "Customize the the Spaceline All The Icons mode line and theming."
  :prefix "spaceline-mwb-"
  :group 'spaceline
  :group 'appearance)


;;; Global helper functions
(defun spaceline-mwb--mouse-map (mouse function) "\
Return a keymap with single entry for mouse key MOUSE on the mode and header lines.
MOUSE is defined to run function FUNCTION with no args in the buffer
corresponding to the mode line clicked."
	   (let ((map (make-sparse-keymap)))
		 (define-key map (vector 'mode-line mouse) function)
		 (define-key map (vector 'header-line mouse) function)
		 map))

(defmacro spaceline-mwb--headline-map-keymap (keymap)
  "Copy the mode-line KEYMAP to header-line."
  `(define-key ,keymap [header-line]
	 (lookup-key ,keymap [mode-line])))

;;; Full Modeline Definition
(defconst spaceline-mwb-mode-theme '("%e" (:eval (spaceline-ml-mwb-mode)))
  "Constant version of variable `spaceline-mwb-theme' to allow to be set manually.")
(defconst spaceline-mwb-head-theme '("%e" (:eval (spaceline-ml-mwb-head)))
  "Constant version of variable `spaceline-mwb-theme' to allow to be set manually.")


(spaceline-compile
  "mwb-head-theme"
  '(
    ((mwb-modified
	  all-the-icons-modified
	  all-the-icons-bookmark
	  all-the-icons-dedicated
	  all-the-icons-window-number
	  all-the-icons-eyebrowse-workspace
	  all-the-icons-buffer-size) :face highlight-face :skip-alternate t)

	;; all-the-icons-separator-left-active-1

	;; The actual buffer mode
	((all-the-icons-mode-icon)
	 :face default-face)

	;; all-the-icons-separator-left-active-2

	((all-the-icons-process
	  all-the-icons-position
	  all-the-icons-region-info
	  all-the-icons-fullscreen
	  all-the-icons-text-scale
	  all-the-icons-narrowed
	  all-the-icons-multiple-cursors)
	 :face highlight-face
	 :separator (spaceline-all-the-icons--separator spaceline-all-the-icons-primary-separator " "))

	(minor-modes :when active
	 :priority 9)
	all-the-icons-separator-left-active-3
	all-the-icons-separator-left-inactive



	((all-the-icons-separator-minor-mode-left
	  all-the-icons-minor-modes
	  all-the-icons-separator-minor-mode-right)
	 :tight t
	 :face highlight-face
	 :when spaceline-all-the-icons-minor-modes-p)

	)
  `(
	((flycheck-error flycheck-warning flycheck-info)
	 :when active
	 :priority 89)
	all-the-icons-separator-right-active-1
	((all-the-icons-hud
	  all-the-icons-buffer-position)
	 :separator " " :when active)

	;; all-the-icons-separator-right-active-2
	;; all-the-icons-separator-right-inactive
	))


;; Debugging functions
(defun spaceline-mwb--turn-off (segment) "Turn spaceline SEGMENT off." (funcall (intern (format "spaceline-toggle-mwb-%s-off" segment))))
(defun spaceline-mwb--turn-on (segment) "Turn spaceline SEGMENT on." (funcall (intern (format "spaceline-toggle-mwb-%s-on" segment))))
(defun spaceline-mwb--get-active-segments ()
  "Get a list of all currently active segment names."
  (let* ((segments (apropos-internal "^spaceline-mwb-.*-p$"))
         (active-segments (cl-remove-if-not (lambda (s) (and (boundp s) (symbol-value s))) segments)))
    (mapcar
     (lambda (segment) (prog2
                      (string-match "^spaceline-mwb-\\(.*?\\)-p$" (format "%s" segment))
                      (match-string 1 (format "%s" segment)))) active-segments)))

(defun spaceline-mwb--debug-segments (&optional pfx)
  "Programatically toggle active segments and report any that throw errors.
When PFX is non-nil, disable erroring segments at the same time."
  (interactive "P")
  (let* ((active-segments (spaceline-mwb--get-active-segments))
         (errors (cl-remove-if-not
                  (lambda (segment)
                    (mapc 'spaceline-mwb--turn-off active-segments)
                    (spaceline-mwb--turn-on segment)
                    (string= "" (format-mode-line spaceline-mwb-mode-theme)))
                  active-segments)))
    (mapc 'spaceline-mwb--turn-on active-segments)
    (if (not errors)
        (message "%s Spaceline is working fine!" (all-the-icons-wicon "stars"))
      (when pfx (mapc 'spaceline-mwb--turn-off errors))
      (error "%s Errors found in Spaceline Segments: [%s]"
             (all-the-icons-faicon "fire-extinguisher")
             (mapconcat 'identity errors ", ")))))

(provide 'spaceline-mwb-core)

;;; spaceline-mwb-core.el ends here
