;; [[file:init.org::*Set where the init file is][Set where the init file is:1]]
;; Need the directory from here.
(defun mwb-get-directory-of-current-file ()
  "Return the full directory path of the caller's file location."
  (file-name-directory (or load-file-name buffer-file-name))
  )
(defconst mwb-user-emacs-directory (mwb-get-directory-of-current-file))
;; Set where the init file is:1 ends here

;; [[file:init.org::org_mark_2020-01-23T20-40-42+00-00_mini12_86BD52C1-8055-4BB2-834D-2F088719C835][org_mark_2020-01-23T20-40-42+00-00_mini12_86BD52C1-8055-4BB2-834D-2F088719C835]]
(defun mwb-user-emacs-file (name)
  "Return an absolute per-user Emacs-specific file name around where the init file is.
  It is basically locate-user-emacs-file but I have followed Aquamacs is setting that not where my init.el file is.
  Main reason to use is so that I can put init under version control and the rest go elsewhere."
  (expand-file-name name mwb-user-emacs-directory))
;; org_mark_2020-01-23T20-40-42+00-00_mini12_86BD52C1-8055-4BB2-834D-2F088719C835 ends here

;; [[file:init.org::org_mark_2020-09-28T01-08-28+01-00_mini12.local_E7D671F1-9D29-4FF6-A8E5-8884826E6E4B][org_mark_2020-09-28T01-08-28+01-00_mini12.local_E7D671F1-9D29-4FF6-A8E5-8884826E6E4B]]
(when (version< emacs-version "27")
  (load (mwb-user-emacs-file "early-init")))
;; org_mark_2020-09-28T01-08-28+01-00_mini12.local_E7D671F1-9D29-4FF6-A8E5-8884826E6E4B ends here

;; [[file:init.org::org_mark_2020-01-23T20-40-42+00-00_mini12_B623E658-A6AA-46DF-AD9C-6EAC3BDC1BEE][org_mark_2020-01-23T20-40-42+00-00_mini12_B623E658-A6AA-46DF-AD9C-6EAC3BDC1BEE]]
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
                                        ;(package-initialize)
;; org_mark_2020-01-23T20-40-42+00-00_mini12_B623E658-A6AA-46DF-AD9C-6EAC3BDC1BEE ends here

;; [[file:init.org::*Debug flag][Debug flag:1]]
(setq init-file-debug 'nil)
;; (require 'profiler)
;; (profiler-start 'cpu+mem)
;; (add-hook-lambda after-init-hook (profiler-stop))
;; Debug flag:1 ends here

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
                 (when (fboundp 'org-link-escape)
                   (insert (format ";; [[file:%s::*%s][%s:%s]]\n" file-org (org-link-escape heading) heading count))
                   (setq end-comment (format ";; %s:%s ends here\n" heading count))
                   (cl-incf (cddr (assoc level headings-counts))))
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

;; [[file:init.org::org_mark_2020-01-23T20-40-42+00-00_mini12_A039068A-5F9B-4C02-A1C9-156C79F14A5B][org_mark_2020-01-23T20-40-42+00-00_mini12_A039068A-5F9B-4C02-A1C9-156C79F14A5B]]
(setq mwb-esup-depth 1)

(defun mwb-init-load (file-root &optional no-org)
  "Load the relevant code.
        Look for <file-root>.org and <file-root>.el files.
        If org and no el or org file is newer
        then retangle the org file if noorg is not nil then use nullmans expand
        then load <file-root>.el "
  (let* ((org-file
          (concat (expand-file-name file-root mwb-user-emacs-directory) ".org"))
         (el-file
          (concat (expand-file-name file-root mwb-user-emacs-directory) ".el")))
    (setq esup-depth mwb-esup-depth )
    ;; (setq esup-child-max-depth mwb-esup-depth )
    (setq esup-child-current-depth 0)
    (when (file-newer-than-file-p org-file el-file)
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
                                        file-root
                                        (error-message-string err))))
               (warn msg)
               (message msg))))))
;; org_mark_2020-01-23T20-40-42+00-00_mini12_A039068A-5F9B-4C02-A1C9-156C79F14A5B ends here

;; [[file:init.org::org_mark_mini12.local_20201213T195905.304356][org_mark_mini12.local_20201213T195905.304356]]
(mwb-init-load "config" "no-org")
;; (load (concat (expand-file-name "alt/alt_init" mwb-user-emacs-directory) ".el"))
;; org_mark_mini12.local_20201213T195905.304356 ends here
