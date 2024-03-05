;; -*- lexical-binding:t;coding: utf-8 -*-
;; This is a generated file do not edit
;; [[file:init.org::org_mark_2020-01-23T20-40-42+00-00_mini12_EC7FD451-253D-4F87-90DC-AD484305487F][org_mark_2020-01-23T20-40-42+00-00_mini12_EC7FD451-253D-4F87-90DC-AD484305487F]]
;;(defconst emacs-start-time (current-time))

(defvar file-name-handler-alist-old file-name-handler-alist)

(setq file-name-handler-alist nil
	message-log-max 16384
	gc-cons-threshold 402653184
	gc-cons-percentage 0.6
	auto-window-vscroll nil)
;; org_mark_2020-01-23T20-40-42+00-00_mini12_EC7FD451-253D-4F87-90DC-AD484305487F ends here

;; [[file:init.org::org_mark_mini20.local_20220521T104243.397754][org_mark_mini20.local_20220521T104243.397754]]
;; Need the directory from here.
(defconst mwb-user-emacs-directory
  (file-name-directory (or load-file-name buffer-file-name)))
;; org_mark_mini20.local_20220521T104243.397754 ends here

;; [[file:init.org::org_mark_mini20.local_20220616T101718.145323][org_mark_mini20.local_20220616T101718.145323]]
(defvar mwb-emacs-work-dir (expand-file-name "~/.local/emacs" )
  "Directory on local machine wwhere emacs outside start directory.")
;; org_mark_mini20.local_20220616T101718.145323 ends here

;; [[file:init.org::org_mark_mini20.local_20220904T092511.225344][org_mark_mini20.local_20220904T092511.225344]]
(defvar mwb-dropbox-root
  (expand-file-name  "~/Library/CloudStorage/Dropbox")
  "Where dropbox is")
(defvar mwb-icloud-root
  (expand-file-name  "~/Library/Mobile Documents/com~apple~CloudDocs")
  "Where icloud is")
(defvar mwb-emacs-share-dir
  (concat mwb-dropbox-root "/data/emacs")
  "Directory on local machine wwhere emacs outside start directory.")
;; org_mark_mini20.local_20220904T092511.225344 ends here

;; [[file:init.org::org_mark_mini20.local_20220616T101718.152005][org_mark_mini20.local_20220616T101718.152005]]
(defvar mwb-emacs-eln-cache-dir
  (expand-file-name "eln-cache" mwb-emacs-work-dir))
(make-directory mwb-emacs-eln-cache-dir t)

(when (>= emacs-major-version 28)
  (if (fboundp 'startup-redirect-eln-cache)
	  (startup-redirect-eln-cache mwb-emacs-eln-cache-dir)
	  (add-to-list 'native-comp-eln-load-path mwb-emacs-eln-cache-dir)))
;; org_mark_mini20.local_20220616T101718.152005 ends here

;; [[file:init.org::org_mark_mini20.local_20220701T091932.459484][org_mark_mini20.local_20220701T091932.459484]]
(setq native-comp-async-report-warnings-errors 'silent)
;; org_mark_mini20.local_20220701T091932.459484 ends here

;; [[file:init.org::org_mark_2020-01-23T20-40-42+00-00_mini12_86BD52C1-8055-4BB2-834D-2F088719C835][org_mark_2020-01-23T20-40-42+00-00_mini12_86BD52C1-8055-4BB2-834D-2F088719C835]]
(defun mwb-user-emacs-file (name)
	"Return an absolute per-user Emacs-specific file name around where the init file is.
  It is basically locate-user-emacs-file but I have followed Aquamacs is setting that not where my init.el file is.
  Main reason to use is so that I can put init under version control and the rest go elsewhere."
	(expand-file-name name mwb-user-emacs-directory))
;; org_mark_2020-01-23T20-40-42+00-00_mini12_86BD52C1-8055-4BB2-834D-2F088719C835 ends here

;; [[file:init.org::org_mark_mini20.local_20220614T202654.939619][org_mark_mini20.local_20220614T202654.939619]]
(setq package-enable-at-startup nil)
;; org_mark_mini20.local_20220614T202654.939619 ends here

;; [[file:init.org::org_mark_2020-09-28T01-08-28+01-00_mini12.local_19B4CE88-E1D4-4E44-91B7-AD3D8E74C2D3][org_mark_2020-09-28T01-08-28+01-00_mini12.local_19B4CE88-E1D4-4E44-91B7-AD3D8E74C2D3]]
;;(menu-bar-mode -1)
(unless (and (display-graphic-p) (eq system-type 'darwin))
  (push '(menu-bar-lines . 0) default-frame-alist))
(push '(tool-bar-lines . 0) default-frame-alist)
;;(push '(vertical-scroll-bars) default-frame-alist)
(setq tool-bar-mode nil)
(setq mode-line-format nil)
;; org_mark_2020-09-28T01-08-28+01-00_mini12.local_19B4CE88-E1D4-4E44-91B7-AD3D8E74C2D3 ends here

;; [[file:init.org::org_mark_mini20.local_20220605T094912.452123][org_mark_mini20.local_20220605T094912.452123]]
(setq orig-frame-inhibit-implied-resize frame-inhibit-implied-resize)
(setq frame-inhibit-implied-resize t)
;; org_mark_mini20.local_20220605T094912.452123 ends here

;; [[file:init.org::org_mark_mini20.local_20210811T183548.057306][org_mark_mini20.local_20210811T183548.057306]]
(setq load-prefer-newer t)
;; org_mark_mini20.local_20210811T183548.057306 ends here

;; [[file:init.org::org_mark_mini20_20240227T114518.751441][org_mark_mini20_20240227T114518.751441]]
(setq use-package-enable-imenu-support t)
;; org_mark_mini20_20240227T114518.751441 ends here
