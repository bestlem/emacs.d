;; -*- lexical-binding: t -*-
;; This is a generated file do not edit
;; [[file:~/.emacs.d/init.org::org_mark_2020-01-23T20-40-42+00-00_mini12_EC7FD451-253D-4F87-90DC-AD484305487F][org_mark_2020-01-23T20-40-42+00-00_mini12_EC7FD451-253D-4F87-90DC-AD484305487F]]
;;(defconst emacs-start-time (current-time))

(defvar file-name-handler-alist-old file-name-handler-alist)

(setq file-name-handler-alist nil
	  message-log-max 16384
	  gc-cons-threshold 402653184
	  gc-cons-percentage 0.6
	  auto-window-vscroll nil)
;; org_mark_2020-01-23T20-40-42+00-00_mini12_EC7FD451-253D-4F87-90DC-AD484305487F ends here

;; [[file:~/.emacs.d/init.org::org_mark_mini20.local_20220614T202654.939619][org_mark_mini20.local_20220614T202654.939619]]
(setq package-enable-at-startup nil)
;; org_mark_mini20.local_20220614T202654.939619 ends here

;; [[file:~/.emacs.d/init.org::org_mark_mini20.local_20210625T123956.553714][org_mark_mini20.local_20210625T123956.553714]]
(setq package-quickstart-file
	  (expand-file-name
	   (format "package-quickstart.%d.el" emacs-major-version)
	   user-emacs-directory))
;; org_mark_mini20.local_20210625T123956.553714 ends here

;; [[file:~/.emacs.d/init.org::org_mark_2020-09-28T01-08-28+01-00_mini12.local_19B4CE88-E1D4-4E44-91B7-AD3D8E74C2D3][org_mark_2020-09-28T01-08-28+01-00_mini12.local_19B4CE88-E1D4-4E44-91B7-AD3D8E74C2D3]]
;;(menu-bar-mode -1)
(unless (and (display-graphic-p) (eq system-type 'darwin))
  (push '(menu-bar-lines . 0) default-frame-alist))
(push '(tool-bar-lines . 0) default-frame-alist)
;;(push '(vertical-scroll-bars) default-frame-alist)
(setq tool-bar-mode nil)
(setq mode-line-format nil)
;; org_mark_2020-09-28T01-08-28+01-00_mini12.local_19B4CE88-E1D4-4E44-91B7-AD3D8E74C2D3 ends here

;; [[file:~/.emacs.d/init.org::org_mark_mini20.local_20220605T094912.452123][org_mark_mini20.local_20220605T094912.452123]]
(setq orig-frame-inhibit-implied-resize frame-inhibit-implied-resize)
(setq frame-inhibit-implied-resize t)
;; org_mark_mini20.local_20220605T094912.452123 ends here

;; [[file:~/.emacs.d/init.org::org_mark_mini20.local_20210811T183548.057306][org_mark_mini20.local_20210811T183548.057306]]
(setq load-prefer-newer t)
;; org_mark_mini20.local_20210811T183548.057306 ends here
