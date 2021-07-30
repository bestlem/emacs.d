;;; spaceline-mwb-segments ---  Segments used by spaceline-mwb  -*- lexical-binding: t -*-

;; Copyright (C) 2021 Mark Bestley

;; Author: Mark Bestley <$(2:gnus@bestley.co.uk)>
;; Created: 20 Jun 2021
;; Version: 0.2
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
;; from, doom-modeline and also jp-modeline.
;; icons from eyeliner

;;; Code:
(require 'spaceline)
(require 'all-the-icons)
(require 'spaceline-mwb-core)

;;; Create icons

;;; Segments

(spaceline-define-segment mwb-projectile
  "An `all-the-icons' segment to indicate the current `projectile' project"
  (let ((help-echo "Switch Project")
		(local-map (spaceline-mwb--mouse-map 'mouse-1 'projectile-switch-project))
		(project-id (if (and (fboundp 'projectile-project-p) (projectile-project-p))
						(projectile-project-name) "×")))
	(propertize project-id
				'mouse-face 'mode-line-highlight
				'help-echo help-echo
				'local-map local-map)))


(spaceline-define-segment mwb-mode-icon
  "An `all-the-icons' segment indicating the current buffer's mode with an icon"
  (let ((icon (all-the-icons-icon-for-mode major-mode)))
    (unless (symbolp icon)
      (propertize icon
                  'help-echo (format "Major-mode: `%s'" major-mode)
				  'mouse-face 'mode-line-highlight
				  'local-map   mode-line-major-mode-keymap
                  'face `(;; :height ,(spaceline-all-the-icons--height 1.1)
                          :family ,(all-the-icons-icon-family-for-mode major-mode)
                          :inherit)))))

(spaceline-define-segment
	mwb-minor-modes
  "Taken from doom-modeline a minion in mode-line."
  (eyeliner/with-icon "gear"
	(propertize icon
				'mouse-face 'mode-line-highlight
				'help-echo "Minions
mouse-1: Display minor modes menu"
				'local-map minions-mode-line-minor-modes-map
				'face `(:family ,family
						:inherit)) ))

;;; Buffer state
(spaceline-define-segment mwb-narrowed
  "A segment to indicate whether the current buffer is narrowed."
  (eyeliner/with-icon "filter"
	(propertize icon
				'family family
				'help-echo "mouse-1: Widen the current file"
				'mouse-face mode-line-highlight
				'local-map (spaceline-mwb--mouse-map 'mouse-1 'widen)))
  :when (or (buffer-narrowed-p)
			(and (bound-and-true-p fancy-narrow-mode)
				 (fancy-narrow-active-p))))
(spaceline-define-segment
	mwb-modified
  "A iconised status of buffer showing readonly/modified."
  (when (and buffer-file-name (buffer-modified-p))
	(mwb-icon-with-family "save")))

(spaceline-define-segment mwb-rw
  (let ((ro-icon (cond ((and (boundp 'hardhat-reasons) hardhat-reasons) "h-square")
					   (buffer-read-only "lock")
					   (t "unlock"))))
	(propertize (mwb-icon-with-family ro-icon)
				'mouse-face 'mode-line-highlight
				'local-map (spaceline-mwb--mouse-map 'mouse-1 'read-only-mode))))

(spaceline-define-segment mwb-buffer-size
  "The size of the buffer.
Can't use spaceline as it has unneeded mouse menu"
  "%I")

;;; Flycheck -
;; Keys based on doom-modeline
;; Implementation start with jp-modeline and build on that
;;  Both used hooks rather than simple modeline formatting.

;; free variables and functions
(defvar flycheck-current-errors)
(defvar flycheck-mode-menu-map)
(declare-function flycheck-count-errors 'flycheck)
(declare-function flycheck-list-errors 'flycheck)
(declare-function flycheck-next-error 'flycheck)
(declare-function flycheck-previous-error 'flycheck)

(defvar-local spaceline-mwb--flycheck-text nil
  "Variable to be updated to keep flycheck status.")

(defun spaceline-mwb--format-fly-error-count (error warning info)
  "A string formatting the counts of ERROR WARNING and INFO."
  (let ((num-error (if error error 0))
		(num-warning (if warning warning 0))
		(num-info (if info info 0)))
	(format "error: %d, warning: %d, info: %d\n"
			num-error num-warning num-info)))

(defun spaceline-mwb--flycheck-mouse-menu ()
  "Provide the mouse menu for flycheck in mode and header line."
  (let ((map (make-sparse-keymap)))
    (define-key map [mode-line down-mouse-1] flycheck-mode-menu-map)
    (define-key map [mode-line mouse-2] 'flycheck-list-errors)
	(define-key map [mode-line mouse-3] #'flycheck-next-error)
	(when (featurep 'mwheel)
      (define-key map (vector 'mode-line
                              mouse-wheel-down-event)
        (lambda (event)
          (interactive "e")
          (with-selected-window (posn-window (event-start event))
            (flycheck-previous-error 1))))
      (define-key map (vector 'mode-line
                              mouse-wheel-up-event)
        (lambda (event)
          (interactive "e")
          (with-selected-window (posn-window (event-start event))
            (flycheck-next-error 1))))
      map)
    (spaceline-mwb--headline-map-keymap map)
	map)
  )

(defun spaceline-mwb--flycheck-finished ()
  "Gives a formatted text to show in mode-line and the help text for mousing over the text."
  (if flycheck-current-errors
	  (let-alist (flycheck-count-errors flycheck-current-errors)
		(let* ((text (cond
					  (\.error (propertize (format "✗%s" \.error) 'face 'error))
					  (\.warning (propertize (format "✗%s" \.warning) 'face 'warning))
					  (\.info (propertize (format "✗%s" \.info) 'face 'spaceline-flycheck-info))
					  (t (propertize "✓" 'face 'success))))
			   (help (concat (spaceline-mwb--format-fly-error-count
							  \.error \.warning \.info)
							 "mouse-1: Display minor mode menu\n"
							 "mouse-2: Show all errors\nmouse-3: Next error"
							 (if (featurep 'mwheel)
								 "\nwheel-up/wheel-down: Previous/next error"))))
		  (list text help)))
	(list (propertize "✔" 'face 'success)
		  "")))

(defun spaceline-mwb--flycheck-status (status)
  "Give a list of icon and face for the flycheck STATUS."
  (pcase status
	('finished (spaceline-mwb--flycheck-finished))
	('running (list (propertize "…" 'face 'spaceline-flycheck-info) "Running..."))
	('no-checker (list "⚠" "No Checker"))
	('errored (list (propertize "✖" 'face 'error) "Error"))
	('interrupted (list (propertize "!" 'face 'warning) "Interrupted"))))

(defun spaceline-mwb--update-flycheck-segment (&optional status)
  "Update `mood-line--flycheck-text' against the reported flycheck STATUS."
  (setq spaceline-mwb--flycheck-text
		(when-let
			((fly (spaceline-mwb--flycheck-status status)))
		  (pcase-let ((`(,text ,help) fly))
			(propertize
			 text
			 'help-echo help
			 'mouse-face 'mode-line-highlight
			 'local-map (spaceline-mwb--flycheck-mouse-menu) )))))

(add-hook 'flycheck-status-changed-functions #'spaceline-mwb--update-flycheck-segment)
(add-hook 'flycheck-mode-hook #'spaceline-mwb--update-flycheck-segment)

(spaceline-define-segment mwb-flycheck
  "Show if there are any flycheck errors/warnings/issues."
  (when spaceline-mwb--flycheck-text
	spaceline-mwb--flycheck-text))


(provide 'spaceline-mwb-segments)
;;; spaceline-mwb-segments.el ends here

										; LocalWords:  flycheck spaceline
; LocalWords:  iconset
