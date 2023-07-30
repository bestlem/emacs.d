;; -*- lexical-binding:t;coding: utf-8 -*-
;; This is a generated file do not edit
;; [[file:init.org::org_mark_2020-09-28T01-08-28+01-00_mini12.local_E7D671F1-9D29-4FF6-A8E5-8884826E6E4B][org_mark_2020-09-28T01-08-28+01-00_mini12.local_E7D671F1-9D29-4FF6-A8E5-8884826E6E4B]]
(when (version< emacs-version "27")
  (load (expand-file-name "~/.emacs.d/early-init")))
;; org_mark_2020-09-28T01-08-28+01-00_mini12.local_E7D671F1-9D29-4FF6-A8E5-8884826E6E4B ends here

;; [[file:init.org::org_mark_mini20.local_20220606T145002.735412][org_mark_mini20.local_20220606T145002.735412]]
;;  setting to nil turns them off
(setq debug-on-error t)
;; (setq debug-on-error nil)
										;(setq debug-on-quit nil)
;; org_mark_mini20.local_20220606T145002.735412 ends here

;; [[file:init.org::org_mark_mini20.local_20220606T145002.738615][org_mark_mini20.local_20220606T145002.738615]]
(setq init-file-debug 'nil)
;; (setq init-file-debug t)
;; org_mark_mini20.local_20220606T145002.738615 ends here

;; [[file:init.org::org_mark_mini20.local_20220905T162607.803924][org_mark_mini20.local_20220905T162607.803924]]
(defvar modi/variables-to-be-watched ()
  "List of variables to be watched.
Used by `modi/set-variable-watchers' and
`modi/unset-variable-watchers'")

(defun modi/variable-watcher-fn (symbol newval operation where)
  "Print message when the value of variable SYMBOL changes.
The message shows the NEWVAL it changed to, the OPERATION that
caused that, and the buffer WHERE that happened if the value
change was buffer-local."
  (message (format "[Watcher: %s] Now set to %S, by `%S'%s"
                   (symbol-name symbol)
                   newval
                   operation
                   (if where
                       (format " in %S" where)
                     ""))))

(defun modi/set-variable-watchers ()
  "Enable printing messages when any watched variable changes.
The variables to be watched should be added to
`modi/variables-to-be-watched'."
  (interactive)
  (dolist (var modi/variables-to-be-watched)
    (add-variable-watcher var #'modi/variable-watcher-fn)))

(defun modi/unset-variable-watchers ()
  "Disable variable watchers.
Variable watching will be disabled for the list of variables set
in `modi/variables-to-be-watched'."
  (interactive)
  (dolist (var modi/variables-to-be-watched)
    (remove-variable-watcher var #'modi/variable-watcher-fn)))
;; org_mark_mini20.local_20220905T162607.803924 ends here

;; [[file:init.org::org_mark_mini20.local_20220313T215512.598628][org_mark_mini20.local_20220313T215512.598628]]
(defvar mwb-message-offset (float-time) "Time of last message")

(defun my-message-with-timestamp (old-func fmt-string &rest args)
  "Prepend current timestamp (with microsecond precision) to a message"
  (apply old-func
         (concat (format-time-string "[%F %T] ")
                 fmt-string)
         args))

(defun my-message-with-timediff (old-func fmt-string &rest args)
  "Prepend difference in time to a message"

  (let* ((now (float-time))
         (diff (- now mwb-message-offset)))
    (setq mwb-message-offset now)
    (apply old-func
           (if (> diff 0.1)
               (concat (format "[%g] " diff)
                       fmt-string)
             fmt-string)
           args)))

(advice-add 'message :around #'my-message-with-timediff)

(defun mwb-message-remove-timediff ()
  (interactive)
  (advice-remove 'message #'my-message-with-timediff)
  (message "remove timestamp"))

(defvar mwb-message-timestamp 'nil "true iff message should show timestamp")

(defun toggle-mwb-message-timestamp ()
  (interactive)
  (if mwb-message-timestamp
      (progn
        (advice-remove 'message #'my-message-with-timestamp)
        (setq mwb-message-timestamp 'nil)
        (message "remove timestamp"))
    (advice-add 'message :around #'my-message-with-timestamp)
	(setq mwb-message-timestamp t)
    (message "add timestamp")))

(add-hook 'after-init-hook 'mwb-message-remove-timediff)
;; org_mark_mini20.local_20220313T215512.598628 ends here

;; [[file:init.org::org_mark_2020-01-23T20-40-42+00-00_mini12_315EE687-FC28-4D41-810D-4FF19AA66CD4][org_mark_2020-01-23T20-40-42+00-00_mini12_315EE687-FC28-4D41-810D-4FF19AA66CD4]]
(defun nullman/org-babel-generate-elisp-file (file &optional byte-compile force)
  "Generate an emacs-lisp file from an org-babel FILE.

Additionally, byte compile the file if BYTE-COMPILE is
non-nil.

Process file even if timestamp is not newer than target if FORCE
is non-nil."
  (let* ((case-fold-search t)
         (file-base (expand-file-name (file-name-sans-extension file)))
         (file-org (concat file-base ".org"))
         (file-elisp (concat file-base ".el"))
         (file-comp (concat file-base ".elc"))
         (heading-regexp "^\*+ ")
         (heading-comment-regexp "^\*+ COMMENT ")
         (begin-regexp "^[ \t]*#\\+BEGIN_SRC emacs-lisp")
         (begin-tangle-regexp "^[ \t]*#\\+BEGIN_SRC .*:tangle ")
         (end-regexp "^[ \t]*#\\+END_SRC")
         (indent-regexp "^  "))
    ;; generate elisp file if needed
    (when (or force
              (not (file-exists-p file-elisp))
              (file-newer-than-file-p file-org file-elisp))
      (message "Nullman Writing %s..." file-elisp)
      (with-temp-file file-elisp
        (insert-file-contents file)
        (goto-char (point-min))
        (let (code
              headings-counts
              (level 1)
              (comment-level 0)
              (end-comment ""))
          (while (not (eobp))
            (cond
             ;; comment heading
             ((let ((case-fold-search nil))
                (looking-at heading-comment-regexp))
              (setq level (/ (- (match-end 0) (line-beginning-position) 8) 2))
              (when (or (zerop comment-level)
                        (< level comment-level))
                (setq comment-level level))
              (delete-region (line-beginning-position) (progn (forward-line) (point))))
             ;; normal heading
             ((looking-at heading-regexp)
              (setq level (/ (- (match-end 0) (line-beginning-position)) 2))
              (when (or (zerop comment-level)
                        (<= level comment-level))
                (setq comment-level 0)
                (if (assoc level headings-counts)
                    (setf (cdr (assoc level headings-counts))
                          (cons (buffer-substring-no-properties (match-end 0) (line-end-position)) 1))
                  (setq headings-counts (append headings-counts (list (cons level (cons "No heading" 1)))))))
              (delete-region (line-beginning-position) (progn (forward-line) (point))))
             ;; start of tangled source block
             ((and (looking-at begin-regexp)
                   (zerop comment-level)
                   (not (looking-at begin-tangle-regexp))) ; skip blocks with their own tangle directive
              (let* ((heading-count (cdr (assoc level headings-counts)))
                     (heading (car heading-count))
                     (count (cdr heading-count)))
                (delete-region (line-beginning-position) (progn (forward-line) (point)))
                (unless (bobp)
                  (newline))
                ;; (when (fboundp 'org-link-escape)
                ;;   (insert (format ";; [[file:%s::*%s][%s:%s]]\n" file-org (org-link-escape heading) heading count))
                ;;   (setq end-comment (format ";; %s:%s ends here\n" heading count))
                ;;   (cl-incf (cddr (assoc level headings-counts))))
                (setq code t)))
             ;; end of tangled source block
             ((and code
                   (looking-at end-regexp))
              (delete-region (line-beginning-position) (progn (forward-line) (point)))
              (insert end-comment)
              (setq code nil
                    end-comment ""))
             ;; inside tangled source block
             (code
              (when (looking-at indent-regexp)
                (delete-char (if (boundp 'org-edit-src-content-indentation)
                                 org-edit-src-content-indentation
                               2)))
              (forward-line))
             ;; outside tangled source block
             (t
              (delete-region (line-beginning-position) (progn (forward-line) (point))))))
          (time-stamp))
        (message "Nullman Wrote %s..." file-elisp)))

    ))
;; org_mark_2020-01-23T20-40-42+00-00_mini12_315EE687-FC28-4D41-810D-4FF19AA66CD4 ends here

;; [[file:init.org::org_mark_mini20.local_20210126T224850.526804][org_mark_mini20.local_20210126T224850.526804]]
(setq mwb-esup-depth 1)                 ; Some attempt at benchmarking

(defun mwb-init--load (file-root-abs &optional no-org)
  "Load the relevant code.
<file-root> is an absolute file root
Look for <file-root>.org and <file-root>.el files.
If org and no el or org file is newer then retangle the org file if noorg is not nil then use nullmans expand then load <file-root>.el "
  (let* ((org-file
          (concat file-root-abs ".org"))
         (el-file
          (concat file-root-abs ".el")))
    (setq esup-depth mwb-esup-depth)
    ;; (setq esup-child-max-depth mwb-esup-depth )
    (setq esup-child-current-depth 0)
    (when (file-newer-than-file-p org-file el-file)
	  ;; (let ((org-att (file-attributes org-file) )
	  ;; 		(el-time (file-attribute-access-time el-file))
	  ;; 		(org-time (file-attribute-access-time org-att)))
	  ;; 	(message "Generating .el from org for <%s> times %s %s"
	  ;; 			 file-root-abs
	  ;; 			 org-time
	  ;; 			 el-time
	  ;; 			 ))
      (cond (no-org
             (message "tangle <%s> to <%s> using regex replacement not org mode"
                      org-file el-file)
             (nullman/org-babel-generate-elisp-file org-file el-file))
            (t
             (require 'org)
             (message "This loaded an org mode but from the system - best to restart")
             (message "tangle <%s> to <%s> using org version %s"
                      org-file el-file org-version)
             (org-babel-tangle-file org-file el-file))))

    (condition-case err
        (load el-file)
      (error (let ((msg (format-message "Error loading %s: \"%s\""
                                        el-file
                                        (error-message-string err))))
               (warn msg)
               (message msg))))))
;; org_mark_mini20.local_20210126T224850.526804 ends here

;; [[file:init.org::org_mark_mini20.local_20210126T224850.527570][org_mark_mini20.local_20210126T224850.527570]]
(defun mwb-init-load (file-root &optional no-org)
  (mwb-init--load (expand-file-name file-root mwb-user-emacs-directory) no-org))
;; org_mark_mini20.local_20210126T224850.527570 ends here

;; [[file:init.org::org_mark_mini20.local_20210126T224850.527835][org_mark_mini20.local_20210126T224850.527835]]
(defun mwb-init-load-directory (rel-dir-name)
  "Load up all the files using the init loaded from a directory"
  (let* ((directory-name (expand-file-name rel-dir-name mwb-user-emacs-directory))
         (files (directory-files
                 directory-name
                 nil
                 (rx-to-string '(seq any ".org" eol)))))

    (dolist (f files)
      (mwb-init--load (expand-file-name (file-name-sans-extension f) directory-name)))))
;; org_mark_mini20.local_20210126T224850.527835 ends here

;; [[file:init.org::org_mark_mini12.local_20201213T195905.304356][org_mark_mini12.local_20201213T195905.304356]]
(when (>= emacs-major-version 27)
  ;; (load (concat (expand-file-name "alt/alt_init" mwb-user-emacs-directory) ".el"))
  ;;(load (concat (expand-file-name "alt/straight" mwb-user-emacs-directory) ".el"))
  (mwb-init-load "config" "no-org"))
;; org_mark_mini12.local_20201213T195905.304356 ends here
