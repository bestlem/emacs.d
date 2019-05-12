;; [[file:~/Library/Preferences/Emacs/mwb-init-org-mode.org::*Force%20load%20of%20new%20version][Force load of new version:1]]
(assq-delete-all 'org package--builtins)
;; Force load of new version:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-org-mode.org::*The%20use%20package%20setup][The use package setup:1]]
(use-package org
  :ensure t
  :hydra (hydra-org-mode
		  (:color teal)
		  ""
		  ("c" mwb-hydra-org-code/body "Code")
		  ("d" org-toggle-link-display "Show links")
		  ("l" org-insert-link "link")
		  ("g" org-set-tags-command "tags")
		  ("t" org-todo "todo")
		  ("q" nil "cancel"))
  :after hydra
  :bind (:map org-mode-map
			  ("H-a" . hydra-org-mode/body)
			  ("H-s" . org-edit-special)
			  :map org-src-mode-map
			  ("H-s" . org-edit-src-exit)
			  ("A-s" . org-edit-src-exit) ; I press by mistake but it makes sense
			  )
  :hook
      (org-mode . (lambda ()
      					(add-hook
      					 'after-save-hook
      					 'org-babel-tangle
      					 'run-at-end
      					 'only-in-org-mode)))
      (org-mode . visual-line-mode)
      (org-mode . variable-pitch-mode)
  )
;; The use package setup:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-org-mode.org::*Imenu%20to%20provide%20info%20for%20treemacs%20and%20contextual%20menu][Imenu to provide info for treemacs and contextual menu:1]]
(add-hook 'org-mode-hook
		  (lambda () (imenu-add-to-menubar "Imenu")))
(setq org-imenu-depth 6)
;; Imenu to provide info for treemacs and contextual menu:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-org-mode.org::*Babel%20initialisation][Babel initialisation:1]]
(setq org-src-fontify-natively t
	  org-src-tab-acts-natively t
	  org-confirm-babel-evaluate nil
	  org-edit-src-content-indentation 0)
;; Babel initialisation:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-org-mode.org::*Prettify][Prettify:1]]
(use-package org-bullets
  :ensure t
  :init (add-hook 'org-mode-hook 'org-bullets-mode))
;; Prettify:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-org-mode.org::*Circular%20bullets][Circular bullets:1]]
(font-lock-add-keywords
 'org-mode
 '(("^ +\\([-*]\\) "
	(0
	 (prog1
		 ()
	   (compose-region
		(match-beginning 1)
		(match-end 1)
		"•"))))))
;; Circular bullets:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-org-mode.org::*Indent%20other%20text][Indent other text:1]]
(use-package org-indent
  :ensure nil
  :diminish)
;; Indent other text:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-org-mode.org::*Hydras%20for%20tangling][Hydras for tangling:1]]
(defhydra mwb-hydra-org-code
  (:color teal)
  ""
  ("e" org-edit-special "Edit the code")
  ("i" hydra-org-template/body "Insert code") ; FIXME
  ("t" org-babel-tangle "Tangle buffer")
  ("q" nil "cancel"))
;; Hydras for tangling:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-org-mode.org::*Messed%20up%20code%20hydra][Messed up code hydra:1]]
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
;; Messed up code hydra:1 ends here
