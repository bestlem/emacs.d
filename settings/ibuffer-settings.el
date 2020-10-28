(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ibuffer-expert t)
 '(ibuffer-fontification-alist
   (quote
    ((5
      (and buffer-file-name
           (buffer-modified-p))
      font-lock-warning-face)
     (10 buffer-read-only font-lock-string-face)
     (15
      (and buffer-file-name
           (string-match ibuffer-compressed-file-name-regexp buffer-file-name))
      font-lock-doc-face)
     (25
      (and
       (string-match "^ "
                     (buffer-name))
       (null buffer-file-name))
      italic)
     (35
      (derived-mode-p
       (quote dired-mode))
      font-lock-function-name-face)
     (40
      (and
       (boundp
        (quote emacs-lock-mode))
       emacs-lock-mode)
      ibuffer-locked-buffer))))
 '(ibuffer-help-buffer-modes
   (quote
    (help-mode helpful-mode apropos-mode Info-mode Info-edit-mode)))
 '(ibuffer-old-time 48))
