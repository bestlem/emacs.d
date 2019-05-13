
;; [[file:~/Library/Preferences/Emacs/config.org::*After%20initialisation][After\ initialisation:1]]

(add-hook 'after-init-hook
                      `(lambda ()
                         (setq file-name-handler-alist file-name-handler-alist-old
                                       gc-cons-threshold 800000
                                       gc-cons-percentage 0.1)
                         (garbage-collect)
                         (message "Emacs init-time %s" (emacs-init-time))) t)

;; After\ initialisation:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Debugging][Debugging:1]]

(add-hook 'after-init-hook
                                (lambda () (setq debug-on-error t)))
; (setq debug-on-error t)

;; Debugging:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Use%20source%20where%20newer][Use\ source\ where\ newer:1]]

(setq load-prefer-newer t)

;; Use\ source\ where\ newer:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Customisation%20file][Customisation\ file:1]]

(setq custom-file ( mwb-user-emacs-file "custom/custom.el"))
(load custom-file 'noerror)

;; Customisation\ file:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*SSL%20network%20connection][SSL\ \ network\ connection:1]]

(require 'tls)

(with-eval-after-load 'tls
  ;; Add the gnutls CA certificate file
  (push "/private/etc/ssl/cert.pem"                gnutls-trustfiles)
  ;; Add the curl CA certificate file from Macports
  (push "/opt/local/share/curl/curl-ca-bundle.crt" gnutls-trustfiles)
  )

;; Validate TLS certificates
(setq gnutls-verify-error           t)

;; Increase prime bits on TLS keys
(setq gnutls-min-prime-bits      2048)

;; Network Security Module settings
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Network-Security.html
(setq network-security-level  'medium)
(setq nsm-save-host-names           t)

;; Set tls-checktrust to `'ask` instead of `t` to allow user to determine
;; whether or not to trust a certificate.
(setq tls-checktrust             'ask)

;; Update the tls-program invocation command line string
;;
;; Add `--priority` flag to  prevents the 3des certificate from being used.
;; Add `:%%PROFILE_MEDIUM` to ban intermediate SHA1 certificates.
;; Add `--ocsp` flag to require certificate revocation check
;;
;; Add `--insecure` flag as a temporary workaround for the expired certificate
;; on marmalade.org from hanging Aquamacs.
(setq tls-program
          '("gnutls-cli -p %p --dh-bits=2048 --ocsp --x509cafile=%t --insecure \
--priority='SECURE192:+SECURE128:-VERS-ALL:+VERS-TLS1.2:%%PROFILE_MEDIUM' %h"))

;; SSL\ \ network\ connection:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Package%20Manager][Package\ Manager:1]]

(require 'package)
(setq package-enable-at-startup nil)
;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))'
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

;; Package\ Manager:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*use-package][use-package:1]]

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))

;; use-package:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Diminish][Diminish:1]]

(use-package diminish   :ensure t   :demand t)

;; Diminish:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Hydra][Hydra:1]]

(use-package hydra :ensure t)
(use-package use-package-hydra :ensure t)

;; Hydra:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Setting%20variables%20with%20a%20check%20on%20type][Setting\ variables\ with\ a\ check\ on\ type:1]]

(use-package validate
  :ensure t)

;; Setting\ variables\ with\ a\ check\ on\ type:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Emacs%20server][Emacs\ server:1]]

(use-package server
  :ensure nil
  :hook (after-init . server-mode))

;; Emacs\ server:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Apperance][Apperance:1]]

(mwb-init-load  "mwb-init-appearance")

;; Apperance:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Emacs%20behaviour][Emacs\ behaviour:1]]

(mwb-init-load  "mwb-init-emacs-behaviour") ; odds mainly variables

;; Emacs\ behaviour:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Registers][Registers:1]]

(defhydra sk/hydra-registers (:color blue
                                                                         :hint nil)
  "
 _a_: append     _c_: copy-to    _j_: jump       _r_: rectangle-copy   _q_: quit
 _i_: insert     _n_: number-to  _f_: frameset   _w_: window-config
 _+_: increment  _p_: point-to
  "
  ("a" append-to-register)
  ("c" copy-to-register)
  ("i" insert-register)
  ("f" frameset-to-register)
  ("j" jump-to-register)
  ("n" number-to-register)
  ("r" copy-rectangle-to-register)
  ("w" window-configuration-to-register)
  ("+" increment-register)
  ("p" point-to-register)
  ("q" nil :color blue))

(bind-key "M-r" 'sk/hydra-registers/body)

;; Registers:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Sessions][Sessions:1]]

(use-package savehist
  :config
  (setq savehist-additional-variables
                '(kill-ring
                  search-ring
                  regexp-search-ring
                  last-kbd-macro
                  kmacro-ring
                  shell-command-history
                  Info-history-list
                  register-alist))
  (savehist-mode 1))

;; Sessions:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Gnus][Gnus:1]]

(mwb-init-load "mwb-init-gnus")

;; Gnus:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*System%20management][System\ management:1]]

(mwb-init-load "mwb-init-file-management")

;; System\ management:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Org%20Mode][Org\ Mode:1]]

(mwb-init-load "mwb-init-org-mode")

;; Org\ Mode:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Epub%20reading][Epub\ reading:1]]

;; Epub reader
(use-package nov
      :ensure t
      :mode ("\\.epub\\'" . nov-mode)
      :preface
      (defun my-nov-setup ()
        (visual-line-mode 1)
        (face-remap-add-relative 'variable-pitch :family "Times New Roman" :height 1.5)
        :hook (nov-mode . my-nov-setup)))

;; Epub\ reading:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Programming%20modes][Programming\ modes:1]]

(mwb-init-load "mwb-init-prog-modes")

;; Programming\ modes:1 ends here

;; [[file:~/Library/Preferences/Emacs/config.org::*Key%20binding][Key\ binding:1]]

(mwb-init-load "mwb-init-global-keys")

;; Key\ binding:1 ends here
