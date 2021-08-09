;;; spaceline-all-the-icons.el --- A Spaceline theme using All The Icons

;; Copyright (C) 2017  Dominic Charlesworth <dgc336@gmail.com>
;;               2021  Mark Bestley
;; Author: Dominic Charlesworth <dgc336@gmail.com>
;; Package-Version: 0.0.1
;; Package-Requires: ((emacs "24.4") (all-the-icons "2.6.0") (spaceline
;;"2.0.0") (memoize "1.0.1") (spaceline-all-the-icons "1.4.0" )
;; URL: https://github.com/
;; Keywords: convenience, lisp, tools

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package is a theme for `spaceline' and recreates most of the
;; segments available in that package using icons from
;; `all-the-icons'.  Icon fonts allow for more tailored and detailed
;; information in the mode line.
;; Adds mwb version to them - eventually as headline as per nano-modeline

;;; Code:

(require 'spaceline)
(require 'spaceline-all-the-icons)
(require 'spaceline-all-the-icons-segments)
(require 'spaceline-segments)
(require 'spaceline-mwb-segments)
(require 'spaceline-all-the-icons-separators)
(require 'spaceline-mwb-core)
(require 'mwb-icons)
(require 'minions)

(defmacro mwb-headline--keymap-duo-header (keymap)
  "Copy the mode-line KEYMAP to header-line."
  `(define-key ,keymap [header-line]
	 (lookup-key ,keymap [mode-line])))

(defun mwb-headline--keymap-header-and-mode (keymap)
  "Return a mode-line KEYMAP copied to header-line as well."
  (mwb-headline--keymap-duo-header keymap)
  keymap)

;;; Forward declarations of Optional Dependencies




;;; Themes

(spaceline-compile
  "mwb-test"
  '(
	(mwb-mode-icon
	 mwb-minor-modes)
	(mwb-narrowed mwb-modified mwb-rw )
	recursive-edit
	(mwb-buffer-size line-column)
	)
  '(
	(all-the-icons-which-function)
	(mwb-flycheck
	 :when active :priority 89
	 )
	" "

	))

(spaceline-compile
  "mwb-mode-theme"
  '((all-the-icons-anzu
	 :face 'mode-line
	 :skip-alternate t)
    auto-compile
	mwb-projectile

	;; The actual buffer info
	((
	  ;; all-the-icons-mode-icon
	  ((all-the-icons-buffer-path
		all-the-icons-buffer-id) :separator ""))
	 :face default-face)



	;; all-the-icons-separator-left-active-3
	;; all-the-icons-separator-left-inactive

	((all-the-icons-vc-icon
	  all-the-icons-vc-status
	  ((all-the-icons-git-ahead
		all-the-icons-git-status) :separator " ")

	  all-the-icons-package-updates)
	 :face other-face
	 :separator (spaceline-all-the-icons--separator spaceline-all-the-icons-secondary-separator " "))


    )

  `(;; ((,@additional-segments) :when active :face 'powerline-active2)
	;; ((,@additional-segments) :when (not active) :face 'powerline-inactive2)
    python-env
    ((all-the-icons-which-function)
	 :face 'powerline-active2
	 :separator "")
	((
	  all-the-icons-package-updates)
	 :face other-face
	 :separator (spaceline-all-the-icons--separator spaceline-all-the-icons-secondary-separator " "))
	;; all-the-icons-separator-right-active-1


	;; all-the-icons-separator-right-active-2
	;; all-the-icons-separator-right-inactive
    ))



;;;###autoload
(defun spaceline-mwb-theme ()
  "Install my spaceline configs."
  (interactive)
  (minions-mode 1)
  ;;  set the header keymap as a copy of mode line
  (mwb-headline--keymap-duo-header mode-line-major-mode-keymap)
  (mwb-headline--keymap-duo-header mode-line-column-line-number-mode-map)
  (setq-default mode-line-format '("%e" (:eval (spaceline-ml-mwb-mode-theme))))
  (setq-default header-line-format '("%e" (:eval (spaceline-ml-mwb-test))))
  )

;; Interactive & Setup Functions



(provide 'spaceline-mwb)

;;; spaceline-mwb.el ends here

										; LocalWords:  Flycheck modeline
										; LocalWords:  flycheck spaceline
										; LocalWords:  concat
