;; This is a mix of elpa packages and use-package <https://github.com/jwiegley/use-package>

;; from https://github.com/paolodedios/dot-files/blob/1a7b4500c8ce07d0d473dbf714a2303f4d440ef5/.emacs.d/init.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; From https://github.com/paolodedios/dot-files/blob/1a7b4500c8ce07d0d473dbf714a2303f4d440ef5/.emacs.d/init.el
;; Configure GnuTLS
;;
;; GnuTLS requires additional configuration on Emacs 25+ on macOS to prevent it
;; from crashing when loading package repositories.
;;
;; @see https://github.com/davidswelt/aquamacs-emacs/issues/133
;; @see https://github.com/davidswelt/aquamacs-emacs/issues/149
;; @see https://www.reddit.com/r/emacs/comments/8sykl1/emacs_tls_defaults_are_downright_dangerous/
;; @see https://www.gnu.org/software/emacs/manual/html_node/emacs-gnutls/Help-For-Users.html
;;
;; @note starttls.el and tls.el have been moved to obsolete in the master branch
;; (what will be Emacs 27).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'tls)

(with-eval-after-load 'tls
  ;; Add the gnutls CA certificate file
  (push "/private/etc/ssl/cert.pem"                gnutls-trustfiles)
  ;; Add the curl CA certificate file
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initialize packages immediately and not after init.el is read post startup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; include use-package setup from <https://github.com/CachesToCaches/getting_started_with_use_package/blob/master/init-use-package.el>

;; Update package-archive lists
(require 'package)
(setq package-enable-at-startup nil)
;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))'
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))
;;(require 'diminish)                ;; if you use :diminish
(require 'bind-key)            

;;(setq package-enable-at-startup  nil)
;;(package-initialize)

;; '(package-archive-upload-base "/Users/mark/.cache/emacs-package")
;;  '(package-archives
;;    (quote
;; 	(("gnu" . "http://elpa.gnu.org/packages/")
;; 	 ("melpa-stable" . "http://melpa.org/packages/")
;; 	 ("marmalade" . "http://marmalade-repo.org/packages/"))))
;;  '(package-selected-packages
;;    (quote
;; 	(highlight-indent-guides json-mode smart-tabs-mode smart-tab ## python-mode ensime fish-mode)))
