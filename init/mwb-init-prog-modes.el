;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::#+begin_src%20emacs-lisp%20(use-package%20highlight-indent-guides%20:ensure%20t%20:diminish%20highlight-indent-guides-mode%20:config%20(setq%20highlight-indent-guides-method%20'fill)%20;;%20Indent%20character%20samples:%20%E2%94%83|%20%E2%94%86%20%E2%94%8A%20(setq%20highlight-indent-guides-character%20?\%E2%94%83)%20(setq%20highlight-indent-guides-auto-odd-face-perc%2050)%20(setq%20highlight-indent-guides-auto-even-face-perc%2020)%20(setq%20highlight-indent-guides-auto-character-face-perc%2020)%20:hook%20(prog-mode%20.%20highlight-indent-guides-mode))%20#+end_src%20***%20Aggressive%20indent%20Indent%20as%20you%20type.%20Only%20for%20emacs%20lisp%20at%20the%20moment%20#+begin_src%20emacs-lisp%20;;%20Aggressive%20indent%20make%20indents%20as%20you%20type%20(use-package%20aggressive-indent%20:ensure%20t%20:hook%20(emacs-lisp-mode%20.%20aggressive-indent-mode))%20#+end_src%20***%20Clean%20up%20whitespace%20Only%20do%20it%20on%20my%20edits%20****%20Whitespace%20at%20end%20of%20line%20#+begin_src%20emacs-lisp%20(use-package%20ws-butler%20:ensure%20t%20:diminish%20ws-butler-mode%20:hook%20((prog-mode%20org-mode)%20.%20ws-butler-mode%20))%20#+end_src%20****%20TODO%20Need%20to%20look%20at%20this%20more%20**%20Build%20systems%20As%20Emacs%20is%20bad%20for%20java%20my%20java%20setup%20is%20now%20just%20gradle%20so%20that%20should%20be%20a%20generic%20build%20when%20I%20rename.%20#+begin_src%20emacs-lisp%20;;%20gradle%20and%20other%20java%20;;%20from%20http://www.coli.uni-saarland.de/~slemaguer/emacs/main.html#orgac34543%20(use-package%20groovy-mode%20:ensure%20t%20:mode%20("\.groovy$"%20"\.gradle$")%20:interpreter%20("gradle"%20"groovy")%20:config%20(autoload%20'run-groovy%20"inf-groovy"%20"Run%20an%20inferior%20Groovy%20process")%20(autoload%20'inf-groovy-keys%20"inf-groovy"%20"Set%20local%20key%20defs%20for%20inf-groovy%20in%20groovy-mode")%20;;%20Some%20keys%20for%20(add-hook%20'groovy-mode-hook%20'(lambda%20()%20(inf-groovy-keys))))%20;;%20Subpackages%20(use-package%20groovy-imports%20:ensure%20t)%20;;%20;;%20This%20does%20work%20with%20Aquamacs%20;;%20(add-to-list%20'auto-mode-alist%20(cons%20"\\.gradle\\'"%20'groovy-mode))%20;;%20(add-to-list%20'auto-mode-alist%20(cons%20"\\.groovy\\'"%20'groovy-mode))%20;;%20;;%20This%20_might_%20not%20work%20with%20Aquamacs%20(not%20sure%20what%20value%20it%20offers)%20;;%20;(add-to-list%20'interpreter-mode-alist%20'("groovy"%20.%20groovy-mode))%20;;%20;(add-to-list%20'interpreter-mode-alist%20'("gradle"%20.%20groovy-mode))%20;;%20;;;%20make%20Groovy%20mode%20electric%20by%20default.%20;;%20(add-hook%20'groovy-mode-hook%20;;%20'(lambda%20()%20;;%20(require%20'groovy-electric)%20;;%20(groovy-electric-mode)))%20;;%20(require%20'gradle)%20(use-package%20gradle-mode%20:ensure%20t%20:diminish%20:config%20(setq%20gradle-gradlew-executable%20"./gradlew"%20gradle-use-gradlew%20t)%20(gradle-mode))%20#+end_src%20****%20TODO%20Flymake%20Need%20to%20start%20from%20scratch.%20I%20do%20have%20it%20for%20emacs%20but%20as%20code%20in%20org%20mode%20not%20an%20elisp%20file%20a%20bit%20of%20a%20waste%20#+begin_src%20emacs-lisp%20;;;;%20flymake%20-%20syntax%20checking%20(use-package%20flymake%20:disabled%20:diminish%20:hook%20((sh-mode%20json-mode%20nxml-mode%20python-mode%20emacs-lisp-mode%20lisp-interaction-mode)%20.%20flymake-mode-on)%20:config%20(flymake-mode-on))%20#+end_src%20**%20Git%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-prog-modes-git")%20#+end_src%20**%20Completion%20I%20need%20something%20and%20company%20seems%20to%20be%20the%20current%20one%20#+begin_src%20emacs-lisp%20;;%20Start%20completion%20(use-package%20company%20:ensure%20t%20:config%20(add-hook%20'after-init-hook%20'global-company-mode))%20#+end_src%20*%20Specific%20groups%20Where%20there%20is%20common%20put%20them%20together.%20This%20part%20is%20really%20why%20I%20have%20separate%20files%20so%20I%20can%20deal%20with%20one%20thing%20at%20a%20time%20**%20Lisp%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-lisp")%20#+end_src%20**%20Python%20Really%20need%20to%20start%20from%20scratch%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-prog-modes-python")][Highlight indents:1]]
(use-package highlight-indent-guides
  :ensure t
  :diminish highlight-indent-guides-mode
  :config
  (setq highlight-indent-guides-method 'fill)
  ;; Indent character samples: ┃| ┆ ┊
  (setq highlight-indent-guides-character ?\┃)
  (setq highlight-indent-guides-auto-odd-face-perc 50)
  (setq highlight-indent-guides-auto-even-face-perc 20)
  (setq highlight-indent-guides-auto-character-face-perc 20)
  :hook (prog-mode . highlight-indent-guides-mode))
;; Highlight indents:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::#+begin_src%20emacs-lisp%20;;%20Aggressive%20indent%20make%20indents%20as%20you%20type%20(use-package%20aggressive-indent%20:ensure%20t%20:hook%20(emacs-lisp-mode%20.%20aggressive-indent-mode))%20#+end_src%20***%20Clean%20up%20whitespace%20Only%20do%20it%20on%20my%20edits%20****%20Whitespace%20at%20end%20of%20line%20#+begin_src%20emacs-lisp%20(use-package%20ws-butler%20:ensure%20t%20:diminish%20ws-butler-mode%20:hook%20((prog-mode%20org-mode)%20.%20ws-butler-mode%20))%20#+end_src%20****%20TODO%20Need%20to%20look%20at%20this%20more%20**%20Build%20systems%20As%20Emacs%20is%20bad%20for%20java%20my%20java%20setup%20is%20now%20just%20gradle%20so%20that%20should%20be%20a%20generic%20build%20when%20I%20rename.%20#+begin_src%20emacs-lisp%20;;%20gradle%20and%20other%20java%20;;%20from%20http://www.coli.uni-saarland.de/~slemaguer/emacs/main.html#orgac34543%20(use-package%20groovy-mode%20:ensure%20t%20:mode%20("\.groovy$"%20"\.gradle$")%20:interpreter%20("gradle"%20"groovy")%20:config%20(autoload%20'run-groovy%20"inf-groovy"%20"Run%20an%20inferior%20Groovy%20process")%20(autoload%20'inf-groovy-keys%20"inf-groovy"%20"Set%20local%20key%20defs%20for%20inf-groovy%20in%20groovy-mode")%20;;%20Some%20keys%20for%20(add-hook%20'groovy-mode-hook%20'(lambda%20()%20(inf-groovy-keys))))%20;;%20Subpackages%20(use-package%20groovy-imports%20:ensure%20t)%20;;%20;;%20This%20does%20work%20with%20Aquamacs%20;;%20(add-to-list%20'auto-mode-alist%20(cons%20"\\.gradle\\'"%20'groovy-mode))%20;;%20(add-to-list%20'auto-mode-alist%20(cons%20"\\.groovy\\'"%20'groovy-mode))%20;;%20;;%20This%20_might_%20not%20work%20with%20Aquamacs%20(not%20sure%20what%20value%20it%20offers)%20;;%20;(add-to-list%20'interpreter-mode-alist%20'("groovy"%20.%20groovy-mode))%20;;%20;(add-to-list%20'interpreter-mode-alist%20'("gradle"%20.%20groovy-mode))%20;;%20;;;%20make%20Groovy%20mode%20electric%20by%20default.%20;;%20(add-hook%20'groovy-mode-hook%20;;%20'(lambda%20()%20;;%20(require%20'groovy-electric)%20;;%20(groovy-electric-mode)))%20;;%20(require%20'gradle)%20(use-package%20gradle-mode%20:ensure%20t%20:diminish%20:config%20(setq%20gradle-gradlew-executable%20"./gradlew"%20gradle-use-gradlew%20t)%20(gradle-mode))%20#+end_src%20****%20TODO%20Flymake%20Need%20to%20start%20from%20scratch.%20I%20do%20have%20it%20for%20emacs%20but%20as%20code%20in%20org%20mode%20not%20an%20elisp%20file%20a%20bit%20of%20a%20waste%20#+begin_src%20emacs-lisp%20;;;;%20flymake%20-%20syntax%20checking%20(use-package%20flymake%20:disabled%20:diminish%20:hook%20((sh-mode%20json-mode%20nxml-mode%20python-mode%20emacs-lisp-mode%20lisp-interaction-mode)%20.%20flymake-mode-on)%20:config%20(flymake-mode-on))%20#+end_src%20**%20Git%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-prog-modes-git")%20#+end_src%20**%20Completion%20I%20need%20something%20and%20company%20seems%20to%20be%20the%20current%20one%20#+begin_src%20emacs-lisp%20;;%20Start%20completion%20(use-package%20company%20:ensure%20t%20:config%20(add-hook%20'after-init-hook%20'global-company-mode))%20#+end_src%20*%20Specific%20groups%20Where%20there%20is%20common%20put%20them%20together.%20This%20part%20is%20really%20why%20I%20have%20separate%20files%20so%20I%20can%20deal%20with%20one%20thing%20at%20a%20time%20**%20Lisp%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-lisp")%20#+end_src%20**%20Python%20Really%20need%20to%20start%20from%20scratch%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-prog-modes-python")][Aggressive indent:1]]
;;  Aggressive indent make indents as you type
(use-package
  aggressive-indent
  :ensure t
  :hook (emacs-lisp-mode . aggressive-indent-mode))
;; Aggressive indent:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::#+begin_src%20emacs-lisp%20(use-package%20ws-butler%20:ensure%20t%20:diminish%20ws-butler-mode%20:hook%20((prog-mode%20org-mode)%20.%20ws-butler-mode%20))%20#+end_src%20****%20TODO%20Need%20to%20look%20at%20this%20more%20**%20Build%20systems%20As%20Emacs%20is%20bad%20for%20java%20my%20java%20setup%20is%20now%20just%20gradle%20so%20that%20should%20be%20a%20generic%20build%20when%20I%20rename.%20#+begin_src%20emacs-lisp%20;;%20gradle%20and%20other%20java%20;;%20from%20http://www.coli.uni-saarland.de/~slemaguer/emacs/main.html#orgac34543%20(use-package%20groovy-mode%20:ensure%20t%20:mode%20("\.groovy$"%20"\.gradle$")%20:interpreter%20("gradle"%20"groovy")%20:config%20(autoload%20'run-groovy%20"inf-groovy"%20"Run%20an%20inferior%20Groovy%20process")%20(autoload%20'inf-groovy-keys%20"inf-groovy"%20"Set%20local%20key%20defs%20for%20inf-groovy%20in%20groovy-mode")%20;;%20Some%20keys%20for%20(add-hook%20'groovy-mode-hook%20'(lambda%20()%20(inf-groovy-keys))))%20;;%20Subpackages%20(use-package%20groovy-imports%20:ensure%20t)%20;;%20;;%20This%20does%20work%20with%20Aquamacs%20;;%20(add-to-list%20'auto-mode-alist%20(cons%20"\\.gradle\\'"%20'groovy-mode))%20;;%20(add-to-list%20'auto-mode-alist%20(cons%20"\\.groovy\\'"%20'groovy-mode))%20;;%20;;%20This%20_might_%20not%20work%20with%20Aquamacs%20(not%20sure%20what%20value%20it%20offers)%20;;%20;(add-to-list%20'interpreter-mode-alist%20'("groovy"%20.%20groovy-mode))%20;;%20;(add-to-list%20'interpreter-mode-alist%20'("gradle"%20.%20groovy-mode))%20;;%20;;;%20make%20Groovy%20mode%20electric%20by%20default.%20;;%20(add-hook%20'groovy-mode-hook%20;;%20'(lambda%20()%20;;%20(require%20'groovy-electric)%20;;%20(groovy-electric-mode)))%20;;%20(require%20'gradle)%20(use-package%20gradle-mode%20:ensure%20t%20:diminish%20:config%20(setq%20gradle-gradlew-executable%20"./gradlew"%20gradle-use-gradlew%20t)%20(gradle-mode))%20#+end_src%20****%20TODO%20Flymake%20Need%20to%20start%20from%20scratch.%20I%20do%20have%20it%20for%20emacs%20but%20as%20code%20in%20org%20mode%20not%20an%20elisp%20file%20a%20bit%20of%20a%20waste%20#+begin_src%20emacs-lisp%20;;;;%20flymake%20-%20syntax%20checking%20(use-package%20flymake%20:disabled%20:diminish%20:hook%20((sh-mode%20json-mode%20nxml-mode%20python-mode%20emacs-lisp-mode%20lisp-interaction-mode)%20.%20flymake-mode-on)%20:config%20(flymake-mode-on))%20#+end_src%20**%20Git%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-prog-modes-git")%20#+end_src%20**%20Completion%20I%20need%20something%20and%20company%20seems%20to%20be%20the%20current%20one%20#+begin_src%20emacs-lisp%20;;%20Start%20completion%20(use-package%20company%20:ensure%20t%20:config%20(add-hook%20'after-init-hook%20'global-company-mode))%20#+end_src%20*%20Specific%20groups%20Where%20there%20is%20common%20put%20them%20together.%20This%20part%20is%20really%20why%20I%20have%20separate%20files%20so%20I%20can%20deal%20with%20one%20thing%20at%20a%20time%20**%20Lisp%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-lisp")%20#+end_src%20**%20Python%20Really%20need%20to%20start%20from%20scratch%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-prog-modes-python")][Whitespace at end of line:1]]
(use-package ws-butler
  :ensure t
  :diminish ws-butler-mode
  :hook ((prog-mode org-mode) . ws-butler-mode ))
;; Whitespace at end of line:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::#+begin_src%20emacs-lisp%20;;%20gradle%20and%20other%20java%20;;%20from%20http://www.coli.uni-saarland.de/~slemaguer/emacs/main.html#orgac34543%20(use-package%20groovy-mode%20:ensure%20t%20:mode%20("\.groovy$"%20"\.gradle$")%20:interpreter%20("gradle"%20"groovy")%20:config%20(autoload%20'run-groovy%20"inf-groovy"%20"Run%20an%20inferior%20Groovy%20process")%20(autoload%20'inf-groovy-keys%20"inf-groovy"%20"Set%20local%20key%20defs%20for%20inf-groovy%20in%20groovy-mode")%20;;%20Some%20keys%20for%20(add-hook%20'groovy-mode-hook%20'(lambda%20()%20(inf-groovy-keys))))%20;;%20Subpackages%20(use-package%20groovy-imports%20:ensure%20t)%20;;%20;;%20This%20does%20work%20with%20Aquamacs%20;;%20(add-to-list%20'auto-mode-alist%20(cons%20"\\.gradle\\'"%20'groovy-mode))%20;;%20(add-to-list%20'auto-mode-alist%20(cons%20"\\.groovy\\'"%20'groovy-mode))%20;;%20;;%20This%20_might_%20not%20work%20with%20Aquamacs%20(not%20sure%20what%20value%20it%20offers)%20;;%20;(add-to-list%20'interpreter-mode-alist%20'("groovy"%20.%20groovy-mode))%20;;%20;(add-to-list%20'interpreter-mode-alist%20'("gradle"%20.%20groovy-mode))%20;;%20;;;%20make%20Groovy%20mode%20electric%20by%20default.%20;;%20(add-hook%20'groovy-mode-hook%20;;%20'(lambda%20()%20;;%20(require%20'groovy-electric)%20;;%20(groovy-electric-mode)))%20;;%20(require%20'gradle)%20(use-package%20gradle-mode%20:ensure%20t%20:diminish%20:config%20(setq%20gradle-gradlew-executable%20"./gradlew"%20gradle-use-gradlew%20t)%20(gradle-mode))%20#+end_src%20****%20TODO%20Flymake%20Need%20to%20start%20from%20scratch.%20I%20do%20have%20it%20for%20emacs%20but%20as%20code%20in%20org%20mode%20not%20an%20elisp%20file%20a%20bit%20of%20a%20waste%20#+begin_src%20emacs-lisp%20;;;;%20flymake%20-%20syntax%20checking%20(use-package%20flymake%20:disabled%20:diminish%20:hook%20((sh-mode%20json-mode%20nxml-mode%20python-mode%20emacs-lisp-mode%20lisp-interaction-mode)%20.%20flymake-mode-on)%20:config%20(flymake-mode-on))%20#+end_src%20**%20Git%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-prog-modes-git")%20#+end_src%20**%20Completion%20I%20need%20something%20and%20company%20seems%20to%20be%20the%20current%20one%20#+begin_src%20emacs-lisp%20;;%20Start%20completion%20(use-package%20company%20:ensure%20t%20:config%20(add-hook%20'after-init-hook%20'global-company-mode))%20#+end_src%20*%20Specific%20groups%20Where%20there%20is%20common%20put%20them%20together.%20This%20part%20is%20really%20why%20I%20have%20separate%20files%20so%20I%20can%20deal%20with%20one%20thing%20at%20a%20time%20**%20Lisp%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-lisp")%20#+end_src%20**%20Python%20Really%20need%20to%20start%20from%20scratch%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-prog-modes-python")][Build systems:1]]
;; gradle and other java
;; from http://www.coli.uni-saarland.de/~slemaguer/emacs/main.html#orgac34543

(use-package groovy-mode
  :ensure t
  :mode ("\.groovy$" "\.gradle$")
  :interpreter ("gradle" "groovy")
  :config
  (autoload 'run-groovy "inf-groovy" "Run an inferior Groovy process")
  (autoload 'inf-groovy-keys "inf-groovy" "Set local key defs for inf-groovy in groovy-mode")

  ;; Some keys for
  (add-hook 'groovy-mode-hook
            '(lambda ()
               (inf-groovy-keys))))

;; Subpackages
(use-package groovy-imports :ensure t)


;; ;; This does work with Aquamacs
;; (add-to-list 'auto-mode-alist (cons "\\.gradle\\'" 'groovy-mode))
;; (add-to-list 'auto-mode-alist (cons "\\.groovy\\'" 'groovy-mode))
;; ;; This _might_ not work with Aquamacs (not sure what value it offers)
;; ;(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
;; ;(add-to-list 'interpreter-mode-alist '("gradle" . groovy-mode))

;; ;;; make Groovy mode electric by default.
;; (add-hook 'groovy-mode-hook
;;           '(lambda ()
;;              (require 'groovy-electric)
;;              (groovy-electric-mode)))
;; (require 'gradle)

(use-package gradle-mode
  :ensure t
   :diminish
  :config
  (setq gradle-gradlew-executable "./gradlew"
        gradle-use-gradlew t)
  (gradle-mode))
;; Build systems:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::#+begin_src%20emacs-lisp%20;;;;%20flymake%20-%20syntax%20checking%20(use-package%20flymake%20:disabled%20:diminish%20:hook%20((sh-mode%20json-mode%20nxml-mode%20python-mode%20emacs-lisp-mode%20lisp-interaction-mode)%20.%20flymake-mode-on)%20:config%20(flymake-mode-on))%20#+end_src%20**%20Git%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-prog-modes-git")%20#+end_src%20**%20Completion%20I%20need%20something%20and%20company%20seems%20to%20be%20the%20current%20one%20#+begin_src%20emacs-lisp%20;;%20Start%20completion%20(use-package%20company%20:ensure%20t%20:config%20(add-hook%20'after-init-hook%20'global-company-mode))%20#+end_src%20*%20Specific%20groups%20Where%20there%20is%20common%20put%20them%20together.%20This%20part%20is%20really%20why%20I%20have%20separate%20files%20so%20I%20can%20deal%20with%20one%20thing%20at%20a%20time%20**%20Lisp%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-lisp")%20#+end_src%20**%20Python%20Really%20need%20to%20start%20from%20scratch%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-prog-modes-python")][Flymake:1]]
;;;; flymake - syntax checking
(use-package flymake
  :disabled
  :diminish
  :hook ((sh-mode json-mode nxml-mode python-mode emacs-lisp-mode lisp-interaction-mode) . flymake-mode-on)
  :config (flymake-mode-on))
;; Flymake:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-prog-modes-git")%20#+end_src%20**%20Completion%20I%20need%20something%20and%20company%20seems%20to%20be%20the%20current%20one%20#+begin_src%20emacs-lisp%20;;%20Start%20completion%20(use-package%20company%20:ensure%20t%20:config%20(add-hook%20'after-init-hook%20'global-company-mode))%20#+end_src%20*%20Specific%20groups%20Where%20there%20is%20common%20put%20them%20together.%20This%20part%20is%20really%20why%20I%20have%20separate%20files%20so%20I%20can%20deal%20with%20one%20thing%20at%20a%20time%20**%20Lisp%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-lisp")%20#+end_src%20**%20Python%20Really%20need%20to%20start%20from%20scratch%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-prog-modes-python")][Git:1]]
(mwb-init-load "mwb-init-prog-modes-git")
;; Git:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::#+begin_src%20emacs-lisp%20;;%20Start%20completion%20(use-package%20company%20:ensure%20t%20:config%20(add-hook%20'after-init-hook%20'global-company-mode))%20#+end_src%20*%20Specific%20groups%20Where%20there%20is%20common%20put%20them%20together.%20This%20part%20is%20really%20why%20I%20have%20separate%20files%20so%20I%20can%20deal%20with%20one%20thing%20at%20a%20time%20**%20Lisp%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-lisp")%20#+end_src%20**%20Python%20Really%20need%20to%20start%20from%20scratch%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-prog-modes-python")][Completion:1]]
;;  Start completion
(use-package
  company
  :ensure t
  :config (add-hook
		   'after-init-hook
		   'global-company-mode))
;; Completion:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-lisp")%20#+end_src%20**%20Python%20Really%20need%20to%20start%20from%20scratch%20#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-prog-modes-python")][Lisp:1]]
(mwb-init-load "mwb-init-lisp")
;; Lisp:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::#+begin_src%20emacs-lisp%20(mwb-init-load%20"mwb-init-prog-modes-python")][Python:1]]
(mwb-init-load "mwb-init-prog-modes-python")
;; Python:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::#+end_src%20**%20Structured%20data%20Do%20inline%20***%20XML%20This%20has%20been%20there%20for%20a%20long%20time%20(actually%20only%20after%20retirement%20I%20suppose%20I%20had%20XML-spy%20at%20work)%20Just%20a%20pretty%20print%20From%20http://blog.bookworm.at/2007/03/pretty-print-xml-with-emacs.html][XML:1]]
(defun nxml-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
        (backward-char) (insert "\n"))
      (indent-region begin end))
  (message "Ah, much better!"))
;; XML:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::#+end_src%20**%20Structured%20data%20Do%20inline%20***%20XML%20This%20has%20been%20there%20for%20a%20long%20time%20(actually%20only%20after%20retirement%20I%20suppose%20I%20had%20XML-spy%20at%20work)%20Just%20a%20pretty%20print%20From%20http://blog.bookworm.at/2007/03/pretty-print-xml-with-emacs.html%20#+begin_src%20emacs-lisp%20(defun%20nxml-pretty-print-xml-region%20(begin%20end)%20"Pretty%20format%20XML%20markup%20in%20region.%20You%20need%20to%20have%20nxml-mode%20http://www.emacswiki.org/cgi-bin/wiki/NxmlMode%20installed%20to%20do%20this.%20The%20function%20inserts%20linebreaks%20to%20separate%20tags%20that%20have%20nothing%20but%20whitespace%20between%20them.%20It%20then%20indents%20the%20markup%20by%20using%20nxml's%20indentation%20rules."%20(interactive%20"r")%20(save-excursion%20(nxml-mode)%20(goto-char%20begin)%20(while%20(search-forward-regexp%20"\>%5B%20\\t%5D*\<"%20nil%20t)%20(backward-char)%20(insert%20"\n"))%20(indent-region%20begin%20end))%20(message%20"Ah,%20much%20better!"))%20#+end_src%20***%20Json%20****%20Editing%20This%20is%20the%20standard%20mode][Editing:1]]
(use-package json-mode
  :ensure t
  :mode "\\.json$")
;; Editing:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::#+end_src%20**%20Structured%20data%20Do%20inline%20***%20XML%20This%20has%20been%20there%20for%20a%20long%20time%20(actually%20only%20after%20retirement%20I%20suppose%20I%20had%20XML-spy%20at%20work)%20Just%20a%20pretty%20print%20From%20http://blog.bookworm.at/2007/03/pretty-print-xml-with-emacs.html%20#+begin_src%20emacs-lisp%20(defun%20nxml-pretty-print-xml-region%20(begin%20end)%20"Pretty%20format%20XML%20markup%20in%20region.%20You%20need%20to%20have%20nxml-mode%20http://www.emacswiki.org/cgi-bin/wiki/NxmlMode%20installed%20to%20do%20this.%20The%20function%20inserts%20linebreaks%20to%20separate%20tags%20that%20have%20nothing%20but%20whitespace%20between%20them.%20It%20then%20indents%20the%20markup%20by%20using%20nxml's%20indentation%20rules."%20(interactive%20"r")%20(save-excursion%20(nxml-mode)%20(goto-char%20begin)%20(while%20(search-forward-regexp%20"\>%5B%20\\t%5D*\<"%20nil%20t)%20(backward-char)%20(insert%20"\n"))%20(indent-region%20begin%20end))%20(message%20"Ah,%20much%20better!"))%20#+end_src%20***%20Json%20****%20Editing%20This%20is%20the%20standard%20mode%20#+begin_src%20emacs-lisp%20(use-package%20json-mode%20:ensure%20t%20:mode%20"\\.json$")%20#+end_src%20****%20Visualisation%20See%20as%20a%20tree.][Visualisation:1]]
(use-package json-navigator
  :ensure t)
;; Visualisation:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::#+end_src%20**%20Structured%20data%20Do%20inline%20***%20XML%20This%20has%20been%20there%20for%20a%20long%20time%20(actually%20only%20after%20retirement%20I%20suppose%20I%20had%20XML-spy%20at%20work)%20Just%20a%20pretty%20print%20From%20http://blog.bookworm.at/2007/03/pretty-print-xml-with-emacs.html%20#+begin_src%20emacs-lisp%20(defun%20nxml-pretty-print-xml-region%20(begin%20end)%20"Pretty%20format%20XML%20markup%20in%20region.%20You%20need%20to%20have%20nxml-mode%20http://www.emacswiki.org/cgi-bin/wiki/NxmlMode%20installed%20to%20do%20this.%20The%20function%20inserts%20linebreaks%20to%20separate%20tags%20that%20have%20nothing%20but%20whitespace%20between%20them.%20It%20then%20indents%20the%20markup%20by%20using%20nxml's%20indentation%20rules."%20(interactive%20"r")%20(save-excursion%20(nxml-mode)%20(goto-char%20begin)%20(while%20(search-forward-regexp%20"\>%5B%20\\t%5D*\<"%20nil%20t)%20(backward-char)%20(insert%20"\n"))%20(indent-region%20begin%20end))%20(message%20"Ah,%20much%20better!"))%20#+end_src%20***%20Json%20****%20Editing%20This%20is%20the%20standard%20mode%20#+begin_src%20emacs-lisp%20(use-package%20json-mode%20:ensure%20t%20:mode%20"\\.json$")%20#+end_src%20****%20Visualisation%20See%20as%20a%20tree.%20#+begin_src%20emacs-lisp%20(use-package%20json-navigator%20:ensure%20t)%20#+end_src%20**%20SQL%20Not%20worth%20separating%20out.%20Note%20this%20is%20not%20the%20internal%20mode.%20It%20is%20from%20Emacs%20wiki%20as%20I%20like%20the%20interaction%20buffer%20better.%20Emacs'%20ones%20gave%20too%20many.%20Probably%20was%20my%20most%20use%20mode%20at%20work.%20As%20Java%20was%20Eclipse.%20Now%20I%20have%20no%20idea%20if%20it%20works][SQL:1]]
(autoload 'sql "sql-mode"
  "Start the interactive SQL interpreter in a new buffer." t)

(autoload 'sql-mode "sql-mode"
  "Mode for editing SQL files and running a SQL interpreter." t)

(autoload 'sql-buffer "sql-mode"
  "Create or move to the sql-mode \"*SQL commands*\" buffer." t)

(setq auto-mode-alist (cons '("\\.sql$" . sql-mode) auto-mode-alist))
;; SQL:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::#+end_src%20**%20Structured%20data%20Do%20inline%20***%20XML%20This%20has%20been%20there%20for%20a%20long%20time%20(actually%20only%20after%20retirement%20I%20suppose%20I%20had%20XML-spy%20at%20work)%20Just%20a%20pretty%20print%20From%20http://blog.bookworm.at/2007/03/pretty-print-xml-with-emacs.html%20#+begin_src%20emacs-lisp%20(defun%20nxml-pretty-print-xml-region%20(begin%20end)%20"Pretty%20format%20XML%20markup%20in%20region.%20You%20need%20to%20have%20nxml-mode%20http://www.emacswiki.org/cgi-bin/wiki/NxmlMode%20installed%20to%20do%20this.%20The%20function%20inserts%20linebreaks%20to%20separate%20tags%20that%20have%20nothing%20but%20whitespace%20between%20them.%20It%20then%20indents%20the%20markup%20by%20using%20nxml's%20indentation%20rules."%20(interactive%20"r")%20(save-excursion%20(nxml-mode)%20(goto-char%20begin)%20(while%20(search-forward-regexp%20"\>%5B%20\\t%5D*\<"%20nil%20t)%20(backward-char)%20(insert%20"\n"))%20(indent-region%20begin%20end))%20(message%20"Ah,%20much%20better!"))%20#+end_src%20***%20Json%20****%20Editing%20This%20is%20the%20standard%20mode%20#+begin_src%20emacs-lisp%20(use-package%20json-mode%20:ensure%20t%20:mode%20"\\.json$")%20#+end_src%20****%20Visualisation%20See%20as%20a%20tree.%20#+begin_src%20emacs-lisp%20(use-package%20json-navigator%20:ensure%20t)%20#+end_src%20**%20SQL%20Not%20worth%20separating%20out.%20Note%20this%20is%20not%20the%20internal%20mode.%20It%20is%20from%20Emacs%20wiki%20as%20I%20like%20the%20interaction%20buffer%20better.%20Emacs'%20ones%20gave%20too%20many.%20Probably%20was%20my%20most%20use%20mode%20at%20work.%20As%20Java%20was%20Eclipse.%20Now%20I%20have%20no%20idea%20if%20it%20works%20#+begin_src%20emacs-lisp%20(autoload%20'sql%20"sql-mode"%20"Start%20the%20interactive%20SQL%20interpreter%20in%20a%20new%20buffer."%20t)%20(autoload%20'sql-mode%20"sql-mode"%20"Mode%20for%20editing%20SQL%20files%20and%20running%20a%20SQL%20interpreter."%20t)%20(autoload%20'sql-buffer%20"sql-mode"%20"Create%20or%20move%20to%20the%20sql-mode%20\"*SQL%20commands*\"%20buffer."%20t)%20(setq%20auto-mode-alist%20(cons%20'("\\.sql$"%20.%20sql-mode)%20auto-mode-alist))%20#+end_src%20**%20C%20This%20is%20where%20I%20have%20really%20lost%20history%20there%20used%20to%20be%20all%20sorts%20of%20indenation%20rules.][C:1]]
;; objective C
(add-to-list 'auto-mode-alist '("\\.h$" . objc-mode) )
(add-to-list 'auto-mode-alist '("\\.m$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.mm$" . objc-mode))
;; C:1 ends here

;; [[file:~/Library/Preferences/Emacs/mwb-init-prog-modes.org::#+end_src%20**%20Structured%20data%20Do%20inline%20***%20XML%20This%20has%20been%20there%20for%20a%20long%20time%20(actually%20only%20after%20retirement%20I%20suppose%20I%20had%20XML-spy%20at%20work)%20Just%20a%20pretty%20print%20From%20http://blog.bookworm.at/2007/03/pretty-print-xml-with-emacs.html%20#+begin_src%20emacs-lisp%20(defun%20nxml-pretty-print-xml-region%20(begin%20end)%20"Pretty%20format%20XML%20markup%20in%20region.%20You%20need%20to%20have%20nxml-mode%20http://www.emacswiki.org/cgi-bin/wiki/NxmlMode%20installed%20to%20do%20this.%20The%20function%20inserts%20linebreaks%20to%20separate%20tags%20that%20have%20nothing%20but%20whitespace%20between%20them.%20It%20then%20indents%20the%20markup%20by%20using%20nxml's%20indentation%20rules."%20(interactive%20"r")%20(save-excursion%20(nxml-mode)%20(goto-char%20begin)%20(while%20(search-forward-regexp%20"\>%5B%20\\t%5D*\<"%20nil%20t)%20(backward-char)%20(insert%20"\n"))%20(indent-region%20begin%20end))%20(message%20"Ah,%20much%20better!"))%20#+end_src%20***%20Json%20****%20Editing%20This%20is%20the%20standard%20mode%20#+begin_src%20emacs-lisp%20(use-package%20json-mode%20:ensure%20t%20:mode%20"\\.json$")%20#+end_src%20****%20Visualisation%20See%20as%20a%20tree.%20#+begin_src%20emacs-lisp%20(use-package%20json-navigator%20:ensure%20t)%20#+end_src%20**%20SQL%20Not%20worth%20separating%20out.%20Note%20this%20is%20not%20the%20internal%20mode.%20It%20is%20from%20Emacs%20wiki%20as%20I%20like%20the%20interaction%20buffer%20better.%20Emacs'%20ones%20gave%20too%20many.%20Probably%20was%20my%20most%20use%20mode%20at%20work.%20As%20Java%20was%20Eclipse.%20Now%20I%20have%20no%20idea%20if%20it%20works%20#+begin_src%20emacs-lisp%20(autoload%20'sql%20"sql-mode"%20"Start%20the%20interactive%20SQL%20interpreter%20in%20a%20new%20buffer."%20t)%20(autoload%20'sql-mode%20"sql-mode"%20"Mode%20for%20editing%20SQL%20files%20and%20running%20a%20SQL%20interpreter."%20t)%20(autoload%20'sql-buffer%20"sql-mode"%20"Create%20or%20move%20to%20the%20sql-mode%20\"*SQL%20commands*\"%20buffer."%20t)%20(setq%20auto-mode-alist%20(cons%20'("\\.sql$"%20.%20sql-mode)%20auto-mode-alist))%20#+end_src%20**%20C%20This%20is%20where%20I%20have%20really%20lost%20history%20there%20used%20to%20be%20all%20sorts%20of%20indenation%20rules.%20#+begin_src%20emacs-lisp%20;;%20objective%20C%20(add-to-list%20'auto-mode-alist%20'("\\.h$"%20.%20objc-mode)%20)%20(add-to-list%20'auto-mode-alist%20'("\\.m$"%20.%20objc-mode))%20(add-to-list%20'auto-mode-alist%20'("\\.mm$"%20.%20objc-mode))%20#+end_src%20**%20Perl%20Possibly%20lost%20as%20I%20did%20have%20cperl%20at%20one%20time%20but%20from%20comments%20that%20might%20have%20been%20before%20heavy%20development][Perl:1]]
(setq auto-mode-alist
	  (cons '("\\.pl$" . perl-mode) auto-mode-alist))
(setq auto-mode-alist
	  (cons '("\\.pm$" . perl-mode) auto-mode-alist))

;; set keys
;(load-library "perldb")

(defun my-perl-mode-hook ()
  "My Perl settings"
  (define-key perl-mode-map [return] 'newline-and-indent )
  (define-key perl-mode-map [C-return] 'newline )
  (setq perl-indent-level 4)
  (setq perl-continued-statement-offset 4)
  (setq perl-continued-brace-offset -4)
  (setq perl-brace-offset 0)
  (setq perl-brace-imaginary-offset 0)
  (setq  perl-label-offset -2)
  (define-key perl-mode-map [f3] 'perldb )
;  (setq perldb-command-name "/run/pd/packages/perl/5.003/bin/perl")
;  (setq perldb-command-name "/sbcimp/run/pd/perl/prod/bin/perl")
  )
(add-hook 'perl-mode-hook 'my-perl-mode-hook)

;; perl debug
;; (defun my-perldb-mode-hook ()
;;   (setq perldb-command-name "/run/pd/packages/perl/5.003/bin/perl")
;; )
;; (add-hook 'perldb-mode-hook 'my-perldb-mode-hook)
;; Perl:1 ends here
