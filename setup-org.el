
;; For why not see https://www.reddit.com/r/emacs/comments/5sx7j0/how_do_i_get_usepackage_to_ignore_the_bundled/ddix2ta?utm_source=share&utm_medium=web2x
;; (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;;  Forcing load of new not in Aquamacs
;; https://github.com/jwiegley/use-package/issues/319#issuecomment-471274348
(assq-delete-all 'org package--builtins)

(use-package
  org
  :ensure t
  :hydra (hydra-org-mode
		  (:color teal)
		  ""
		  ("b" org-babel-tangle "Tangle buffer")
		  ("c" hydra-org-template/body "Insert code")
		  ("d" org-toggle-link-display "Show links")
		  ("l" org-insert-link "link")
		  ("g" org-set-tags-command "tags")
		  ("t" org-todo "todo")
		  ("q" nil "cancel"))
  :after hydra
  :bind (:map org-mode-map
			  ("H-a" . hydra-org-mode/body)))

;; start sidebar
(add-hook 'org-mode-hook
          (lambda () (imenu-add-to-menubar "Imenu")))

(setq org-imenu-depth 6)

;;  Try making code blocks colorized
;; (require 'color)
;; (set-face-attribute 'org-block nil :background
;;                     (color-darken-name
;;                      (face-attribute 'default :background) 3))

;; (setq org-src-block-faces '(("emacs-lisp" (:background "#EEE2FF"))
;;                             ("python" (:background "#E5FFB8"))))

(setq org-src-fontify-natively t
	  org-src-tab-acts-natively t
	  org-confirm-babel-evaluate nil
	  org-edit-src-content-indentation 0)

(use-package org-bullets
  :ensure t
  :init (add-hook 'org-mode-hook 'org-bullets-mode))


;;  From https://github.com/abo-abo/hydra/wiki/Org-mode-block-templates
(defhydra hydra-org-template (:color blue :hint nil)
  "
 _c_enter  _q_uote     _e_macs-lisp    _L_aTeX:
 _l_atex   _E_xample   _p_erl          _i_ndex:
 _a_scii   _v_erse     _P_erl tangled  _I_NCLUDE:
 _s_rc     _n_ote      plant_u_ml      _H_TML:
 _h_tml    ^ ^         ^ ^             _A_SCII:
"
  ("s" (hot-expand "<s"))
  ("E" (hot-expand "<e"))
  ("q" (hot-expand "<q"))
  ("v" (hot-expand "<v"))
  ("n" (hot-expand "<not"))
  ("c" (hot-expand "<c"))
  ("l" (hot-expand "<l"))
  ("h" (hot-expand "<h"))
  ("a" (hot-expand "<a"))
  ("L" (hot-expand "<L"))
  ("i" (hot-expand "<i"))
  ("e" (hot-expand "<s" "emacs-lisp"))
  ("p" (hot-expand "<s" "perl"))
  ("u" (hot-expand "<s" "plantuml :file CHANGE.png"))
  ("P" (hot-expand "<s" "perl" ":results output :exports both :shebang \"#!/usr/bin/env perl\"\n"))
  ("I" (hot-expand "<I"))
  ("H" (hot-expand "<H"))
  ("A" (hot-expand "<A"))
  ("<" self-insert-command "ins")
  ("o" nil "quit"))

(require 'org-tempo) ; Required from org 9 onwards for old template expansion
;; Reset the org-template expnsion system, this is need after upgrading to org 9 for some reason
(setq org-structure-template-alist (eval (car (get 'org-structure-template-alist 'standard-value))))
(defun hot-expand (str &optional mod header)
  "Expand org template.

STR is a structure template string recognised by org like <s. MOD is a
string with additional parameters to add the begin line of the
structure element. HEADER string includes more parameters that are
prepended to the element after the #+HEADER: tag."
  (let (text)
	(when (region-active-p)
	  (setq text
			(buffer-substring
			 (region-beginning)
			 (region-end)))
	  (delete-region
	   (region-beginning)
	   (region-end))
	  (deactivate-mark))
	(when header
	  (insert "#+HEADER: " header)
	  (forward-line))
	(insert str)
	(org-tempo-complete-tag)
	(when mod
	  (insert mod)
	  (forward-line))
	(when text (insert text))))

(define-key org-mode-map "<"
  (lambda () (interactive)
	(if (or (region-active-p) (looking-back "^"))
		(hydra-org-template/body)
	  (self-insert-command 1))))

(eval-after-load "org"
  '(cl-pushnew
    '("not" . "note")
	org-structure-template-alist))

;; From https://github.com/howardabrams/dot-files/blob/master/emacs-org.org
;;  ALso http://kitchingroup.cheme.cmu.edu/blog/2017/04/09/A-better-return-in-org-mode/
;; But messes up plain text entry
(defun ha/org-return (&optional ignore)
  "Add new list item, heading or table row with RET.
A double return on an empty element deletes it.
Use a prefix arg to get regular RET. "
  (interactive "P")
  (if ignore
      (org-return)
    (cond
     ;; Open links like usual
     ((eq 'link (car (org-element-context)))
      (org-return))
     ;; lists end with two blank lines, so we need to make sure we are also not
     ;; at the beginning of a line to avoid a loop where a new entry gets
     ;; created with only one blank line.
     ((and (org-in-item-p) (not (bolp)))
      (if (org-element-property :contents-begin (org-element-context))
          (org-insert-heading)
        (beginning-of-line)
        (setf (buffer-substring
               (line-beginning-position) (line-end-position)) "")
        (org-return)))
     ((org-at-heading-p)
      (if (not (string= "" (org-element-property :title (org-element-context))))
          (progn (org-end-of-meta-data)
                 (org-insert-heading))
        (beginning-of-line)
        (setf (buffer-substring
               (line-beginning-position) (line-end-position)) "")))
     ((org-at-table-p)
      (if (-any?
           (lambda (x) (not (string= "" x)))
           (nth
            (- (org-table-current-dline) 1)
            (org-table-to-lisp)))
          (org-return)
        ;; empty row
        (beginning-of-line)
        (setf (buffer-substring
               (line-beginning-position) (line-end-position)) "")
        (org-return)))
     (t
      (org-return)))))

;; (define-key org-mode-map (kbd "RET")  #'ha/org-return)
