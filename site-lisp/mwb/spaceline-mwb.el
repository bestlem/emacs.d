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

;;; Forward declarations of Optional Dependencies
(declare-function python-pyenv 'python-mode)

;; Declare Customization Groups
(defgroup spaceline-mwb nil
  "Customize the the Spaceline All The Icons mode line and theming."
  :prefix "spaceline-mwb-"
  :group 'spaceline
  :group 'appearance)


;;; Global helper functions


;;; Full Modeline Definition
(defconst spaceline-mwb-mode-theme '("%e" (:eval (spaceline-ml-mwb-mode)))
  "Constant version of variable `spaceline-mwb-theme' to allow to be set manually.")
(defconst spaceline-mwb-head-theme '("%e" (:eval (spaceline-ml-mwb-head)))
  "Constant version of variable `spaceline-mwb-theme' to allow to be set manually.")


;;; Themes
(spaceline-compile
  "mwb-mode-theme"
  '((all-the-icons-anzu
	 :face 'mode-line
	 :skip-alternate t)
    auto-compile

	((all-the-icons-modified
	  all-the-icons-bookmark
	  all-the-icons-dedicated
	  all-the-icons-window-number
	  all-the-icons-eyebrowse-workspace
	  all-the-icons-buffer-size) :face highlight-face :skip-alternate t)



	;; The actual buffer info
	((all-the-icons-projectile
	  all-the-icons-mode-icon
	  ((all-the-icons-buffer-path
		all-the-icons-buffer-id) :separator ""))
	 :face default-face)



	((all-the-icons-process
	  all-the-icons-position
	  all-the-icons-region-info
	  all-the-icons-fullscreen
	  all-the-icons-text-scale
	  all-the-icons-narrowed
	  all-the-icons-multiple-cursors)
	 :face highlight-face
	 :separator (spaceline-all-the-icons--separator spaceline-all-the-icons-primary-separator " "))

	;; all-the-icons-separator-left-active-3
	;; all-the-icons-separator-left-inactive

	((all-the-icons-vc-icon
	  all-the-icons-vc-status
	  ((all-the-icons-git-ahead
		all-the-icons-git-status) :separator " ")

	  all-the-icons-package-updates)
	 :face other-face
	 :separator (spaceline-all-the-icons--separator spaceline-all-the-icons-secondary-separator " "))

	((all-the-icons-separator-minor-mode-left
	  all-the-icons-minor-modes
	  all-the-icons-separator-minor-mode-right)
	 :tight t
	 :face highlight-face
	 :when spaceline-all-the-icons-minor-modes-p)
    )

  `(;; ((,@additional-segments) :when active :face 'powerline-active2)
	;; ((,@additional-segments) :when (not active) :face 'powerline-inactive2)
    python-env
    ((all-the-icons-which-function)
	 :face 'powerline-active2
	 :separator "")
	((((all-the-icons-flycheck-status
		all-the-icons-flycheck-status-info) :separator " ")
	  all-the-icons-package-updates)
	 :face other-face
	 :separator (spaceline-all-the-icons--separator spaceline-all-the-icons-secondary-separator " "))
	;; all-the-icons-separator-right-active-1
	((all-the-icons-hud
	  all-the-icons-buffer-position)
	 :separator " " :when active)

	;; all-the-icons-separator-right-active-2
	;; all-the-icons-separator-right-inactive
    ))

;;;###autoload
(defun spaceline-mwb-theme (&rest additional-segments)
  "Install the `spaceline-ml-all-the-icons'wb.
Add ADDITIONAL-SEGMENTS to the end of the theme."
  (interactive)


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
	`(((,@additional-segments) :when active :face 'powerline-active2)
	  ((,@additional-segments) :when (not active) :face 'powerline-inactive2)

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
  (setq-default mode-line-format '("%e" (:eval (spaceline-ml-mwb-mode-theme))))
  (setq-default header-line-format '("%e" (:eval (spaceline-ml-mwb-head-theme))))
  )

;; Interactive & Setup Functions


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

(provide 'spaceline-mwb)

;;; spaceline-mwb.el ends here
