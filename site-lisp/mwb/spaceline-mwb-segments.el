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
(require 'mwb-fns)

;;; Forward declarations of Optional Dependencies
(declare-function projectile-project-root "ext:projectile.el")
;; (declare-function fancy-narrow-active-p "ext:fancy-narrow.el")
(defvar which-func-keymap)

;;; help spaceline segments to work especially in header
(with-eval-after-load 'which-func
  (spaceline-mwb--headline-map-keymap which-func-keymap))
;;; Create icons

;;; Segments

(spaceline-define-segment mwb-projectile
  "An `all-the-icons' segment to indicate the current `projectile' project"
  (let ((help-echo "Switch Project")
		(local-map (spaceline-mwb--mouse-map 'mouse-1 'projectile-switch-project))
		(project-id (if (and (fboundp 'projectile-project-p) (projectile-project-p))
						(projectile-project-name) "×")))
	(propertize project-id
				'face `(:height 0.8 :inherit)
				'display `(raise 0.2)
				'mouse-face 'mode-line-highlight
				'help-echo help-echo
				'local-map local-map)))


(spaceline-define-segment mwb-mode-icon
  "An `all-the-icons' segment indicating the current buffer's mode with an icon. spaceline does not check for missing icon so try e"
  (let* ((icon-major (all-the-icons-icon-for-mode major-mode))
		 (family-major (all-the-icons-icon-family-for-mode major-mode)))
	(if (and icon-major family-major)
		(propertize icon-major
					'local-map   mode-line-major-mode-keymap
					'mouse-face 'mode-line-highlight
					'help-echo (format "Major-mode: `%s'" major-mode)
					'display '(raise 0)
					'face `(
							:height 0.9
							:family ,(all-the-icons-icon-family-for-mode major-mode)
							:inherit))
	  ;; (message "Bars Not found %s %s %s" major-mode icon family)
      (propertize  (format "%s" major-mode)
				   'local-map   mode-line-major-mode-keymap
				   'mouse-face 'mode-line-highlight
				   'help-echo (format "Major-mode (unknown icon): `%s'" major-mode)
				   'display `(raise 0)
				   'face `(
						   :inherit)))))


(spaceline-define-segment
	mwb-minor-modes
  "Taken from doom-modeline a minion in mode-line."
  (
   eyeliner/with-icon "gear"
   (propertize icon
			   'mouse-face 'mode-line-highlight
			   'help-echo "Minions
mouse-1: Display minor modes menu"
			   'local-map minions-mode-line-minor-modes-map
			   'display `(:raise 1.0)
			   'face `(:family ,family
					   :height 0.8
					   :inherit))))

;;; Buffer state
(spaceline-define-segment mwb-narrowed
  "A segment to indicate whether the current buffer is narrowed."
  (eyeliner/with-icon "arrows-h"
	(propertize icon
				'face `(:family ,family
						;; :height 0.8
						:inherit)
				'display '(:raise 1.0)
				'help-echo "mouse-1: Widen the current file"
				'mouse-face 'mode-line-highlight
				'local-map (spaceline-mwb--mouse-map 'mouse-1 'widen)))
  :when (or (buffer-narrowed-p)
			;; (and (bound-and-true-p fancy-narrow-mode)
			;; 	 (fancy-narrow-active-p))
			))

(spaceline-define-segment
	mwb-modified
  "A iconised status of buffer showing readonly/modified."
  (when (and buffer-file-name (buffer-modified-p))
	(propertize (mwb-icon-get "save")
				;; 'display '(:raise 0.3)
				'face '(:inherit))))

(spaceline-define-segment mwb-rw
  (let ((ro-icon (cond (buffer-read-only "lock")
					   (t "unlock"))))
	(propertize (mwb-icon-get ro-icon)
				'mouse-face 'mode-line-highlight
				'local-map (spaceline-mwb--mouse-map 'mouse-1 'read-only-mode)
				'display '(:raise 1.0)
				'face '(:inherit))))

(spaceline-define-segment mwb-hardhat
  (when (and (boundp 'hardhat-reasons) hardhat-reasons)
	(propertize (mwb-icon-get "h-square")
				'display '(:raise 1.0)
				'face '(:inherit))))

(spaceline-define-segment mwb-buffer-size
  "The size of the buffer.
Can't use spaceline as it has unneeded mouse menu"
  "%I")

;;; Odds from spaceline and all-the-icons
;; Mainly issues with mouse
(spaceline-define-segment mwb-bookmark
  "An `all-the-icons' segment allowing for easy bookmarking of files."
  (when (buffer-file-name)
	(let-alist (spaceline-all-the-icons-icon-set-bookmark)
	  (let* ((bookmark-name (buffer-file-name))
			 (bookmark (cl-find-if (lambda (it) (string= bookmark-name (car it))) bookmark-alist)))

		(propertize (all-the-icons-faicon (if bookmark .icon.on .icon.off) :v-adjust 0.1)
					'face      `(:family ,(all-the-icons-faicon-family) :height ,(spaceline-all-the-icons--height):inherit)
					'help-echo  (if bookmark .echo.off .echo.on)
					'mouse-face (spaceline-all-the-icons--highlight)
					'local-map  (spaceline-mwb--mouse-map
								 'mouse-1
								 `(lambda () (interactive)
									(if ,(car bookmark)
										(bookmark-delete ,(car bookmark))
									  (bookmark-set ,bookmark-name))
									(force-mode-line-update))))))))

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
  "Return the formatted segment.

Gives a formatted text to show in mode-line and the help text for
mousing over the text."
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

;;; Racket segments
;;;; Forward declarations

(declare-function racket--cmd-open-p "racket-xp")
(declare-function racket-xp-mode-menu "racket-xp")
(defvar racket-xp-mode-menu )

(defvar spaceline-mwb--racket-menu
  (let ((map (make-sparse-keymap)))
    (define-key map [mode-line mouse-1] (lambda (_)
										  (interactive "e")
										  (popup-menu racket-xp-mode-menu)))
    (spaceline-mwb--headline-map-keymap map)
	map))


(defvar-local spaceline-mwb--racket--xp-mode-status nil)

(defun  spaceline-mwb--racket-text-construct (status text face-name help-echo)
  "Construct the propertized TEXT for display of racket STATUS.
using FACE-NAME and HELP-ECHO."
  (cons status
		(propertize text
					'face face-name
					'mouse-face 'mode-line-highlight
					'local-map spaceline-mwb--racket-menu
					'help-echo help-echo
					)))

(defvar spaceline-mwb--racket-text-alist
  (mwb-mapcar* 'spaceline-mwb--racket-text-construct
			   '((ok "✔" success
				  "Syntax OK")
				 (err "✖" modus-themes-intense-red
				  "Syntax error")
				 (outdated "…" spaceline-flycheck-info
				  "Outdated: Waiting for `racket-xp-after-change-refresh-delay' or manual `racket-xp-annotate'")
				 (running "λ" spaceline-flycheck-info
				  "Getting analysis from Racket Mode back-end and annotating")
				 (otherwise "!" racket-xp-error-face
				  "Racket Mode back-end not available"))))

(defun spaceline-mwb--racket--xp-update (&optional status)
  "My version of racket--xp-mode-status. Setting the variable to STATUS."
  (let ((text (alist-get status spaceline-mwb--racket-text-alist)))
	(setq spaceline-mwb--racket--xp-mode-status text)))

(advice-add  'racket--xp-set-status :before 'spaceline-mwb--racket--xp-update)

(spaceline-define-segment
	mwb-racket
  "Show racket mode+ status. Taken from racket--xp-mode-lighter and a bit from on flycheck."
  ;; (concat  "Rkt" (racket--xp-mode-lighter))
  (when (eq major-mode 'racket-mode)
	spaceline-mwb--racket--xp-mode-status
	;; (racket--xp-mode-lighter)
	)
  )

(provide 'spaceline-mwb-segments)
;;; spaceline-mwb-segments.el ends here
