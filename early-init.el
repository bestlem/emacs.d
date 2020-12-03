;; [[file:init.org::org_mark_2020-01-23T20-40-42+00-00_mini12_EC7FD451-253D-4F87-90DC-AD484305487F][org_mark_2020-01-23T20-40-42+00-00_mini12_EC7FD451-253D-4F87-90DC-AD484305487F]]
;;(defconst emacs-start-time (current-time))

(defvar file-name-handler-alist-old file-name-handler-alist)

(setq file-name-handler-alist nil
      message-log-max 16384
      gc-cons-threshold 402653184
      gc-cons-percentage 0.6
      auto-window-vscroll nil)
;; org_mark_2020-01-23T20-40-42+00-00_mini12_EC7FD451-253D-4F87-90DC-AD484305487F ends here

;; [[file:init.org::org_mark_2020-09-28T01-08-28+01-00_mini12.local_407877DD-DF72-4900-9475-7723E8D855A2][org_mark_2020-09-28T01-08-28+01-00_mini12.local_407877DD-DF72-4900-9475-7723E8D855A2]]
;;(setq package-enable-at-startup nil)
;; org_mark_2020-09-28T01-08-28+01-00_mini12.local_407877DD-DF72-4900-9475-7723E8D855A2 ends here

;; [[file:init.org::org_mark_2020-09-28T01-08-28+01-00_mini12.local_0E90CFE6-BBAC-4DA3-8461-12811764098F][org_mark_2020-09-28T01-08-28+01-00_mini12.local_0E90CFE6-BBAC-4DA3-8461-12811764098F]]
(setq package-user-dir
      (expand-file-name
       (format "elpa/%s/elpa"
               (concat emacs-version (when (getenv "MELPA_STABLE") "-stable"))) user-emacs-directory))
;; org_mark_2020-09-28T01-08-28+01-00_mini12.local_0E90CFE6-BBAC-4DA3-8461-12811764098F ends here

;; [[file:init.org::org_mark_2020-09-28T01-08-28+01-00_mini12.local_19B4CE88-E1D4-4E44-91B7-AD3D8E74C2D3][org_mark_2020-09-28T01-08-28+01-00_mini12.local_19B4CE88-E1D4-4E44-91B7-AD3D8E74C2D3]]
;;(menu-bar-mode -1)
(unless (and (display-graphic-p) (eq system-type 'darwin))
  (push '(menu-bar-lines . 0) default-frame-alist))
(push '(tool-bar-lines . 0) default-frame-alist)
;;(push '(vertical-scroll-bars) default-frame-alist)
(setq tool-bar-mode nil)
;; org_mark_2020-09-28T01-08-28+01-00_mini12.local_19B4CE88-E1D4-4E44-91B7-AD3D8E74C2D3 ends here

;; [[file:init.org::org_mark_2020-11-13T08-54-14+00-00_mini12.local_B13702B5-689F-4646-85F2-FD570054EAC4][org_mark_2020-11-13T08-54-14+00-00_mini12.local_B13702B5-689F-4646-85F2-FD570054EAC4]]
(defmacro add-hook-lambda (hook &rest body)
  (declare (indent 1) (debug t))
  `(add-hook ,hook (lambda () ,@body)))
;; org_mark_2020-11-13T08-54-14+00-00_mini12.local_B13702B5-689F-4646-85F2-FD570054EAC4 ends here
