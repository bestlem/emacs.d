;; [[file:config.org::org_mark_mini20.local_20220625T102847.585074][org_mark_mini20.local_20220625T102847.585074]]
(setq straight-repository-user "bestlem")
(setq straight-repository-branch "work")
;; org_mark_mini20.local_20220625T102847.585074 ends here

;; [[file:config.org::org_mark_mini20.local_20220616T104529.439075][org_mark_mini20.local_20220616T104529.439075]]
(defvar mwb-straight-profile
  (expand-file-name "alt-straight-freeze.el" mwb-user-emacs-directory)
  "File for containging versions of packages from straight")

(defvar straight-base-dir)
(defvar straight-profiles)
(setq straight-base-dir (expand-file-name "alt-straight" mwb-emacs-work-dir))
(setq straight-profiles `((nil . ,mwb-straight-profile)))
(setq straight-use-version-specific-build-dir t)
(setq straight-vc-git-default-protocol 'ssh)
;; org_mark_mini20.local_20220616T104529.439075 ends here

;; [[file:config.org::org_mark_mini20.local_20220614T204548.040188][org_mark_mini20.local_20220614T204548.040188]]
;; Bootstrap the package manager, straight.el.
(message "Bootstrapping straight...")
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(message "Bootstrapping straight...done")
;; org_mark_mini20.local_20220614T204548.040188 ends here

;; [[file:config.org::org_mark_mini20.local_20220615T202800.301892][org_mark_mini20.local_20220615T202800.301892]]
(straight-use-package 'el-patch)
;; org_mark_mini20.local_20220615T202800.301892 ends here

;; [[file:config.org::org_mark_2020-02-06T12-27-27+00-00_mini12_77FB1165-1A41-4244-818F-7BFAF0F191FB][org_mark_2020-02-06T12-27-27+00-00_mini12_77FB1165-1A41-4244-818F-7BFAF0F191FB]]
;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))
(straight-use-package 'use-package)

;; Enable use-package
(eval-when-compile
  (setq use-package-enable-imenu-support t)
  (require 'use-package)
  (setq bind-key-describe-special-forms t)
  ;; (setq use-package-always-defer t)
  (setq straight-use-package-by-default t)
  (setq byte-compile-current-buffer t)

  (setq use-package-verbose t
        use-package-expand-minimally nil
        use-package-compute-statistics t)
  )
;; org_mark_2020-02-06T12-27-27+00-00_mini12_77FB1165-1A41-4244-818F-7BFAF0F191FB ends here

;; (straight-use-package 'org-bullets)

(use-package org
  :demand
  )

(use-package org-bullets :demand)
(use-package toc-org :demand)
