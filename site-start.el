; aquamacs setup
; Move that to Preferences

; This file is run before and should really be for OS independent stuff and is before customisation

;; emacs server
(server-start)


;; common bits
(load "setup-packages")


(load "common-setup")
(load "common-modes")
(load "common-keys")

