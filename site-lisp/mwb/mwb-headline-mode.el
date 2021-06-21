;;; mwb-headline-mode ---  Addition to doom-modeline to give a header  -*- lexical-binding: t -*-

;; Copyright (C) 2021 Mark Bestley

;; Author: Mark Bestley <$(2:gnus@bestley.co.uk)>
;; Created: 10 Jun 2021
;; Version: 0.1
;; Package-Requires: (doom-modeline)

;; Keywords: mode-line header-line

;; X-URL: https://github.com/bestlem/mwb-headline-mode

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

;; This is a minor mode to set header-line use doom-modeline infra structure
;; and also setup doom-modeline for me.
;;
;;  Originally in org-mode but IU don't write enough commentary to make that
;; workwhile.

;;; Code:

(require 'doom-modeline-core)

(defgroup mwb-headline-mode nil
  "Addition to doom-modeline to give a header"
  :group 'mode-line)

;;; Support functions
(defmacro mwb-headline-map-keymap (keymap)
  "Copy the mode-line keymap to header-line."
  `(define-key ,keymap [header-line]
	 (lookup-key ,keymap [mode-line])))

(defun mwb-headline-set-main-headline (&optional default)
  "Set main header-line.
If DEFAULT is non-nil, set the default header-line for all buffers."
  (mwb-headline-set-headline 'main-headline default))

(defun mwb-headline-set-headline (key &optional default)
  "Set the headline format. Does nothing if the modeline KEY doesn't exist.
If DEFAULT is non-nil, set the default mode-line for all buffers."
  (when-let ((modeline (doom-modeline key)))
	(setf (if default
			  (default-value 'header-line-format)
			(buffer-local-value 'header-line-format (current-buffer)))
		  (list "%e" modeline))))

;;; Override doom-modeline functions

(defun doom-modeline-update-buffer-file-state-icon (&rest _)
  "Update the buffer or file state in mode-line.
Adds a hardhat indicator"
  (setq doom-modeline--buffer-file-state-icon
		(when doom-modeline-buffer-state-icon
		  (ignore-errors
			(concat
			 (cond
			  ((and (boundp 'hardhat-reasons) hardhat-reasons)
			   (doom-modeline-buffer-file-state-icon
				nil "⛑" "%1*" `(:inherit doom-modeline-warning
								:weight ,(if doom-modeline-icon
											 'normal
										   'bold))))

			  (buffer-read-only
			   (doom-modeline-buffer-file-state-icon
				"lock" "🔒" "%1*" `(:inherit doom-modeline-warning
									:weight ,(if doom-modeline-icon
												 'normal
											   'bold))))
			  ((and buffer-file-name (buffer-modified-p)
					doom-modeline-buffer-modification-icon)
			   (doom-modeline-buffer-file-state-icon
				"save" "💾" "%1*" `(:inherit doom-modeline-buffer-modified
									:weight ,(if doom-modeline-icon
												 'normal
											   'bold))))
			  ((and buffer-file-name
					(not (file-remote-p buffer-file-name)) ; Avoid freezing while connection is lost
					(not (file-exists-p buffer-file-name)))
			   (doom-modeline-buffer-file-state-icon
				"do_not_disturb_alt" "🚫" "!" 'doom-modeline-urgent))
			  (t ""))
			 (when (or (buffer-narrowed-p)
					   (and (bound-and-true-p fancy-narrow-mode)
							(fancy-narrow-active-p))
					   (bound-and-true-p dired-narrow-mode))
			   (doom-modeline-buffer-file-state-icon
				"vertical_align_center" "↕" "><" 'doom-modeline-warning)))))))

(defun doom-modeline-update-flycheck-icon (&optional status)
  "Update flycheck icon via STATUS.
Adds the headerline keymap "
  (setq doom-modeline--flycheck-icon
		(when-let
			((icon
			  (pcase status
				('finished (if flycheck-current-errors
							   (let-alist (doom-modeline--flycheck-count-errors)
								 (doom-modeline-checker-icon
								  "block" "🚫" "!"
								  (cond ((> \.error 0) 'doom-modeline-urgent)
										((> \.warning 0) 'doom-modeline-warning)
										(t 'doom-modeline-info))))
							 (doom-modeline-checker-icon "check" "✓" "-" 'doom-modeline-info)))
				('running (doom-modeline-checker-icon "access_time" "⏱" "*" 'doom-modeline-debug))
				('no-checker (doom-modeline-checker-icon "sim_card_alert" "⚠" "-" 'doom-modeline-debug))
				('errored (doom-modeline-checker-icon "sim_card_alert" "⚠" "-" 'doom-modeline-urgent))
				('interrupted (doom-modeline-checker-icon "pause" "⏸" "=" 'doom-modeline-debug))
				('suspicious (doom-modeline-checker-icon "priority_high" "❗" "!" 'doom-modeline-urgent))
				(_ nil))))
		  (propertize icon
					  'help-echo (concat "Flycheck\n"
										 (pcase status
										   ('finished "mouse-1: Display minor mode menu
mouse-2: Show help for minor mode")
										   ('running "Running...")
										   ('no-checker "No Checker")
										   ('errored "Error")
										   ('interrupted "Interrupted")
										   ('suspicious "Suspicious")))
					  'mouse-face 'mode-line-highlight
					  'local-map (let ((map (make-sparse-keymap)))
								   (define-key map [mode-line down-mouse-1]
									 flycheck-mode-menu-map)
								   (define-key map [mode-line mouse-2]
									 (lambda ()
									   (interactive)
									   (describe-function 'flycheck-mode)))
								   (mwb-headline-map-keymap map)
								   map)))))

(defun doom-modeline-update-flycheck-text (&optional status)
  "Update flycheck text via STATUS.
Add headerline menu"
  (setq doom-modeline--flycheck-text
		(when-let
			((text
			  (pcase status
				('finished (when flycheck-current-errors
							 (let-alist (doom-modeline--flycheck-count-errors)
							   (if doom-modeline-checker-simple-format
								   (doom-modeline-checker-text
									(number-to-string (+ \.error \.warning \.info))
									(cond ((> \.error 0) 'doom-modeline-urgent)
										  ((> \.warning 0) 'doom-modeline-warning)
										  (t 'doom-modeline-info)))
								 (format "%s/%s/%s"
										 (doom-modeline-checker-text (number-to-string \.error)
																	 'doom-modeline-urgent)
										 (doom-modeline-checker-text (number-to-string \.warning)
																	 'doom-modeline-warning)
										 (doom-modeline-checker-text (number-to-string \.info)
																	 'doom-modeline-info))))))
				('running nil)
				('no-checker nil)
				('errored (doom-modeline-checker-text "Error" 'doom-modeline-urgent))
				('interrupted (doom-modeline-checker-text "Interrupted" 'doom-modeline-debug))
				('suspicious (doom-modeline-checker-text "Suspicious" 'doom-modeline-urgent))
				(_ nil))))
		  (propertize
		   text
		   'help-echo (pcase status
						('finished
						 (concat
						  (when flycheck-current-errors
							(let-alist (doom-modeline--flycheck-count-errors)
							  (format "error: %d, warning: %d, info: %d\n" \.error \.warning \.info)))
						  "mouse-1: Show all errors
mouse-3: Next error"
						  (if (featurep 'mwheel)
							  "\nwheel-up/wheel-down: Previous/next error")))
						('running "Running...")
						('no-checker "No Checker")
						('errored "Error")
						('interrupted "Interrupted")
						('suspicious "Suspicious"))
		   'mouse-face 'mode-line-highlight
		   'local-map (let ((map (make-sparse-keymap)))
						(define-key map [mode-line mouse-1]
						  #'flycheck-list-errors)
						(define-key map [mode-line mouse-3]
						  #'flycheck-next-error)
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
						  (mwb-headline-map-keymap map)
						  map))))))

(defun mwb-modeline--hook-action (add? mappings)
  (let ((hook-action (if add? 'add-hook 'remove-hook))
		(elements (seq-partition mappings 2)))
	(dolist (elt elements)
	  (apply hook-action elt))))

(setq mwb-headline--hook-list
	  (list
	   'Info-mode-hook #'doom-modeline-set-info-modeline
	   'dired-mode-hook #'doom-modeline-set-project-modeline
	   'dashboard-mode-hook #'doom-modeline-set-dashboard-modeline
	   'image-mode-hook #'doom-modeline-set-media-modeline
	   'message-mode-hook #'doom-modeline-set-message-modeline
	   'git-commit-mode-hook #'doom-modeline-set-message-modeline
	   'magit-mode-hook #'doom-modeline-set-vcs-modeline
	   'circe-mode-hook #'doom-modeline-set-special-modeline
	   'erc-mode-hook #'doom-modeline-set-special-modeline
	   'rcirc-mode-hook #'doom-modeline-set-special-modeline
	   'pdf-view-mode-hook #'doom-modeline-set-pdf-modeline
	   'org-src-mode-hook #'doom-modeline-set-org-src-modeline
	   'git-timemachine-mode-hook #'doom-modeline-set-timemachine-modeline
	   'paradox-menu-mode-hook #'doom-modeline-set-package-modeline
	   'xwidget-webkit-mode-hook #'doom-modeline-set-minimal-modeline))

(defun mwb-headline--hook-action (add? mappings)
  (let ((hook-action (if add? 'add-hook 'remove-hook))
		(elements (seq-partition mappings 2)))
	(dolist (elt elements)
	  (apply hook-action elt))))

;;; The actual mode
;;;###autoload
(define-minor-mode mwb-headline-mode
  "Toggle headline on or off"
  :group 'mwb-headline
  :global t
  :lighter nil
  ;; :keymap mwb-headline-mode-map
  :keymap doom-modeline-mode-map

  (if mwb-headline-mode
	  (progn
		;; (doom-modeline-mode 1)
		(doom-modeline-refresh-bars)	; Create bars

		(mwb-headline-set-main-headline t)	; set default headline
		(doom-modeline-set-main-modeline t) ; Set default mode-line

		;; Apply to all existing buffers.
		(dolist (buf (buffer-list))
		  (with-current-buffer buf
			(mwb-headline-set-main-headline)
			(doom-modeline-set-main-modeline)))

		;;  set the header keymap as a copy of mode line
		(mwb-headline-map-keymap mode-line-major-mode-keymap)
		(mwb-headline-map-keymap mode-line-column-line-number-mode-map)

		;;  hooks for special cases
		;; For two-column editing
		(setq 2C-mode-line-format (doom-modeline 'special))

		;; Add hooks
		(mwb-headline--hook-action 't mwb-headline--hook-list)
		;; Add advices
        (advice-add #'helm-display-mode-line :after #'doom-modeline-set-helm-modeline)
		)
	;; Restore mode-line
	(let ((original-format (doom-modeline--original-value 'header-line-format)))
	  (setq-default header-line-format original-format)
	  (dolist (buf (buffer-list))
		(with-current-buffer buf
		  (setq header-line-format original-format))))
	(let ((original-format (doom-modeline--original-value 'mode-line-format)))
      (setq-default mode-line-format original-format)
      (dolist (buf (buffer-list))
        (with-current-buffer buf
          (setq mode-line-format original-format))))
	;; For two-column editing
    (setq 2C-mode-line-format (doom-modeline--original-value '2C-mode-line-format))

    ;; Remove hooks
	(mwb-headline--hook-action nil mwb-headline--hook-list)
	;; Remove advices
    (advice-remove #'helm-display-mode-line #'doom-modeline-set-helm-modeline)
	))

(provide 'mwb-headline-mode)

;;; mwb-headline-mode.el ends here
