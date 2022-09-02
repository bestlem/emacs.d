;;; init-elpaca.el --- ELPACA INIT DEMO   -*- lexical-binding: t; -*-
;; Bootstrap Elpaca
(declare-function elpaca-generate-autoloads "elpaca")
(defvar elpaca-directory (expand-file-name "elpaca/" mwb-emacs-work-dir))

(defvar elpaca-builds-directory (expand-file-name
								 (concat "build-" emacs-version "/elpaca")
								 elpaca-directory))

;; (unless (file-directory-p elpaca-mwb-build-dir)
;;   (make-directory elpaca-mwb-build-dir t))


(when-let ((elpaca-repo (expand-file-name "repos/elpaca/" elpaca-directory))
		   (elpaca-build elpaca-builds-directory)
		   ;; (elpaca-build (expand-file-name "builds/elpaca/" elpaca-directory))
           (elpaca-target (if (file-exists-p elpaca-build) elpaca-build elpaca-repo))
           (elpaca-url  "https://www.github.com/progfolio/elpaca.git")
           ((add-to-list 'load-path elpaca-target))
           ((not (file-exists-p elpaca-repo)))
           (buffer (get-buffer-create "*elpaca-bootstrap*")))
  (message "In bootstrap with target %s" elpaca-target)
  (condition-case-unless-debug err
      (progn
        (unless (zerop (call-process "git" nil buffer t "clone" elpaca-url elpaca-repo))
          (error "%s" (list (with-current-buffer buffer (buffer-string)))))
        (byte-recompile-directory elpaca-repo 0 'force)
        (require 'elpaca)
		(message "generating autoloads")
        (elpaca-generate-autoloads "elpaca" elpaca-repo)
        (kill-buffer buffer))
    ((error)
     (delete-directory elpaca-directory 'recursive)
	 (message "In error")
     (with-current-buffer buffer
       (goto-char (point-max))
       (insert (format "\n%S" err))
       (display-buffer buffer)))))
(require 'elpaca-autoloads)
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca (elpaca :host github :repo "progfolio/elpaca"))

;; Install use-package
(elpaca use-package (require 'use-package))
;; Install evil and configure via `use-package'
