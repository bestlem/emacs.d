;;; mwb-modeline.el --- An awesome elisp package -*- lexical-binding: t; -*-

;; Copyright (C) 2017 Jerry Peng
;; (c) 2021 Mark Bestley
;; Based on amitp from Red Blob Games <redblobgames@gmail.com>
;; Author: Jerry Peng <pr2jerry@gmail.com>

;;; Commentary:
;;
;; Taken from http://amitp.blogspot.co.nz/2011/08/emacs-custom-mode-line.html with
;; some modifications
;;
;;  Amit is now on
;;https://gist.github.com/redblobgames/5d9cf891120028440a4bdb429f101de6

;;; Code:

(require 'all-the-icons)
(require 'jp-icons)
(require 'jp-modeline)
(require 's)
(require 'moody)


(defun mwb-modeline-encoding ()
  " From jp-modeline-encoding and doom-modeline-def-segment"
  )

(defun mwb-headline-filename ()
  (let* ((face (if (jp-modeline-active-p) 'mode-line-filename-face 'mode-line-filename-inactive-face))
         (icon-face (unless (jp-modeline-active-p) 'mode-line-inactive))
         (filename (propertize (s-concat
								(when (buffer-file-name)
								  (shorten-directory default-directory 10))
								(jp-buffer-filename))
							   'face face))
         (icon-size 0.8))
    `(" "
      ,(moody-tab (with-mode-icon major-mode filename icon-size nil icon-face) nil 'down)
      " ")))

(defun mwb-headline-flycheck ()
  (when doom-modeline--flycheck-text
    (if (jp-modeline-active-p)
        doom-modeline--flycheck-text
	  (propertize doom-modeline--flycheck-text 'face 'header-line-dimmed-face))))

(defvar mwb-modeline-format
  '((:eval
     (jp-modeline-format
      ;; Left
      '((:eval (jp-modeline-status))
        (:eval (jp-modeline-position))
        (:eval (jp-modeline-filename))
        (:eval (jp-modeline-major-mode-no-icon))
        (:eval (jp-modeline-vc)))
      ;; Right
      '((:eval (jp-modeline-flycheck))
        (:eval (jp-modeline-narrow))
        (:eval (jp-modeline-process))
        (:eval (jp-modeline-encoding)))))))

(defvar mwb-headline-format
  '((:eval
     (jp-modeline-format
      ;; Left
      '((:eval (jp-headline-mode-icon))
        (:eval (mwb-headline-filename))
        (:eval (jp-headline-status)))
      ;; Right
      '((:eval (jp-headline-flycheck))
        (:eval (jp-headline-position)))))))

(defvar mwb-mini-modeline-r-format
  '((:eval (jp-modeline-process))
    (:eval (jp-modeline-narrow))
    (:eval (jp-modeline-major-mode))
    (:eval (jp-modeline-vc))
    (:eval (jp-modeline-encoding))))

(defun mwb-modeline-activate ()
  "Set these formats as mode-line"
  (if jp-modeline-enabled-p
      (progn
        (setq-default mode-line-format mwb-modeline-format)
        (setq-default header-line-format nil))
    (progn
      (setq x-underline-at-descent-line t)
      (defvar mini-modeline-r-format)
      (setq mini-modeline-r-format mwb-mini-modeline-r-format)
      (setq-default mode-line-format '(""))
      (setq-default header-line-format mwb-headline-format))))

;; Mode line setup
;;;###autoload
(defun mwb-modeline-setup ()
  "Add header and modeline

Setup hooks for updating state
Fiddle header maps
Activate"
  ;; Setup flycheck hooks
  (add-hook 'flycheck-status-changed-functions #'jp-modeline--update-flycheck-segment)
  (add-hook 'flycheck-mode-hook #'jp-modeline--update-flycheck-segment)
  (define-key mode-line-major-mode-keymap [header-line]
    (lookup-key mode-line-major-mode-keymap [mode-line]))
  (jp-modeline-activate))

(provide 'mwb-modeline)
;;; mwb-modeline.el ends here
