;; My own idea, but turns out it already existed:
;; https://github.com/larstvei/dot-emacs
;;
;; This file replaces itself with the actual configuration at first run.


;; Problem: it doesn't work if the org mode is not installed.
;; https://emacs.stackexchange.com/questions/28932/how-to-automate-installation-of-packages-with-emacs-file
(package-initialize)
(require 'package)

(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-refresh-contents)
(dolist (package '(use-package))
   (unless (package-installed-p package)
       (package-install package)))


; Now the org mode.
(use-package org
						 :ensure t)
(require 'org)

;; Open the configuration
(find-file (concat user-emacs-directory "init.org"))

;; Tangle it.
(org-babel-tangle)

;; Load it.
(load-file (concat user-emacs-directory "init.el"))

;; Finally byte-compile it.
(byte-compile-file (concat user-emacs-directory "init.el"))
